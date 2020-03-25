GARNAME = lame
GARVERSION = 3.100
CATEGORIES = lib
MASTER_SITES = https://sourceforge.net/projects/$(GARNAME)/files/$(GARNAME)/$(GARVERSION)/
DISTFILES  = $(DISTNAME).tar.gz
DISTFILES += config.cache.$(GARCH_FAMILY)
LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/make lib/ncursesw
BUILDDEPS = devel/nasm

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--enable-shared \
	--disable-static \
	--enable-nasm \
	--disable-rpath \
	--disable-cpml \
	--disable-gtktest \
	--disable-efence \
	--disable-analyzer-hooks \
	--enable-decoder \
	--disable-frontend \
	--disable-mp3x \
	--disable-mp3rtp \
	--disable-dynamic-frontends \
	--enable-expopt=no \
	--enable-debug=no \
	--with-fileio=lame

include ../../gar.mk

PARALLELMFLAGS := -j1

extract-config.cache.$(GARCH_FAMILY):
	@cp $(DOWNLOADDIR)/config.cache.$(GARCH_FAMILY) $(WORKSRC)/config.cache
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libmp3lame.la
	@$(MAKECOOKIE)
