GARNAME = font-util
GARVERSION = 1.3.2
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/font/
DISTFILES = $(DISTNAME).tar.bz2
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
	--disable-silent-rules \
	--with-fontrootdir="$(datadir)/fonts/X11" \
	--with-mapdir="$(datadir)/fonts/X11/util"

include ../../gar.mk
