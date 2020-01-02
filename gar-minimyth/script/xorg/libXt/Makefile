GARNAME = libXt
GARVERSION = 1.2.0
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/lib/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c \
	xorg/libICE \
	xorg/libSM \
	xorg/libX11 \
	xorg/util-macros \
	xorg/xorgproto

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--enable-malloc0returnsnull \
	--enable-specs \
	--enable-xkb \
	--enable-const \
	--disable-geo-tattler \
	--disable-unit-tests \
	--without-xmlto \
	--without-fop \
	--without-xsltproc \
	--with-perl \
	--without-glib
	
CONFIGURE_ENV = \
	CC_FOR_BUILD="$(build_CC)" \
	CPPFLAGS_FOR_BUILD="$(build_CPPFLAGS)" \
	CFLAGS_FOR_BUILD="$(build_CFLAGS)" \
	LDFLAGS_FOR_BUILD="$(build_LDFLAGS)"

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@$(MAKECOOKIE)
