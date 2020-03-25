GARNAME = clang-wrappers
GARVERSION = unknown
CATEGORIES = toolchain-wrappers
DISTFILES = \
	$(DESTIMG)-cpp \
	$(DESTIMG)-clang \
	$(DESTIMG)-clangxx \
	$(DESTIMG)-ld.lld
LICENSE = 

DESCRIPTION =
define BLURB
endef

BUILDDEPS = toolchain/toolchain

INSTALL_SCRIPTS = wrappers

build_DESTDIR = $(build_DESTDIR_swapped)
build_rootdir = $(build_rootdir_swapped)

include ../../gar.mk
