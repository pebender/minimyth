GARNAME = coreutils
GARVERSION = $(COREUTILS_VERSION)
CATEGORIES = compiler-gcc
SOURCEPKG = utils/coreutils
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	native/native \
	compiler-cc/compiler-cc \
	ccache/ccache \
	compiler-gcc/bash

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-nls \
	--enable-rpath

GAR_EXTRA_CONF += compiler-gcc/compiler-gcc/toolchain.mk
GAR_EXTRA_CONF += utils/coreutils/package-api.mk
include ../../gar.mk
