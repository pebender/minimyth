GARNAME = gcc-wrappers
GARVERSION = unknown
CATEGORIES = toolchain-main-gcc
SOURCEPKG = toolchain/gcc-wrappers
LICENSE =

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	toolchain-main-gcc/binutils \
	toolchain-main-gcc/gcc

BUILD_SCRIPTS = wrappers
INSTALL_SCRIPTS = wrappers

GAR_EXTRA_CONF += toolchain-main-gcc/toolchain-main-gcc/toolchain.mk
GAR_EXTRA_CONF += toolchain/gcc-wrappers/package-api.mk
include ../../gar.mk
