GARNAME = coreutils
GARVERSION = $(COREUTILS_VERSION)
CATEGORIES = toolchain-dirty
SOURCEPKG = utils/coreutils
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	toolchain-dirty/libc-crt
BUILDDEPS = \
	native/native \
	toolchain-dirty/ccache \
	toolchain-dirty/clang-wrappers \
	toolchain-dirty/bash

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-nls \
	--enable-rpath

GAR_EXTRA_CONF += toolchain-dirty/toolchain-dirty/toolchain.mk
GAR_EXTRA_CONF += utils/coreutils/package-api.mk
include ../../gar.mk
