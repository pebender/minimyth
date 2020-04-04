GARNAME = tainted-build
GARVERSION =
CATEGORIES = tainted-build
LICENSE =

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	tainted-build/libc-crt
BUILDDEPS = \
	tainted-build/ccache \
	tainted-build/bash \
	tainted-build/coreutils \
	tainted-build/make \
	tainted-build/binutils \
	tainted-build/gcc \
	tainted-build/gcc-wrappers \
	tainted-build/clang \
	tainted-build/clang-wrappers \
	tainted-build/python \
	tainted-build/ninja \
	tainted-build/cmake

GAR_EXTRA_CONF += tainted-build/tainted-build/toolchain.mk
include ../../gar.mk
