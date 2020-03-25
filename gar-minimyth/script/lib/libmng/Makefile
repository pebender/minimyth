GARNAME = libmng
GARVERSION = $(LIBMNG_VERSION)
CATEGORIES = lib
MASTER_SITES = http://downloads.sourceforge.net/project/libmng/ligmng-devel/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-automake_1.12.patch
LICENSE = libmng
libmng_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libjpeg lib/zlib
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--enable-buildso \
	--enable-read \
	--enable-write \
	--enable-display \
	--enable-dynamic \
	--enable-chunks \
	--enable-storechunks \
	--disable-trace \
	--with-zlib \
	--with-jpeg \
	--without-lcms
	
include ../../gar.mk

pre-configure:
	@cp -fv $(WORKSRC)/makefiles/configure.in $(WORKSRC)
	@cp -fv $(WORKSRC)/makefiles/Makefile.am $(WORKSRC)
	@$(call RUN_AUTOTOOLS)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libmng.la
	@$(MAKECOOKIE)
