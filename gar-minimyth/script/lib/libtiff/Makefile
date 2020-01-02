GARNAME = tiff
GARVERSION = 4.0.3
CATEGORIES = lib
MASTER_SITES  = https://download.osgeo.org/libtiff/
MASTER_SITES += https://download.osgeo.org/libtiff/old/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = libtiff
libtiff_LICENSE_TEXT = $(WORKSRC)/COPYRIGHT

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/zlib lib/libjpeg utils/xz

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--without-x

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libtiff.la
	@rm -f $(DESTDIR)$(libdir)/libtiffxx.la
	@$(MAKECOOKIE)
