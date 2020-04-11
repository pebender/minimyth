GARNAME = gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = tainted-build
SOURCEPKG = toolchain/gcc
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION =
define BLURB
endef

ifdef ($(CROSSIMG),build)
DEPENDS = \
	tainted-build/libc-crt
BUILDDEPS = \
	native/native \
	tainted-build/cc \
	tainted-build/ccache \
	tainted-build/bash \
	tainted-build/coreutils \
	tainted-build/make \
	tainted-build/binutils
endif

CONFIGURE_ARGS = $(GCC_CONFIGURE_ARGS)

GAR_EXTRA_CONF += tainted-build/tainted-build/toolchain.mk
GAR_EXTRA_CONF += toolchain/gcc/package-api.mk
include ../../gar.mk

CC := $(build_DESTDIR)$(build_bindir)/ccache.d/cc
CXX := $(build_DESTDIR)$(build_bindir)/ccache.d/c++
CPP := $(build_DESTDIR)$(build_bindir)/cpp
LD := $(build_DESTDIR)$(build_bindir)/ld.bfd

CPPFLAGS :=
CFLAGS :=
CXXFLAGS :=
LDFLAGS :=
