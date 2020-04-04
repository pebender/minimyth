GARNAME = gcc-wrappers
GARVERSION = unknown
CATEGORIES = toolchain-main
SOURCEPKG = tainted-build/gcc-wrappers
LICENSE = 

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	toolchain-main/binutils \
	toolchain-main/gcc

BUILD_SCRIPTS = wrappers
INSTALL_SCRIPTS = wrappers

GAR_EXTRA_CONF += toolchain-main/toolchain-main/toolchain.mk
GAR_EXTRA_CONF += tainted-build/gcc-wrappers/package-api.mk
include ../../gar.mk
