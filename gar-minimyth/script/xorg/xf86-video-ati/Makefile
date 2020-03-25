GARNAME = xf86-video-ati
GARVERSION = 19.1.0
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/driver/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS  = lang/c \
	xorg/libdrm \
	xorg/libpciaccess \
	xorg/util-macros \
	xorg/xorg-server \
	xorg/xorgproto \
	xorg/xorg-sgml-doctools
ifneq ($(DESTIMG),build)
DEPENDS += system/udev
endif
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--enable-udev \
	--enable-glamor

CONFIGURE_ENV = \
	XORG_SGML_PATH="$(DESTDIR)$(includedir)/xorg"

GAR_EXTRA_CONF += xorg/xorg/package-api.mk
include ../../gar.mk

post-install:
	@rm -fv $(DESTDIR)$(libdir)/xorg/modules/drivers/ati_drv.la
	@rm -fv $(DESTDIR)$(libdir)/xorg/modules/drivers/radeon_drv.la
	@$(MAKECOOKIE)
