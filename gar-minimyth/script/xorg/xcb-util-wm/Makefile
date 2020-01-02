GARNAME = xcb-util-wm
GARVERSION = 0.4.1
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/xcb/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	xorg/libxcb \
	xorg/xorgproto

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-devel-docs \
	--without-doxygen

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libxcb-ewmh.la
	@rm -f $(DESTDIR)$(libdir)/libxcb-icccm.la
	@$(MAKECOOKIE)
