################################################################################
# cpu
################################################################################
package init::cpu;

use strict;
use warnings;

use File::Spec ();
use MiniMyth ();

sub start
{
    my $self     = shift;
    my $minimyth = shift;

    my $devnull = File::Spec->devnull;

    if ($minimyth->var_get('MM_CPU_FETCH_MICROCODE_DAT') eq 'yes')
    {
        $minimyth->message_output('info', "loading CPU microcode ...");

        if (! -e '/etc/firmware/microcode.dat')
        {
            $minimyth->message_output('err', "'/etc/firmware/microcode.dat' does not exist.");
            return 0;
        }

        my $kernel_module = 'microcode';
        if (system(qq(/sbin/modprobe $kernel_module > $devnull 2>&1)) != 0)
        {
            $minimyth->message_output('err', "failed to load kernel module: $kernel_module");
            return 0;
        }
        system(qq(/usr/bin/udevadm settle --timeout=60));
        if (! -e '/dev/cpu/microcode')
        {
            $minimyth->message_output('err', "'/dev/cpu/microcode' does not exist.");
            return 0;
        }
        if (! -e '/usr/sbin/microcode_ctl')
        {
            $minimyth->message_output('err', "'/usr/sbin/microcode_ctl' does not exist.");
            return 0;
        }
        if (system(qq(/usr/sbin/microcode_ctl -Q -f /etc/firmware/microcode.dat > $devnull 2>&1)) != 0)
        {
            $minimyth->message_output('err', "failed to load CPU microcode.");
            return 0;
        }
        system(qq(/sbin/modprobe -r $kernel_module));
    }

    $minimyth->message_output('info', "starting CPU frequency scaling ...");

    if ($minimyth->var_get('MM_CPU_FREQUENCY_GOVERNOR') ne 'performance')
    {
        if ((-d '/sys/devices/system/cpu') &&
            (opendir(DIR, '/sys/devices/system/cpu')))
        {
            foreach (grep(/^cpu[0-9]+$/, (readdir(DIR))))
            {
                if ((-f "/sys/devices/system/cpu/$_/cpufreq/scaling_governor") &&
                    (open(FILE, '>', "/sys/devices/system/cpu/$_/cpufreq/scaling_governor")))
                {
                    print FILE $minimyth->var_get('MM_CPU_FREQUENCY_GOVERNOR') . "\n";
                    close(FILE);
                }
            }
            closedir(DIR);
        }

        if ($minimyth->var_get('MM_CPU_FREQUENCY_GOVERNOR') eq 'userspace')
        {
            system(qq(/usr/sbin/powernowd > $devnull 2>&1));
        }
    }

    return 1;
}

sub stop
{
    my $self     = shift;
    my $minimyth = shift;

    $minimyth->message_output('info', "stopping CPU frequency scaling ...");

    $minimyth->application_stop('powernowd');

    if ((-d '/sys/devices/system/cpu') &&
        (opendir(DIR, '/sys/devices/system/cpu')))
    {
        foreach (grep(/^cpu[0-9]+$/, (readdir(DIR))))
        {
            if ((-f "/sys/devices/system/cpu/$_/cpufreq/scaling_governor") &&
                (open(FILE, '>', "/sys/devices/system/cpu/$_/cpufreq/scaling_governor")))
            {
                print FILE "performance" . "\n";
                close(FILE);
            }
        }
        closedir(DIR);
    }

    return 1;
}

1;
