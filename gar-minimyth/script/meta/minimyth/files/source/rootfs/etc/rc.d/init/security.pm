################################################################################
# security
################################################################################
package init::security;

use strict;
use warnings;

use File::Find ();
use Lchown qw(lchown);
use MiniMyth ();

sub start
{
    my $self     = shift;
    my $minimyth = shift;

    my $user_minimyth_uid = $minimyth->var_get('MM_SECURITY_USER_MINIMYTH_UID');
    my $user_minimyth_gid = $minimyth->var_get('MM_SECURITY_USER_MINIMYTH_GID');
    $minimyth->file_replace_variable(
        '/etc/passwd',
        { 'minimyth::1000:1000:' => "minimyth::$user_minimyth_uid:$user_minimyth_gid:" });
    $minimyth->file_replace_variable(
        '/etc/group',
        { 'minimyth:x:1000:' => "minimyth:x:$user_minimyth_gid:" });

    # Make sure that uid and gid for the home directory of user 'minimyth' are correct.
    {
        my $uid = getpwnam('minimyth');
        my $gid = getgrnam('minimyth');
        File::Find::finddepth(
            sub
            {
                if (((lstat($File::Find::name))[4] != $uid) || ((lstat(_))[5] != $gid))
                {
                    lchown($uid, $gid, $File::Find::name);
                }
            },
            '/home/minimyth');
    }

    if (-e '/etc/pki/tls/certs/ca-bundle.crt')
    {
        # Set permissions.
        chmod(00644, '/etc/pki/tls/certs/ca-bundle.crt');
        # Link to the default name.
        unlink('/etc/pki/tls/cert.pem');
        symlink('/etc/pki/tls/certs/ca-bundle.crt', '/etc/pki/tls/cert.pem');
    }

    if (-e '/etc/cifs/credentials_cifs')
    {
        # Set permissions.
        chmod(00600, '/etc/cifs/credentials_cifs');
    }

    return 1;
}

sub stop
{
    my $self     = shift;
    my $minimyth = shift;

    return 1;
}

1;
