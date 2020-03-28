GARNAME = clang-wrappers
GARVERSION = unknown
CATEGORIES = toolchain-wrappers
DISTFILES = \
	$(DESTIMG)-clang-cpp \
	$(DESTIMG)-clang \
	$(DESTIMG)-clang++ \
	$(DESTIMG)-ld.lld
LICENSE = 

DESCRIPTION =
define BLURB
endef

BUILDDEPS = toolchain/toolchain

BUILD_SCRIPTS = wrappers
INSTALL_SCRIPTS = wrappers

build_DESTDIR = $(build_DESTDIR_swapped)
build_rootdir = $(build_rootdir_swapped)

include ../../gar.mk
