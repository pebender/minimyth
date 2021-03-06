################################################################################
# wiimote
################################################################################
package init::wiimote;

use strict;
use warnings;

use File::Spec ();
use MiniMyth ();

sub start
{
    my $self     = shift;
    my $minimyth = shift;

    my $address_0 = $minimyth->var_get('MM_WIIMOTE_ADDRESS_0');
    my $address_1 = $minimyth->var_get('MM_WIIMOTE_ADDRESS_1');
    my $address_2 = $minimyth->var_get('MM_WIIMOTE_ADDRESS_2');
    my $address_3 = $minimyth->var_get('MM_WIIMOTE_ADDRESS_3');

    if (($address_0) || ($address_1) || ($address_2) || ($address_3))
    {
        $minimyth->message_output('info', "starting wminput ...");

        my $devnull = File::Spec->devnull;

        if ($address_0)
        {
            my $config = undef;
            if (-e '/etc/cwiid/wminput/default_0')
            {
                $config = '/etc/cwiid/wminput/default_0';
            }
            else
            {
                $minimyth->message_output('err', "no 'wminput' config file found.");
                return 0;
            }
            my $running = 0;
            if (open(FILE, '-|', q(/usr/bin/hcitool con 2> /dev/null)))
            {
                while (<FILE>)
                {
                    chomp;
                    if (/^[[:cntrl:]]*< ACL $address_0/)
                    {
                        $running = 1;
                        last;
                    }
                }
                close(FILE);
            }
            if (! $running)
            {
                system(qq(/usr/bin/wminput -d -c $config $address_0 > $devnull 2>&1 &));
            }
            else
            {
                $minimyth->message_log('info', qq(Wiimote 0 \(address: $address_0\) not started because it is already running));
            }
        }
        if ($address_1)
        {
            my $config = undef;
            if (-e '/etc/cwiid/wminput/default_1')
            {
                $config = '/etc/cwiid/wminput/default_1';
            }
            else
            {
                $minimyth->message_output('err', "no 'wminput' config file found.");
                return 0;
            }
            my $running = 0;
            if (open(FILE, '-|', q(/usr/bin/hcitool con 2> /dev/null)))
            {
                while (<FILE>)
                {
                    chomp;
                    if (/^[[:cntrl:]]*< ACL $address_1/)
                    {
                        $running = 1;
                        last;
                    }
                }
                close(FILE);
            }
            if (! $running)
            {
                system(qq(/usr/bin/wminput -d -c $config $address_1 > $devnull 2>&1 &));
            }
            else
            {
                $minimyth->message_log('info', qq(Wiimote 1 \(address: $address_1\) not started because it is already running));
            }
        }
        if ($address_2)
        {
            my $config = undef;
            if (-e '/etc/cwiid/wminput/default_2')
            {
                $config = '/etc/cwiid/wminput/default_2';
            }
            else
            {
                $minimyth->message_output('err', "no 'wminput' config file found.");
                return 0;
            }
            my $running = 0;
            if (open(FILE, '-|', q(/usr/bin/hcitool con 2> /dev/null)))
            {
                while (<FILE>)
                {
                    chomp;
                    if (/^[[:cntrl:]]*< ACL $address_2/)
                    {
                        $running = 1;
                        last;
                    }
                }
                close(FILE);
            }
            if (! $running)
            {
                system(qq(/usr/bin/wminput -d -c $config $address_2 > $devnull 2>&1 &));
            }
            else
            {
                $minimyth->message_log('info', qq(Wiimote 2 \(address: $address_2\) not started because it is already running));
            }
        }
        if ($address_3)
        {
            my $config = undef;
            if (-e '/etc/cwiid/wminput/default_3')
            {
                $config = '/etc/cwiid/wminput/default_3';
            }
            else
            {
                $minimyth->message_output('err', "no 'wminput' config file found.");
                return 0;
            }
            my $running = 0;
            if (open(FILE, '-|', q(/usr/bin/hcitool con 2> /dev/null)))
            {
                while (<FILE>)
                {
                    chomp;
                    if (/^[[:cntrl:]]*< ACL $address_3/)
                    {
                        $running = 1;
                        last;
                    }
                }
                close(FILE);
            }
            if (! $running)
            {
                system(qq(/usr/bin/wminput -d -c $config $address_3 > $devnull 2>&1 &));
            }
            else
            {
                $minimyth->message_log('info', qq(Wiimote 3 \(address: $address_3\) not started because it is already running));
            }
        }
    }

    return 1;
}


sub stop
{
    my $self     = shift;
    my $minimyth = shift;

    $minimyth->application_stop('wminput', "stopping wminput ...");

    return 1;
}

1;
