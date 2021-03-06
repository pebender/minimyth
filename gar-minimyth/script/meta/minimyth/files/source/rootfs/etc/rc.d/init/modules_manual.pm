################################################################################
# modules_manual
################################################################################
package init::modules_manual;

use strict;
use warnings;

use File::Spec ();
use MiniMyth ();

sub start
{
    my $self     = shift;
    my $minimyth = shift;

    my $devnull = File::Spec->devnull;

    $minimyth->message_output('info', "loading kernel modules (manual) ...");

    # Load hardware based kernel modules that are not auto-detected.
    my @kernel_modules = split(/ +/, $minimyth->var_get('MM_HARDWARE_KERNEL_MODULE_LIST'));
    foreach my $kernel_module (@kernel_modules)
    {
        if (system(qq(/sbin/modprobe $kernel_module > $devnull 2>&1)) != 0)
        {
            $minimyth->message_output('warn', "failed to load kernel module: $kernel_module");
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
