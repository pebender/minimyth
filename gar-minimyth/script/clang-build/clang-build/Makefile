GARNAME = clang-build
VERSION = none
CATEGORIES = clang-build
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	clang-build/libffi \
	clang-build/zlib \
	clang-build/ncursesw
DEPENDS += \
	native/native \
	cc-build/ccache \
	clang-build/gcc-for-clang \
	clang-build/clang \
	clang-build/bash \
	clang-build/coreutils \
	clang-build/make \
	clang-build/python \
	clang-build/cmake \
	clang-build/ninja

GAR_EXTRA_CONF += clang-build/clang-build/toolchain.mk
include ../../gar.mk
