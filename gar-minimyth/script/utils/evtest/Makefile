GARNAME = evtest
GARVERSION = 1.32
CATEGORIES = utils
MASTER_SITES = https://gitlab.freedesktop.org/libevdev/evtest/-/archive/evtest-$(GARVERSION)/
DISTFILES = $(GARNAME)-$(DISTNAME).tar.bz2
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libxml2 lib/libxslt

WORKSRC = $(WORKDIR)/$(GARNAME)-$(DISTNAME)

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

checksum-$(DISTNAME).tar.gz:
	@$(MAKECOOKIE)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
