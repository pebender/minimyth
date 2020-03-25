GARNAME = xcb-proto
GARVERSION = 1.13
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/xcb/
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
	--disable-silent-rules

GAR_EXTRA_CONF += xorg/xorg/package-api.mk
include ../../gar.mk

post-install:
	@sed -i 's%^xcbincludedir=%xcbincludedir=$(DESTDIR)%g' $(DESTDIR)$(libdir)/pkgconfig/xcb-proto.pc
	@sed -i 's%^pythondir=%pythondir=$(DESTDIR)%g'         $(DESTDIR)$(libdir)/pkgconfig/xcb-proto.pc
	@$(MAKECOOKIE)
