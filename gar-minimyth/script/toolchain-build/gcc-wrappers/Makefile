GARNAME = gcc-wrappers
GARVERSION = unknown
CATEGORIES = gcc-tooldchain
SOURCEPKG = toolchain/gcc-wrappers
LICENSE = 

DESCRIPTION =
define BLURB
endef

DEPENDS = toolchain-build/gcc

BUILD_SCRIPTS = wrappers
INSTALL_SCRIPTS = wrappers

build_DESTDIR = $(build_DESTDIR_swapped)
build_rootdir = $(build_rootdir_swapped)
DESTDIR = $(build_DESTDIR_swapped)
rootdir = $(build_rootdir_swapped)

GAR_EXTRA_CONF += toolchain/gcc-wrappers/package-api.mk
include ../../gar.mk
