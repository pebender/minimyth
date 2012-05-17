################################################################################
# ssh_server
################################################################################
package init::ssh_server;

use strict;
use warnings;

use File::Copy ();
use File::Path ();
use MiniMyth ();

sub start
{
    my $self     = shift;
    my $minimyth = shift;

    $minimyth->message_output('info', "configuring ssh server ...");

    my $uid = getpwnam('root');
    my $gid = getgrnam('root');

    if (-e '/etc/ssh/sshd_config')
    {
        chmod(00600,      '/etc/ssh/sshd_config');
        chown($uid, $gid, '/etc/ssh/sshd_config');
    }

    if (-e '/etc/ssh/ssh_host_rsa_key')
    {
        chmod(00600,      '/etc/ssh/ssh_host_rsa_key');
        chown($uid, $gid, '/etc/ssh/ssh_host_rsa_key');
    }

    if (-e '/etc/ssh/authorized_keys')
    {
        chmod(00600,      '/etc/ssh/authorized_keys');
        chown($uid, $gid, '/etc/ssh/authorized_keys');

        File::Path::mkpath('/root/.ssh', { mode => 0755 });
        chmod(00755, '/root/.ssh');
        File::Copy::copy('/etc/ssh/authorized_keys', '/root/.ssh/authorized_keys');
        chmod(00600,      '/root/.ssh/authorized_keys');
        chown($uid, $gid, '/root/.ssh/authorized_keys');
    }

    if ($minimyth->var_get('MM_SSH_SERVER_ENABLED') eq 'yes')
    {
        if (! $minimyth->application_running('sshd'))
        {
            $minimyth->message_output('info', "starting ssh server ...");
            File::Path::mkpath('/var/empty', { mode => 0755 });
            system(qq(/usr/sbin/sshd));
        }
    }

    return 1;
}

sub stop
{
    my $self     = shift;
    my $minimyth = shift;

    $minimyth->application_stop('sshd', "stopping ssh server ...");

    return 1;
}

1;
