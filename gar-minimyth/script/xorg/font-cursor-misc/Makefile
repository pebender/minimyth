GARNAME = font-cursor-misc
GARVERSION = 1.0.3
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/font/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c \
	xorg/font-util \
	xorg/util-macros
BUILDDEPS = \
	xorg/bdftopcf \
	xorg/mkfontdir \
	xorg/mkfontscale

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules

include ../../gar.mk
