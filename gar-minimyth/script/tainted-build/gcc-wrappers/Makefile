GARNAME = gcc-wrappers
GARVERSION = unknown
CATEGORIES = tainted-build
SOURCEPKG = toolchain/gcc-wrappers
LICENSE = 

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS = wrappers
INSTALL_SCRIPTS = wrappers

DEPENDS = \
	tainted-build/binutils \
	tainted-build/gcc

GAR_EXTRA_CONF += tainted-build/tainted-build/toolchain.mk
GAR_EXTRA_CONF += toolchain/gcc-wrappers/package-api.mk
include ../../gar.mk
