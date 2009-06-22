################################################################################
# video
################################################################################
package init::video;

use strict;
use warnings;
use feature "switch";

use MiniMyth ();

sub start
{
    my $self     = shift;
    my $minimyth = shift;

    $minimyth->message_output('info', "configuring video ...");

    my $deinterlacer = $minimyth->var_get('MM_VIDEO_DEINTERLACER');
    my $decoder      = $minimyth->var_get('MM_VIDEO_DECODER');
    my $xvmc_lib     = '';
    given ($minimyth->var_get('MM_X_DRIVER'))
    {
        when (/^intel_810$/)
        {
            ($decoder      eq 'auto') && ($decoder      = 'xvmc');
            ($deinterlacer eq 'auto') && ($deinterlacer = 'bobdeint');
            (-e '/usr/lib/libI810XvMC.so.1') && ($xvmc_lib = '/usr/lib/libI810XvMC.so.1');
        }
        when (/^intel_915$/)
        {
            ($decoder      eq 'auto') && ($decoder      = 'ffmpeg');
            ($deinterlacer eq 'auto') && ($deinterlacer = 'bobdeint');
            (-e '/usr/lib/libIntelXvMC.so.1') && ($xvmc_lib = '/usr/lib/libIntelXvMC.so.1');
        }
        when (/^nvidia$/)
        {
            ($decoder      eq 'auto') && ($decoder      = 'ffmpeg');
            ($deinterlacer eq 'auto') && ($deinterlacer = 'bobdeint');
            (-e '/usr/lib/nvidia/libXvMCNVIDIA_dynamic.so.1') && ($xvmc_lib = '/usr/lib/nvidia/libXvMCNVIDIA_dynamic.so.1');
            (-e '/usr/lib/nvidia/libXvMCNVIDIA.so.1')         && ($xvmc_lib = '/usr/lib/nvidia/libXvMCNVIDIA.so.1');
        }
        when (/^openchrome$/)
        {
            ($decoder      eq 'auto') && ($decoder      = 'xvmc-vld');
            ($deinterlacer eq 'auto') && ($deinterlacer = 'bobdeint');
            (-e '/usr/lib/libchromeXvMC.so.1') && ($xvmc_lib = '/usr/lib/libchromeXvMC.so.1');
        }
        when (/^radeon$/)
        {
            ($decoder      eq 'auto') && ($decoder      = 'ffmpeg');
            ($deinterlacer eq 'auto') && ($deinterlacer = 'bobdeint');
        }
        when (/^radeonhd$/)
        {
            ($decoder      eq 'auto') && ($decoder      = 'ffmpeg');
            ($deinterlacer eq 'auto') && ($deinterlacer = 'bobdeint');
        }
        when (/^savage$/)
        {
            ($decoder      eq 'auto') && ($decoder      = 'ffmpeg');
            ($deinterlacer eq 'auto') && ($deinterlacer = 'bobdeint');
        }
        when (/^sis$/)
        {
            ($decoder      eq 'auto') && ($decoder      = 'ffmpeg');
            ($deinterlacer eq 'auto') && ($deinterlacer = 'bobdeint');
        }
        when (/^vmware$/)
        {
            ($decoder      eq 'auto') && ($decoder      = 'ffmpeg');
            ($deinterlacer eq 'auto') && ($deinterlacer = 'bobdeint');
        }
    }
    $minimyth->file_replace_variable(
        '/etc/X11/XvMCConfig',
        { '@MM_XVMC_LIB@' => $xvmc_lib });

    if ( ($minimyth->var_get('MM_VERSION_MYTH_BINARY_MAJOR') ==  0) &&
         ($minimyth->var_get('MM_VERSION_MYTH_BINARY_MINOR') == 20) )
    {
         $minimyth->mythdb_settings_set('DeinterlaceFilter',     $deinterlacer);
         if ($decoder eq 'vdpau')
         {
             $minimyth->mythdb_settings_set('PreferredMPEG2Decoder', 'ffmpeg');
         }
         else
         {
             $minimyth->mythdb_settings_set('PreferredMPEG2Decoder', $decoder);
         }
    }
    else
    {
        if ($minimyth->var_get('MM_VIDEO_PLAYBACK_PROFILE'))
        {
            my %pref = ();
            $pref{'pref_max_cpus'} = 0;
            if (open(FILE, '<', '/proc/cpuinfo'))
            {
                foreach (grep(/^processor[[:cntrl:]]*:/, (<FILE>)))
                {
                    $pref{'pref_max_cpus'} += 1;
                }
            }
            if ($pref{'pref_max_cpus'} == 0)
            {
                $pref{'pref_max_cpus'} = 1;
            }
            $pref{'pref_cmp0'} = '> 0 0';
            $pref{'pref_cmp1'} = '';
            given ($decoder)
            {
                when (/^ffmpeg$/)
                {
                    $pref{'pref_decoder'}       = 'ffmpeg';
                    $pref{'pref_videorenderer'} = 'xv-blit';
                    $pref{'pref_osdrenderer'}   = 'softblend';
                    $pref{'pref_osdfade'}       = '0';
                }
                when (/^libmpeg2$/)
                {
                    $pref{'pref_decoder'}       = 'libmpeg2';
                    $pref{'pref_videorenderer'} = 'xv-blit';
                    $pref{'pref_osdrenderer'}   = 'softblend';
                    $pref{'pref_osdfade'}       = '0';
                }
                when (/^vdpau$/)
                {
                    $pref{'pref_decoder'}       = 'vdpau';
                    $pref{'pref_videorenderer'} = 'vdpau';
                    $pref{'pref_osdrenderer'}   = 'vdpau';
                    $pref{'pref_osdfade'}       = '0';
                }
                when (/^xvmc$/)
                {
                    $pref{'pref_decoder'}       = 'xvmc';
                    $pref{'pref_videorenderer'} = 'xvmc-blit';
                    $pref{'pref_osdrenderer'}   = 'ia44blend';
                    $pref{'pref_osdfade'}       = '0';
                }
                when (/^xvmc-vld$/)
                {
                    $pref{'pref_decoder'}       = 'xvmc-vld';
                    $pref{'pref_videorenderer'} = 'xvmc-blit';
                    $pref{'pref_osdrenderer'}   = 'ia44blend';
                    $pref{'pref_osdfade'}       = '0';
                }
                default
                {
                    $minimyth->message_output('err', "something is very wrong in the 'video' init script.");
                    return 0;
                }
            }
            $pref{'pref_deint0'}  = $deinterlacer;
            $pref{'pref_deint1'}  = 'none';
            $pref{'pref_filters'} = '';
            my $profilegroupid = $minimyth->mythdb_x_get('displayprofilegroups',
                                                         { 'name' => 'MiniMyth' },
                                                         'profilegroupid');
            my $profileid = '';
            if ($profilegroupid)
            {
                $profileid = $minimyth->mythdb_x_get('displayprofiles',
                                                     { 'profilegroupid' => $profilegroupid,
                                                       'value'          => 'pref_priority',
                                                       'data'           => '1' },
                                                     'profileid',
                                                     { 'condition_hostname' => 0 });
            }
            if ($profilegroupid)
            {
                $minimyth->mythdb_x_delete('displayprofiles',
                                           { 'profilegroupid' => $profilegroupid },
                                           { 'condition_hostname' => 0 });
            }
            if (($profilegroupid) && ($profileid))
            {
                $pref{'pref_priority'} = '1';
                foreach (keys %pref)
                {
                    $minimyth->mythdb_x_set('displayprofiles',
                                            { 'profilegroupid' => $profilegroupid,
                                              'profileid'      => $profileid,
                                              'value'          => $_ },
                                            'data',
                                            $pref{$_},
                                            { 'condition_hostname' => 0 });
                }
            }
            $minimyth->mythdb_settings_set('DefaultVideoPlaybackProfile', $minimyth->var_get('MM_VIDEO_PLAYBACK_PROFILE'));
        }
    }

    my $mplayer;
    my $video_driver;
    my $vdpau_true;
    my $vdpau_false;
    my $xvmc_true;
    my $xvmc_false;
    given ($decoder)
    {
        when (/^ffmpeg$/)
        {
            $mplayer      = 'mplayer-svn';
            $video_driver = 'xv';
            $vdpau_true   = '#';
            $vdpau_false  = '';
            $xvmc_true    = '#';
            $xvmc_false   = '';
        }
        when (/^libmpeg2$/)
        {
            $mplayer      = 'mplayer-svn';
            $video_driver = 'xv';
            $vdpau_true   = '#';
            $vdpau_false  = '';
            $xvmc_true    = '#';
            $xvmc_false   = '';
        }
        when (/^vdpau$/)
        {
            $mplayer      = 'mplayer-svn';
            $video_driver = 'vdpau';
            $vdpau_true   = '';
            $vdpau_false  = '#';
            $xvmc_true    = '#';
            $xvmc_false   = '';
        }
        when (/^xvmc$/)
        {
            $mplayer      = 'mplayer-svn';
            $video_driver = 'xvmc';
            $vdpau_true   = '#';
            $vdpau_false  = '';
            $xvmc_true    = '';
            $xvmc_false   = '#';
        }
        when (/^xvmc-vld$/)
        {
            $mplayer      = 'mplayer-vld';
            $video_driver = 'xxmc';
            $vdpau_true   = '#';
            $vdpau_false  = '';
            $xvmc_true    = '';
            $xvmc_false   = '#';
        }
        default
        {
            $minimyth->message_output('err', "something is very wrong in the 'video' init script.");
            return 0;
        }
    }

    my $deinterlace_by_default;
    my $deinterlace_plugin;
    my $bobdeint;
    given ($deinterlacer)
    {
        when (/^none$/)
        {
            $deinterlace_by_default = '0';
            $deinterlace_plugin     = 'none';
            $bobdeint               = '';
        }
        when (/^bobdeint|openglbobdeint|vdpaubobdeint$/)
        {
            $deinterlace_by_default = '1';
            $deinterlace_plugin     = 'ScalerBob';
            $bobdeint               = ':bobdeint';
        }
        default
        {
            $deinterlace_by_default = '1';
            $deinterlace_plugin     = 'LinearBlend';
            $bobdeint               = '';
        }
    }
    my $monitoraspect = $minimyth->var_get('MM_VIDEO_ASPECT_RATIO');

    if ( (! -e '/usr/bin/mplayer') && (qq(/usr/bin/$mplayer)) )
    {
        symlink($mplayer, '/usr/bin/mplayer');
    }

    $minimyth->file_replace_variable(
        '/home/minimyth/.xine/config',
        { '@VIDEO_DRIVER@'           => $video_driver,
          '@DEINTERLACE_BY_DEFAULT@' => $deinterlace_by_default,
          '@DEINTERLACE_PLUGIN@'     => $deinterlace_plugin });
    $minimyth->file_replace_variable(
        '/home/minimyth/.mplayer/config',
        { '@VDPAU_TRUE@'    => $vdpau_true,
          '@VDPAU_FALSE@'   => $vdpau_false,
          '@XVMC_TRUE@'     => $xvmc_true,
          '@XVMC_FALSE@'    => $xvmc_false,
          '@BOBDEINT@'      => $bobdeint,
          '@MONITORASPECT@' => $monitoraspect });
    $minimyth->file_replace_variable(
        '/home/minimyth/.config/vlc/vlcrc',
        { '@VDPAU_TRUE@'    => $vdpau_true,
          '@VDPAU_FALSE@'   => $vdpau_false });

    given ($minimyth->var_get('MM_VIDEO_RESIZE_ENABLED'))
    {
        when (/^no$/)
        {
            $minimyth->mythdb_settings_set('UseVideoModes', '0');

            $minimyth->mythdb_settings_delete('GuiVidModeResolution');
            $minimyth->mythdb_settings_delete('TvVidModeResolution');
            $minimyth->mythdb_settings_delete('TVVidModeRefreshRate');
            $minimyth->mythdb_settings_delete('TvVidModeForceAspect');

            $minimyth->mythdb_settings_delete('VidModeWidth0');
            $minimyth->mythdb_settings_delete('VidModeHeight0');
            $minimyth->mythdb_settings_delete('TVVidModeResolution0');
            $minimyth->mythdb_settings_delete('TVVidModeRefreshRate0');
            $minimyth->mythdb_settings_delete('TVVidModeForceAspect0');

            $minimyth->mythdb_settings_delete('VidModeWidth1');
            $minimyth->mythdb_settings_delete('VidModeHeight1');
            $minimyth->mythdb_settings_delete('TVVidModeResolution1');
            $minimyth->mythdb_settings_delete('TVVidModeRefreshRate1');
            $minimyth->mythdb_settings_delete('TVVidModeForceAspect1');

            $minimyth->mythdb_settings_delete('VidModeWidth2');
            $minimyth->mythdb_settings_delete('VidModeHeight2');
            $minimyth->mythdb_settings_delete('TVVidModeResolution2');
            $minimyth->mythdb_settings_delete('TVVidModeRefreshRate2');
            $minimyth->mythdb_settings_delete('TVVidModeForceAspect2');
        }
        when (/^yes$/)
        {
            $minimyth->mythdb_settings_set('GuiSizeForTV',  '0');
            $minimyth->mythdb_settings_set('UseVideoModes', '1');

            my $x_resolution;
            my $x_resolution_x;
            my $x_resolution_y;
            if ($minimyth->var_get('MM_X_MODE') =~ /^([0-9]+)x([0-9]+).*$/)
            {
                 $x_resolution   = "$1x$2";
                 $x_resolution_x = "$1";
                 $x_resolution_y = "$2";
            }
            $minimyth->mythdb_settings_set('GuiVidModeResolution', $x_resolution);
            $minimyth->mythdb_settings_set('TvVidModeResolution',  $x_resolution);
            $minimyth->mythdb_settings_set('TVVidModeRefreshRate', '0');
            $minimyth->mythdb_settings_set('TvVidModeForceAspect', '0.0');
            if ($minimyth->var_get('MM_X_MODE_0') ne 'none')
            {
                if ($minimyth->var_get('MM_X_MODE_0') =~ /^([0-9]+)x([0-9]+).*$/)
                {
                     $x_resolution   = "$1x$2";
                     $x_resolution_x = "$1";
                     $x_resolution_y = "$2";
                }
                $minimyth->mythdb_settings_set('VidModeWidth0',         $x_resolution_x);
                $minimyth->mythdb_settings_set('VidModeHeight0',        $x_resolution_y);
                $minimyth->mythdb_settings_set('TVVidModeResolution0',  $x_resolution);
                $minimyth->mythdb_settings_set('TVVidModeRefreshRate0', '0');
                $minimyth->mythdb_settings_set('TVVidModeForceAspect0', '0.0');
            }
            else
            {
                $minimyth->mythdb_settings_delete('VidModeWidth0');
                $minimyth->mythdb_settings_delete('VidModeHeight0');
                $minimyth->mythdb_settings_delete('TVVidModeResolution0');
                $minimyth->mythdb_settings_delete('TVVidModeRefreshRate0');
                $minimyth->mythdb_settings_delete('TVVidModeForceAspect0');
            }
            if ($minimyth->var_get('MM_X_MODE_1') ne 'none')
            {
                if ($minimyth->var_get('MM_X_MODE_1') =~ /^([0-9]+)x([0-9]+).*$/)
                {
                     $x_resolution   = "$1x$2";
                     $x_resolution_x = "$1";
                     $x_resolution_y = "$2";
                }
                $minimyth->mythdb_settings_set('VidModeWidth1',         $x_resolution_x);
                $minimyth->mythdb_settings_set('VidModeHeight1',        $x_resolution_y);
                $minimyth->mythdb_settings_set('TVVidModeResolution1',  $x_resolution);
                $minimyth->mythdb_settings_set('TVVidModeRefreshRate1', '0');
                $minimyth->mythdb_settings_set('TVVidModeForceAspect1', '0.0');
            }
            else
            {
                $minimyth->mythdb_settings_delete('VidModeWidth1');
                $minimyth->mythdb_settings_delete('VidModeHeight1');
                $minimyth->mythdb_settings_delete('TVVidModeResolution1');
                $minimyth->mythdb_settings_delete('TVVidModeRefreshRate1');
                $minimyth->mythdb_settings_delete('TVVidModeForceAspect1');
            }
            if ($minimyth->var_get('MM_X_MODE_2') ne 'none')
            {
                if ($minimyth->var_get('MM_X_MODE_2') =~ /^([0-9]+)x([0-9]+).*$/)
                {
                     $x_resolution   = "$1x$2";
                     $x_resolution_x = "$1";
                     $x_resolution_y = "$2";
                }
                $minimyth->mythdb_settings_set('VidModeWidth12',        $x_resolution_x);
                $minimyth->mythdb_settings_set('VidModeHeight2',        $x_resolution_y);
                $minimyth->mythdb_settings_set('TVVidModeResolution2',  $x_resolution);
                $minimyth->mythdb_settings_set('TVVidModeRefreshRate2', '0');
                $minimyth->mythdb_settings_set('TVVidModeForceAspect2', '0.0');
            }
            else
            {
                $minimyth->mythdb_settings_delete('VidModeWidth2');
                $minimyth->mythdb_settings_delete('VidModeHeight2');
                $minimyth->mythdb_settings_delete('TVVidModeResolution2');
                $minimyth->mythdb_settings_delete('TVVidModeRefreshRate2');
                $minimyth->mythdb_settings_delete('TVVidModeForceAspect2');
            }
        }
    }

    # Configure CPU features.
    if (-e '/usr/bin/vlc')
    {
        my %cpu_flags = ();
        if (open(FILE, '<', '/proc/cpuinfo'))
        {
            foreach (grep(/^flags[[:cntrl:]]*:/, (<FILE>)))
            {
                chomp;
                s/^flags[[:cntrl:]]*://;
                s/[[:cntrl:]]/ /g;
                s/  +/ /g;
                s/^ //;
                s/ $//;
                foreach (split(/ /, $_))
                {
                    $cpu_flags{$_} = 1;
                }
            }
        }
        $minimyth->file_replace_variable(
            '/home/minimyth/.config/vlc/vlcrc',
            { '@MM_VLC_VLCRC_3DN@'    => exists($cpu_flags{'3dnow'}) ? 1 : 0,
              '@MM_VLC_VLCRC_MMX@'    => exists($cpu_flags{'mmx'}) ? 1 : 0,
              '@MM_VLC_VLCRC_MMXEXT@' => exists($cpu_flags{'mmxext'}) ? 1 : 0,
              '@MM_VLC_VLCRC_SSE@'    => exists($cpu_flags{'sse'}) ? 1 : 0,
              '@MM_VLC_VLCRC_SSE2@'   => exists($cpu_flags{'sse2'}) ? 1 : 0 });
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
