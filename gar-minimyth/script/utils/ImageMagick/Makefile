GARNAME = ImageMagick
GARVERSION = 6.9.11-5
CATEGORIES = utils
MASTER_SITES = https://imagemagick.org/download/releases/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx build-tool/make \
	devel/libtool \
	lib/fftw3 \
	lib/fontconfig \
	lib/freetype \
	lib/libjpeg \
	lib/libpng \
	lib/libtiff \
	lib/libwebp \
	lib/libxml2 \
	lib/zlib \
	utils/bzip2 \
	xorg/libICE \
	xorg/libSM \
	xorg/libX11 \
	xorg/libXext \
	xorg/libXt

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile lib-wrappers

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes=$(DESTDIR)$(includedir) \
	--x-libraries=$(DESTDIR)$(libdir) \
	--disable-silent-rules \
	--enable-reproducible-build \
	--disable-openmp \
	--disable-opencl \
	--enable-shared \
	--disable-static \
	--disable-deprecated \
	--enable-installed \
	--enable-cipher \
	--disable-zero-configuration \
	--disable-hdri \
	--enable-pipes \
	--enable-assert \
	--enable-hugepages \
	--disable-ccmalloc \
	--disable-efence \
	--disable-prof \
	--disable-gprof \
	--disable-gcov \
	--disable-legacy-support \
	--enable-assert \
	--disable-docs \
	--without-gcc-arch \
	--with-sysroot=$(DESTDIR) \
	--with-modules \
	--with-utilitie \
	--without-perl \
	--with-bzlib \
	--with-x \
	--with-zlib \
	--without-dps \
	--with-fftw \
	--without-flif \
	--without-fpx \
	--without-djvu \
	--with-fontconfig \
	--with-freetype \
	--without-raqm \
	--without-gslib \
	--without-gvc \
	--without-heic \
	--without-jbig \
	--with-jpeg \
	--without-jxl \
	--without-lcms \
	--without-openjp2 \
	--without-lqr \
	--without-lzma \
	--without-openexr \
	--without-pango \
	--with-png \
	--with-raw \
	--without-rsvg \
	--with-tiff \
	--with-webp \
	--without-wmf \
	--with-xml
CONFIGURE_ENV = \
	im_cv_x_configure="$(DESTDIR)$(sharedstatedir)/X11"

include ../../gar.mk

CFLAGS := $(patsubst -march=%,,$(CFLAGS))
CFLAGS := $(patsubst -mtune=%,,$(CFLAGS))
CXXFLAGS := $(patsubst -march=%,,$(CXXFLAGS))
CXXFLAGS := $(patsubst -mtune=%,,$(CXXFLAGS))

install-lib-wrappers:
	@rm -fv $(DESTDIR)$(libdir)/libMagick++-6.Q16.la
	@rm -fv $(DESTDIR)$(libdir)/libMagickCore-6.Q16.la
	@rm -fv $(DESTDIR)$(libdir)/libMagickWand-6.Q16.la
	@rm -fv $(DESTDIR)$(libdir)/$(GARNAME)-$(word 1, $(subst -, ,$(GARVERSION)))/modules-Q16/coders/*.la
	@rm -fv $(DESTDIR)$(libdir)/$(GARNAME)-$(word 1, $(subst -, ,$(GARVERSION)))/modules-Q16/filters/*.la
	@$(MAKECOOKIE)
