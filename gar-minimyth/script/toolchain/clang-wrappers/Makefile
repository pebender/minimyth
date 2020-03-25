GARNAME = clang-wrappers
GARVERSION = unknown
CATEGORIES = toolchain
SOURCEPKG = toolchain-wrappers/clang-wrappers
LICENSE =

DESCRIPTION =
define BLURB
endef

BUILDDEPS = toolchain/clang


INSTALL_SCRIPTS = wrappers

build_DESTDIR = $(build_DESTDIR_swapped)
build_rootdir = $(build_rootdir_swapped)

GAR_EXTRA_CONF += toolchain/toolchain/toolchain.mk
GAR_EXTRA_CONF += toolchain-wrappers/clang-wrappers/package-api.mk
include ../../gar.mk
