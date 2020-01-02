GARNAME = libevdev
GARVERSION = 1.8.0
CATEGORIES = xorg
MASTER_SITES = https://www.freedesktop.org/software/libevdev/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared

include ../../gar.mk

post-install:
	@rm -fv $(DESTDIR)$(libdir)/$(GARNAME).la
	@$(MAKECOOKIE)
