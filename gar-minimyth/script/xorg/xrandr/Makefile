GARNAME = xrandr
GARVERSION = 1.5.1
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/app/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	xorg/libX11 \
	xorg/libXrandr \
	xorg/libXrender \
	xorg/xorgproto
	
CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules

include ../../gar.mk
