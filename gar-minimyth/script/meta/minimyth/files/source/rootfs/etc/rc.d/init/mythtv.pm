################################################################################
# mythtv
################################################################################
package init::mythtv;

use strict;
use warnings;
use feature "switch";

use File::Basename ();
use File::Find ();
use File::Path ();
use MiniMyth ();

sub start
{
    my $self     = shift;
    my $minimyth = shift;

    $minimyth->message_output('info', "configuring MythTV ...");

    # Set OSD fonts.
    $minimyth->mythdb_settings_set('OSDFont',   'FreeSans.ttf');
    $minimyth->mythdb_settings_set('OSDCCFont', 'FreeSans.ttf');

    given ($minimyth->var_get('MM_X_DRIVER'))
    {
        # Disable MythTV's use of OpenGL vertical sync when the intel Xorg driver
        # is used because it does not work.
        when (/^intel_810$/)
        {
            $minimyth->mythdb_settings_set('UseOpenGLVSync', '0');
        }
        when (/^intel_915$/)
        {
            $minimyth->mythdb_settings_set('UseOpenGLVSync', '0');
        }
        # Disable MythTV's use of OpenGL when the openchrome Xorg driver is used
        # because the unichrome_dri.so is unstable.
        when (/^openchrome$/)
        {
            $minimyth->mythdb_settings_set('SlideshowUseOpenGL', '0');
            $minimyth->mythdb_settings_set('ThemePainter', 'qt');
            $minimyth->mythdb_settings_set('UseOpenGLVSync', '0');
        }
    }

    my $theme_name = $minimyth->var_get('MM_THEME_NAME');
    my $theme_url  = $minimyth->var_get('MM_THEME_URL');
    # Set the MythTV theme.
    if ($theme_name)
    {
        $minimyth->mythdb_settings_set('Theme', $theme_name);
    }
    # Mount MythTV theme directory.
    if ($theme_url)
    {
        if (! $minimyth->url_mount($theme_url, "/home/minimyth/.mythtv/themes/$theme_name"))
        {
            $minimyth->message_output('err', "mount of 'MM_THEME_URL=$theme_url' failed.");
            return 0;
        }
    }

    given ($minimyth->var_get('MM_VERSION_MYTH_BINARY_MINOR'))
    {
        when (/^(22|23)$/)
        {
            my $themeosd_name = $minimyth->var_get('MM_THEMEOSD_NAME');
            my $themeosd_url  = $minimyth->var_get('MM_THEMEOSD_URL');
            # Set the MythTV OSD theme.
            if ($themeosd_name)
            {
                $minimyth->mythdb_settings_set('OSDTheme', $themeosd_name);
            }
            # Mount MythTV OSD theme directory.
            if ($themeosd_url)
            {
                if (! $minimyth->url_mount($themeosd_url, "/home/minimyth/.mythtv/themes/$themeosd_name"))
                {
                    $minimyth->message_output('err', "mount of 'MM_THEMEOSD_URL=$themeosd_url' failed.");
                    return 0;
                }
            }
        }
    }

    my $themecache_url  = $minimyth->var_get('MM_THEMECACHE_URL');
    # Mount themecache directory.
    if ($themecache_url)
    {
        $minimyth->url_mount($themecache_url, '/home/minimyth/.mythtv/themecache');
        # Make sure that uid and gid are for user 'minimyth'.
        # Make sure that the file ownership is correct.
        my $uid = getpwnam('minimyth');
        my $gid = getgrnam('minimyth');
        if (((stat('/home/minimyth/.mythtv/themecache'))[4] != $uid) || ((stat(_))[5] != $gid))
        {
            chown($uid, $gid, '/home/minimyth/.mythtv/themecache');
        }
        if (opendir(DIR, '/home/minimyth/.mythtv/themecache'))
        {
            foreach my $themecache (grep(! /^\./, (readdir(DIR))))
            {
                if (((stat(qq(/home/minimyth/.mythtv/themecache/$themecache)))[4] != $uid) || ((stat(_))[5] != $gid))
                {
                    File::Find::finddepth(
                        sub
                        {
                            if (((stat($File::Find::name))[4] != $uid) || ((stat(_))[5] != $gid))
                            {
                                chown($uid, $gid, $File::Find::name);
                            }
                        },
                        qq(/home/minimyth/.mythtv/themecache/$themecache));
                }
            }
            closedir(DIR);
        }
    }

    foreach (@{$minimyth->var_list({ 'filter' => 'MM_MYTHDB_JUMPPOINTS_.*' })})
    {
        if ($minimyth->var_get($_) =~ /^([^~]+)~([^~]*)$/)
        {
            $minimyth->mythdb_jumppoints_update($1, $2);
        }
    }

    # Configure Myth database keybindings to match MiniMyth.
    foreach (@{$minimyth->var_list({ 'filter' => 'MM_MYTHDB_KEYBINDINGS_.*' })})
    {
        if ($minimyth->var_get($_) =~ /^([^~]+)~([^~]+)~([^~]*)$/)
        {
            $minimyth->mythdb_keybindings_update($1, $2, $3);
        }
    }

    # Configure Myth database settings to match MiniMyth.
    foreach (@{$minimyth->var_list({ 'filter' => 'MM_MYTHDB_SETTINGS_.*' })})
    {
        if ($minimyth->var_get($_) =~ /^([^~]+)~([^~]*)$/)
        {
            $minimyth->mythdb_settings_set($1, $2);
        }
    }

    # Delete disabled plugins.
    if ($minimyth->var_get('MM_PLUGIN_INFORMATION_CENTER_ENABLED') eq 'no')
    {
        $minimyth->file_replace_variable(
            '/usr/share/mythtv/themes/defaultmenu/mainmenu.xml',
            { '<type>MENU_INFO_CENTER</type>' => '<type>MENU_INFO_CENTER</type><depends>disabled</depends>' });
    }
    if ($minimyth->var_get('MM_PLUGIN_OPTICAL_DISK_ENABLED') eq 'no')
    {
        $minimyth->file_replace_variable(
            '/usr/share/mythtv/themes/defaultmenu/mainmenu.xml',
            { '<depends>mythmusic mythvideo mytharchive mythburn</depends>' => '<depends>disabled</depends>' });
    }
    my %plugin_remove = ();
    $plugin_remove{'MM_PLUGIN_BROWSER_ENABLED'} =
        [ '/usr/lib/mythtv/plugins/libmythbrowser.so',
          '/usr/share/mythtv/browser*',
          '/usr/share/mythtv/mythbrowser*' ];
    $plugin_remove{'MM_PLUGIN_GALLERY_ENABLED'} =
        [ '/usr/lib/mythtv/plugins/libmythgallery.so',
          '/usr/share/mythtv/gallery*',
          '/usr/share/mythtv/mythgallery*' ];
    $plugin_remove{'MM_PLUGIN_GAME_ENABLED'} =
        [ '/usr/lib/mythtv/plugins/libmythgame.so',
          '/usr/share/mythtv/game*',
          '/usr/share/mythtv/mythgame*' ];
    $plugin_remove{'MM_PLUGIN_MUSIC_ENABLED'} =
        [ '/usr/lib/mythtv/plugins/libmythmusic.so',
          '/usr/share/mythtv/music*',
          '/usr/share/mythtv/mythmusic*' ];
    $plugin_remove{'MM_PLUGIN_NETVISION_ENABLED'} =
        [ '/usr/lib/mythtv/plugins/libmythnetvision.so',
          '/usr/share/mythtv/netvision*',
          '/usr/share/mythtv/mythnetvision*' ];
    $plugin_remove{'MM_PLUGIN_NEWS_ENABLED'} =
        [ '/usr/lib/mythtv/plugins/libmythnews.so',
          '/usr/share/mythtv/news*',
          '/usr/share/mythtv/mythnews*' ];
    $plugin_remove{'MM_PLUGIN_STREAM_ENABLED'} =
        [ '/usr/lib/mythtv/plugins/libmythstream.so',
          '/usr/share/mythtv/stream*',
          '/usr/share/mythtv/mythstream*' ];
    $plugin_remove{'MM_PLUGIN_VIDEO_ENABLED'} =
        [ '/usr/lib/mythtv/plugins/libmythvideo.so',
          '/usr/share/mythtv/video*',
          '/usr/share/mythtv/mythvideo*' ];
    $plugin_remove{'MM_PLUGIN_WEATHER_ENABLED'} =
        [ '/usr/lib/mythtv/plugins/libmythweather.so',
          '/usr/share/mythtv/weather*',
          '/usr/share/mythtv/mythweather*' ];
    given ($minimyth->var_get('MM_VERSION_MYTH_BINARY_MINOR'))
    {
        when (/^20$/)
        {
            $plugin_remove{'MM_PLUGIN_ZONEMINDER_ENABLED'} = [];
        }
        default
        {
            $plugin_remove{'MM_PLUGIN_ZONEMINDER_ENABLED'} =
                [ '/usr/lib/mythtv/plugins/libmythzoneminder.so',
                  '/usr/share/mythtv/zoneminder*',
                  '/usr/share/mythtv/mythzoneminder*' ];
        }
    }
    foreach my $plugin (keys %plugin_remove)
    {
        if ($minimyth->var_get($plugin) eq 'no')
        {
            foreach (@{$plugin_remove{$plugin}})
            {
                my $dir = File::Basename::dirname($_);
                if (opendir(DIR, $dir))
                {
                    my $filter = File::Basename::basename($_);
                    foreach (grep(/^$filter$/, readdir(DIR)))
                    {
                        if (-f qq($dir/$_))
                        {
                            unlink(qq($dir/$_));
                        }
                        else
                        {
                            File::Path::rmtree(qq($dir/$_));
                        }
                    }
                    closedir(DIR);
                }
            }
        }
    }

    # Check for libdvdcss.so.2
    if ($minimyth->var_get('MM_PLUGIN_VIDEO_ENABLED') eq 'yes')
    {
        my $found = 0;
        if ((-e '/etc/ld.so.conf') && (open(FILE, '<', '/etc/ld.so.conf')))
        {
            while (<FILE>)
            {
                chomp;
                if (-e "$_/libdvdcss.so.2")
                {
                    $found = 1;
                    last
                }
            }
            close(FILE);
        }
        if ($found == 0)
        {
            my $hostname = $minimyth->hostname();
            $minimyth->message_log('warn',
                                   "certain DVDs may not play. see <http://$hostname/minimyth/document-faq.html#dvd>");
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
