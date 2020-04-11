GARNAME = gcc-wrappers
GARVERSION = unknown
CATEGORIES = toolchain-main-musl
SOURCEPKG = toolchain/gcc-wrappers
LICENSE = 

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	toolchain-main-musl/binutils \
	toolchain-main-musl/gcc

BUILD_SCRIPTS = wrappers
INSTALL_SCRIPTS = wrappers

GAR_EXTRA_CONF += toolchain-main-musl/toolchain-main-musl/toolchain-gcc.mk
GAR_EXTRA_CONF += toolchain/gcc-wrappers/package-api.mk
include ../../gar.mk
