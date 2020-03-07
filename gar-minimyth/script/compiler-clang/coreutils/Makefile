GARNAME = coreutils
GARVERSION = $(COREUTILS_VERSION)
CATEGORIES = compiler-clang
SOURCEPKG = utils/coreutils
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	native/native \
	ccache/ccache \
	compiler-gcc/compiler-gcc \
	compiler-clang/bash

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-nls \
	--enable-rpath

GAR_EXTRA_CONF += compiler-clang/compiler-clang/toolchain.mk
GAR_EXTRA_CONF += utils/coreutils/package-api.mk
include ../../gar.mk
