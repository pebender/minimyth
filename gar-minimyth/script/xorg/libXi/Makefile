GARNAME = libXi
GARVERSION = 1.7.10
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/lib/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c \
	xorg/libX11 \
	xorg/libXext \
	xorg/libXfixes \
	xorg/util-macros \
	xorg/xorgproto
BUILDDEPS = \
	xorg/xorg-sgml-doctools

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--disable-silent-rules \
	--disable-docs \
	--disable-specs \
	--enable-malloc0returnsnull \
	--without-xmlto \
	--without-fop \
	--without-xsltproc \
	--without-asciidoc

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@$(MAKECOOKIE)
