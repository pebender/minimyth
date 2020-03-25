GARNAME = fftw
GARVERSION = $(FFTW_VERSION)
CATEGORIES = lib
SOURCEPKG = lib/fftw3
LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/make
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-silent-rules \
	--enable-single \
	--disable-static \
	--enable-threads

GAR_EXTRA_CONF += lib/fftw3/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libfftw3f.la
	@rm -f $(DESTDIR)$(libdir)/libfftw3f_threads.la
	@$(MAKECOOKIE)
