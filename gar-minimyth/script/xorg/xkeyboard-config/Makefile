GARNAME = xkeyboard-config
GARVERSION = 2.28
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/data/xkeyboard-config/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = \
	$(DISTNAME)-pkgconfig_dir.patch
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	xorg/libX11 \
	xorg/xorgproto
BUILDDEPS = \
	perl/perl-XML-Parser \
	xorg/xkbcomp

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-compat-rules \
	--enable-nls \
	--disable-rpath \
	--without-xsltproc \
	--with-xkb-base="$(datadir)/X11/xkb" \
	--without-xkb-rules-symlink

GAR_EXTRA_CONF += xorg/xorg/package-api.mk
include ../../gar.mk
