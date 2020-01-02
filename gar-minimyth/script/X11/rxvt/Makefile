GARNAME = rxvt
GARVERSION = 2.6.4
CATEGORIES = X11
MASTER_SITES = https://sourceforge.net/projects/rxvt/files/rxvt/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz config.cache.$(GARCH_FAMILY)
PATCHFILES = $(DISTNAME).patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c xorg/xorg 

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=./config.cache \
	--x-includes=$(DESTDIR)$(includedir) \
	--x-libraries=$(DESTDIR)$(libdir)

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

extract-config.cache.$(GARCH_FAMILY):
	@cp $(DOWNLOADDIR)/config.cache.$(GARCH_FAMILY) $(WORKSRC)/config.cache
	@$(MAKECOOKIE)
