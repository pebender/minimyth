GARNAME = libXmu
GARVERSION = 1.1.3
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/lib/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	xorg/libX11 \
	xorg/libXext \
	xorg/libXt \
	xorg/util-macros \
	xorg/xorgproto

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-docs \
	--enable-unix-transport \
	--disable-tcp-transport \
	--disable-ipv6 \
	--disable-local-transport \
	--without-xmlto \
	--without-fop \
	--without-xsltproc

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@rm -f $(DESTDIR)$(libdir)/libXmuu.la
	@$(MAKECOOKIE)
