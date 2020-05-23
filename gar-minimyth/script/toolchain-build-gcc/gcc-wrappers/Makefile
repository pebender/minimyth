GARNAME = gcc-wrappers
GARVERSION = unknown
CATEGORIES = toolchain-build-gcc
SOURCEPKG = toolchain/gcc-wrappers
LICENSE =

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	toolchain-build-gcc/binutils \
	toolchain-build-gcc/gcc

BUILD_SCRIPTS = wrappers
INSTALL_SCRIPTS = wrappers

build_DESTDIR = $(build_DESTDIR_swapped)
build_rootdir = $(build_rootdir_swapped)
DESTDIR = $(build_DESTDIR_swapped)
rootdir = $(build_rootdir_swapped)

GAR_EXTRA_CONF += toolchain/gcc-wrappers/package-api.mk
include ../../gar.mk
