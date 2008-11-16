#!/usr/bin/perl
################################################################################
# rc.pl
################################################################################

use strict;
use warnings;
use feature "switch";

require Cwd;
require Date::Manip;
require File::Basename;
require File::Spec;
require MiniMyth;

my @script_list_start =
(
    'ld',
    'loopback',
    'dhcp',
    'modules_automatic',
    'conf',
    'modules_manual',
    'log'
);
my @script_list_kill_halt =
(
    'shutdown',
    'halt'
);
my @script_list_kill_reboot =
(
    'shutdown',
    'reboot'
);

sub rc_script_list_run
{
    my $minimyth    = shift;
    my $phase       = shift;
    my $action      = shift;
    my $script_list = shift;

    my $dir = Cwd::abs_path(File::Basename::dirname(__FILE__));

    my $count;
    my $script;

    $count = $#{$script_list} + 1;
    given ($phase)
    {
        when (/^0$/) { $minimyth->splash_progress_set(0     , 2*$count); }
        when (/^1$/) { $minimyth->splash_progress_set($count, 2*$count); }
        when (/^2$/) { $minimyth->splash_progress_set(0     ,   $count); }
    }
    foreach (@{$script_list})
    {
        unshift(@INC, $dir);
        my $package = "init::$_";
        eval "require $package";
        # An error occured, so start a virtual console login and a telnet login.
        # This is a serious security hole, but users have difficulty debugging
        # when they cannot connect.
        my $result;
        given ($action)
        {
            when (/^start$/) { $result = $package->start($minimyth); }
            when (/^stop$/)  { $result = $package->stop($minimyth);  }
            default          { $result = 0; }
        }
        if (! $result )
        {
            if (! qx(/bin/pidof telnetd))
            {
                system('/usr/sbin/telnetd');
            }
            if (! qx(/bin/pidof agetty))
            {
                system('/sbin/agetty 9600 tty1 &');
            }
            return 0;
        }
        $minimyth->splash_progress_update();
    }
    return 1;
}

sub rc_run
{
    my $runlevel = shift;

    my $minimyth = new MiniMyth;

    $minimyth->var_load();

    # Redirect stderr and stdout to /var/log/minimyth.log,
    my $log_file = '/var/log/minimyth.log';
    if (! -e $log_file)
    {
        my $log_dir = File::Basename::dirname($log_file);
        if (! -e $log_dir)
        {
            File::Path::mkpath($log_dir);
        }
        if (-w $log_dir)
        {
            open(FILE, '>', $log_file);
            chmod(0666, $log_file);
            close(FILE);
        }
    }
    if (-e $log_file)
    {
        open(STDOUT, '>>', $log_file);
        open(STDERR, '>&', 'STDOUT');
    }

    my $dir = Cwd::abs_path(File::Basename::dirname(__FILE__));

    given ($runlevel)
    {
        when (/^1|2|3|4|5$/)
        {
            $minimyth->splash_init('bootup');
    
            rc_script_list_run($minimyth, 0, 'start', \@script_list_start) || return 0;
    
            my @script_list = ();
            if (opendir(DIR, "$dir/rc"))
            {
                @script_list = grep((/^S[0-9]+([^0-9].*)$/) && (-f "$dir/init/$1.pm"), (readdir(DIR)));
                close(DIR);
                @script_list = sort(@script_list);
                s/^S[0-9]+// foreach (@script_list);
            }
            rc_script_list_run($minimyth, 1, 'start', \@script_list) || return 0;
                
            $minimyth->splash_halt();

            if (open(FILE, '>>', '/init.log'))
            {
                Date::Manip::Date_Init("ConvTZ=UTC");
                my $date  = Date::Manip::UnixDate('now', '%Y-%m-%d %H:%M:%S %Z');
                print FILE "end   date and time: $date\n";
                close (FILE);
            }
        }
        when (/^0$/)
        {
            $minimyth->splash_init('shutdown');
    
            my @script_list = ();
            if (opendir(DIR, "$dir/rc"))
            {
                @script_list = grep((/^K[0-9]+([^0-9].*)$/) && (-f "$dir/init/$1.pm"), (readdir(DIR)));
                close(DIR);
                @script_list = sort(@script_list);
                s/^K[0-9]+// foreach (@script_list);
            }
            unshift(@script_list, 'conf');
            push(@script_list, @script_list_kill_halt);
            rc_script_list_run($minimyth, 2, 'stop', \@script_list) || return 0;
    
            $minimyth->splash_halt();
        }
        when (/^6$/)
        {
            $minimyth->splash_init('reboot');
    
            my @script_list = ();
            if (opendir(DIR, "$dir/rc"))
            {
                @script_list = grep((/^K[0-9]+([^0-9].*)$/) && (-f "$dir/init/$1.pm"), (readdir(DIR)));
                close(DIR);
                @script_list = sort(@script_list);
                s/^K[0-9]+// foreach (@script_list);
            }
            unshift(@script_list, 'conf');
            push(@script_list, @script_list_kill_reboot);
            rc_script_list_run($minimyth, 2, 'stop', \@script_list) || return 0;
    
            $minimyth->splash_halt();
        }
    }

    return 1;
}

my $runlevel = shift;

my $result = rc_run($runlevel);

if ($result == 0) { exit 1; }
else              { exit 0; }

1;
