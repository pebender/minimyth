GARNAME = xf86-input-void
GARVERSION = 1.4.1
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/driver/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	xorg/util-macros \
	xorg/xorg-server \
	xorg/xorgproto
BUILDDEPS = \
	xorg/xorg-sgml-doctools

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/input/void_drv.la
	@$(MAKECOOKIE)
