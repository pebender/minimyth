GARNAME      = perl-libwww-perl
GARVERSION   = 6.16
MASTER_SITES = https://cpan.metacpan.org/authors/id/O/OA/OALDERS/
DEPENDS      = \
	perl/perl-Encode-Locale \
	perl/perl-File-Listing \
	perl/perl-HTTP-Cookies \
	perl/perl-HTTP-Daemon \
	perl/perl-HTTP-Date \
	perl/perl-HTTP-Negotiate \
	perl/perl-HTML-Parser \
	perl/perl-LWP-MediaTypes \
	perl/perl-Net-HTTP \
	perl/perl-Test-Fatal \
	perl/perl-Test-RequiresInternet \
	perl/perl-URI \
	perl/perl-WWW-RobotRules

include ../../perl/perl/perl-module.mk

CONFIGURE_ARGS += -n

CONFIGURE_ENV := echo N | $(CONFIGURE_ENV)
