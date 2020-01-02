GARNAME = eventlircd
GARVERSION = 20110816-8245391
CATEGORIES = system
MASTER_SITES = git://github.com/pebender/$(GARNAME).git/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME)-missing_break.patch $(DISTNAME)-event_codes_header.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c system/udev

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--with-udev-dir=$(libdir)/udev

include ../../gar.mk

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
