GARNAME = libsndfile
GARVERSION = 1.0.28
CATEGORIES = lib
MASTER_SITES = http://www.mega-nerd.com/libsndfile/files/
DISTFILES = $(DISTNAME).tar.gz
#PATCHFILES = $(DISTNAME)-configure.patch
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/alsa-lib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-experimental \
	--disable-werror \
	--disable-stack-smash-protection \
	--disable-sqlite \
	--enable-alsa \
	--disable-external-libs \
	--disable-octave \
	--enable-full-suite \
	--disable-test-coverage \
	--disable-shave

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libsndfile.la
	@$(MAKECOOKIE)
