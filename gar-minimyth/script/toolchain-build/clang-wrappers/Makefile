GARNAME = clang-wrappers
GARVERSION = unknown
CATEGORIES = toolchain-build
SOURCEPKG = toolchain/clang-wrappers
LICENSE =

DESCRIPTION =
define BLURB
endef

BUILDDEPS = toolchain-build/clang

BUILD_SCRIPTS = wrappers
INSTALL_SCRIPTS = wrappers

build_DESTDIR = $(build_DESTDIR_swapped)
build_rootdir = $(build_rootdir_swapped)
DESTDIR = $(build_DESTDIR_swapped)
rootdir = $(build_rootdir_swapped)

GAR_EXTRA_CONF += toolchain/clang-wrappers/package-api.mk
include ../../gar.mk
