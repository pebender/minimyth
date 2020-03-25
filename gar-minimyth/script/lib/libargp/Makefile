GARNAME = argp-standalone
GARVERSION = 1.3
CATEGORIES = lib
MASTER_SITES = https://www.lysator.liu.se/~nisse/misc/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = LGPL2_1

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk

x-post-install:
	@rm -f $(DESTDIR)$(libdir)/libexif.la
	@$(MAKECOOKIE)
