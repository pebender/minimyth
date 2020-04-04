GARNAME = toolchain-build
VERSION = none
CATEGORIES = toolchain-build
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	toolchain-build/libc-crt \
	toolchain-build/binutils \
	toolchain-build/gcc \
	toolchain-build/gcc-wrappers \
	toolchain-build/clang \
	toolchain-build/clang-wrappers

GAR_EXTRA_CONF += toolchain-build/toolchain-build/toolchain.mk
include ../../gar.mk
