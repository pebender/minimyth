GARNAME = toolchain-main
VERSION = none
CATEGORIES = toolchain-main
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	toolchain-main/linux-header \
	toolchain-main/glibc \
	toolchain-main/binutils \
	toolchain-main/gcc \
	toolchain-main/gcc-wrappers \
	toolchain-main/clang-wrappers

GAR_EXTRA_CONF += toolchain-main/toolchain-main/toolchain.mk
include ../../gar.mk
