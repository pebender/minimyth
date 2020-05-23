GARNAME = toolchain-dirty
GARVERSION =
CATEGORIES = toolchain-dirty
LICENSE =

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	toolchain-dirty/libc-crt
BUILDDEPS = \
	toolchain-dirty/ccache \
	toolchain-dirty/clang \
	toolchain-dirty/clang-wrappers \
	toolchain-dirty/bash \
	toolchain-dirty/coreutils \
	toolchain-dirty/make \
	toolchain-dirty/python \
	toolchain-dirty/ninja \
	toolchain-dirty/cmake

GAR_EXTRA_CONF += toolchain-dirty/toolchain-dirty/toolchain.mk
include ../../gar.mk
