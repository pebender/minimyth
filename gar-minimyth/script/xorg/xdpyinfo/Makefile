GARNAME = xdpyinfo
GARVERSION = 1.3.2
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/app/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	xorg/libX11 \
	xorg/libXext \
	xorg/libXi \
	xorg/libXinerama \
	xorg/libXrender \
	xorg/libXtst \
	xorg/libXxf86vm

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--without-dga \
	--without-xf86misc \
	--with-xinerama \
	--without-dmx \
	--without-xprint

include ../../gar.mk
