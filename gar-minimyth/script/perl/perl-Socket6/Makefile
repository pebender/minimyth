GARNAME             = perl-Socket6
GARVERSION          = 0.29
MASTER_SITES        = https://cpan.metacpan.org/authors/id/U/UM/UMEMOTO/
PERL_MODULE_PATCHES = configure.patch.gar

include ../../perl/perl/perl-module.mk

CONFIGURE_ENV += \
	ipv6_cv_can_inet_ntop=yes \
	socket6_cv_pl_sv_undef=yes
