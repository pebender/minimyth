GARNAME           = perl-Module-Build-Tiny
GARVERSION        = 0.039
MASTER_SITES      = https://cpan.metacpan.org/authors/id/L/LE/LEONT/
PERL_MODULE_STYLE = Build.PL
DEPENDS           = \
	perl/perl-CPAN-Meta \
	perl/perl-CPAN-Meta-Requirements \
	perl/perl-CPAN-Meta-YAML \
	perl/perl-ExtUtils-Config \
	perl/perl-ExtUtils-Helpers \
	perl/perl-ExtUtils-InstallPaths \
	perl/perl-JSON-PP

include ../../perl/perl/perl-module.mk

post-configure:
	@sed -e 's%^# *!.*perl%#!$(build_DESTDIR)$(build_bindir)/perl%' -i $(WORKSRC)/Build
