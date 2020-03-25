GARNAME = autoconf
GARVERSION = 2.69
CATEGORIES = devel
MASTER_SITES = https://ftp.gnu.org/gnu/autoconf/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/make perl/perl

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--with-lispdir=$(lispdir)

include ../../gar.mk
