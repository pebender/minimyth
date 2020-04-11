GARNAME = libwebp
GARVERSION = 1.1.0
CATEGORIES = lib
MASTER_SITES = https://chromium.googlesource.com/webm/libwebp/+archive/refs/tags/
DISTFILES = v$(GARVERSION).tar.gz
LICENSE =

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/libjpeg lib/libpng lib/libtiff

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

EXTRACTDIR = $(WORKSRC)

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-gl \
	--disable-sdl \
	--enable-png \
	--enable-jpeg \
	--enable-tiff \
	--disable-gif \
	--disable-wic \
	--disable-libwebpmux \
	--enable-libwebpdemux \
	--disable-libwebpdecoder \
	--disable-libwebpextras

include ../../gar.mk

checksum-v$(GARVERSION).tar.gz:
	@$(MAKECOOKIE)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libwebp.la
	@rm -f $(DESTDIR)$(libdir)/libwebpdemux.la
	@$(MAKECOOKIE)
