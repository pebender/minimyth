GARNAME = coreutils
GARVERSION = $(COREUTILS_VERSION)
CATEGORIES = clang-build
SOURCEPKG = utils/coreutils
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	native/native \
	cc-build/ccache \
	clang-build/clang \
	clang-build/clang-wrappers \
	clang-build/bash

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-nls \
	--enable-rpath

GAR_EXTRA_CONF += clang-build/clang-build/toolchain.mk
GAR_EXTRA_CONF += utils/coreutils/package-api.mk
include ../../gar.mk
