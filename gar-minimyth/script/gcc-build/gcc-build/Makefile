GARNAME = gcc-build
CATEGORIES = gcc-build
GARVERSION = none
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	gcc-build/libffi \
	gcc-build/zlib \
	gcc-build/ncursesw
DEPENDS += \
	gcc-build/gcc \
	gcc-build/gcc-wrappers \
	gcc-build/bash \
	gcc-build/coreutils \
	gcc-build/make \
	gcc-build/python \
	gcc-build/cmake \
	gcc-build/ninja

GAR_EXTRA_CONF += gcc-build/gcc-build/toolchain.mk
include ../../gar.mk
