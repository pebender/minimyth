################################################################################
# font
################################################################################
package init::font;

use strict;
use warnings;

use File::Path ();
use MiniMyth ();

sub start
{
    my $self     = shift;
    my $minimyth = shift;

    if (($minimyth->var_get('MM_FONT_FILE_TTF_DELETE')) || ($minimyth->var_get('MM_FONT_FILE_TTF_ADD')))
    {
        $minimyth->message_output('info', "updating fonts ...");

        File::Path::mkpath('/usr/share/fonts/X11/TTF', { mode => 0755 });
        chmod(00755, '/usr/share/fonts/X11/TTF');
        File::Path::mkpath('/usr/share/mythtv', { mode => 0755 });
        chmod(00755, '/usr/share/mythtv');

        if ($minimyth->var_get('MM_FONT_FILE_TTF_DELETE'))
        {
            for (split(/ +/, $minimyth->var_get('MM_FONT_FILE_TTF_DELETE')))
            {
                unlink("/usr/share/fonts/X11/TTF/$_");
                unlink("/usr/share/mythtv/$_");
            }
        }
        if ($minimyth->var_get('MM_FONT_FILE_TTF_ADD'))
        {
            for (split(/ +/, $minimyth->var_get('MM_FONT_FILE_TTF_ADD')))
            {
                unlink("/usr/share/mythtv/$_");
                if (-e "/usr/share/fonts/X11/TTF/$_")
                {
                    symlink("/usr/share/fonts/X11/TTF/$_", "/usr/share/mythtv/$_");
                }
            }
        }
        system(qq(cd /usr/share/fonts/X11/TTF ; /usr/bin/mkfontscale ; /usr/bin/mkfontdir));
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
