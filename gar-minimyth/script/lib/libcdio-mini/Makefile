GARNAME = libcdio-mini
GARVERSION = $(LIBCDIO_VERSION)
CATEGORIES = lib
SOURCEPKG = lib/libcdio
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx build-tool/make

WORKSRC = $(WORKDIR)/libcdio-$(GARVERSION)

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-cxx \
	--disable-cpp-progs \
	--enable-shared \
	--disable-static \
	--disable-rpath \
	--enable-joliet \
	--enable-rock \
	--disable-cddb \
	--disable-vcd-info \
	--without-cd-drive \
	--without-cd-info \
	--without-cdda-player \
	--without-cd-read \
	--without-iso-info \
	--without-iso-read

GAR_EXTRA_CONF += lib/libcdio/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libcdio.la
	@rm -f $(DESTDIR)$(libdir)/libcdio++.la
	@rm -f $(DESTDIR)$(libdir)/libiso9660.la
	@rm -f $(DESTDIR)$(libdir)/libiso9660++.la
	@rm -f $(DESTDIR)$(libdir)/libudf.la
	@$(MAKECOOKIE)
