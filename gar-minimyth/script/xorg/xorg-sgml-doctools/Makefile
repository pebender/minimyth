GARNAME = xorg-sgml-doctools
GARVERSION = 1.11
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/doc/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = \
	$(DISTNAME)-pkgconfig_dir.patch
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules

GAR_EXTRA_CONF += xorg/xorg/package-api.mk
include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
