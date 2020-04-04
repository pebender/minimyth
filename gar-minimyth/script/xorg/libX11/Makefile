GARNAME = libX11
GARVERSION = 1.6.9
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/lib/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES  = \
	$(DISTNAME)-pkg_config.patch \
	$(DISTNAME)-disable_nls_tests.patch
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/make \
	xorg/libxcb \
	xorg/util-macros \
	xorg/xorgproto \
	xorg/xtrans \
	xorg/xorg-sgml-doctools
BUILDDEPS =

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--enable-unix-transport \
	--disable-tcp-transport \
	--disable-ipv6 \
	--disable-local-transport \
	--disable-loadable-i18n \
	--enable-loadable-xcursor \
	--enable-xthreads \
	--disable-xcms \
	--enable-xlocale \
	--disable-xlocaledir \
	--enable-xf86bigfont \
	--enable-xkb \
	--disable-composecache \
	--enable-malloc0returnsnull \
	--with-keysymdefdir="$(DESTDIR)$(includedir)/X11" \
	--without-xmlto \
	--without-fop \
	--without-launchd

GAR_EXTRA_CONF += xorg/xorg/package-api.mk
include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)-xcb.la
	@$(MAKECOOKIE)
