GARNAME = make
GARVERSION = $(MAKE_VERSION)
CATEGORIES = gcc-build
SOURCEPKG = devel/make
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	native/native \
	cc-build/ccache \
	gcc-build/gcc \
	gcc-build/bash \
	gcc-build/coreutils

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-nls \
	--enable-rpath

GAR_EXTRA_CONF += gcc-build/gcc-build/toolchain.mk
GAR_EXTRA_CONF += devel/make/package-api.mk
include ../../gar.mk
