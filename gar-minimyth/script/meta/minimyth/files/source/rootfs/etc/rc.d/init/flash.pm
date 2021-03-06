################################################################################
# version
################################################################################
package init::flash;

use strict;
use warnings;

use MiniMyth ();

sub start
{
    my $self     = shift;
    my $minimyth = shift;

    if ($minimyth->var_get('MM_FLASH_URL'))
    {
        $minimyth->message_output('info', "installing binary Adobe Flash Player ...");
        $minimyth->url_get($minimyth->var_get('MM_FLASH_URL'), '/usr/lib/browser/plugins/libflashplayer.so');
    }
    if (-f '/usr/lib/browser/plugins/libflashplayer.so')
    {
        chmod(00666, '/usr/lib/browser/plugins/libflashplayer.so');
        if (-e '/lib/ld-linux.so.2')
        {
            if (system(qq(/lib/ld-linux.so.2 --list /usr/lib/browser/plugins/libflashplayer.so > /dev/null 2>&1)) != 0)
            {
                $minimyth->message_output('err', 'Adobe Flash Player will fail because libraries are missing.')
            }
        }
        if (-e '/lib/ld-linux-x86-64.so.2')
        {
            if (system(qq(/lib/ld-linux-x86-64.so.2 --list /usr/lib/browser/plugins/libflashplayer.so > /dev/null 2>&1)) != 0)
            {
                $minimyth->message_output('err', 'Adobe Flash Player will fail because libraries are missing.')
            }
        }
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
