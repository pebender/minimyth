GARNAME = xf86-video-vmware
GARVERSION = 13.3.0
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/driver/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c xorg/libdrm \
	xorg/libdrm \
	xorg/libpciaccess \
	xorg/libX11 \
	xorg/libXext \
	xorg/util-macros \
	xorg/xorg-server \
	xorg/xorgproto \
	xorg/xorg-sgml-doctools
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared

GAR_EXTRA_CONF += xorg/xorg/package-api.mk
include ../../gar.mk

post-install:
	@rm -fv $(DESTDIR)$(libdir)/xorg/modules/drivers/vmware_drv.la
	@$(MAKECOOKIE)
