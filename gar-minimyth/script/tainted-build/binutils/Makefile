GARNAME = binutils
GARVERSION = $(BINUTILS_VERSION)
CATEGORIES = tainted-build
SOURCEPKG = toolchain/binutils
LICENSE = GPL2/LGPL2/GPL3/LGPL3

DESCRIPTION =
define BLURB
endef

ifeq ($(DESTIMG),build)
DEPENDS = \
	tainted-build/libc-crt
BUILDDEPS = \
	native/native \
	tainted-build/cc \
	tainted-build/ccache \
	tainted-build/bash \
	tainted-build/coreutils \
	tainted-build/make
endif

CONFIGURE_ARGS = $(BINUTILS_CONFIGURE_ARGS)

GAR_EXTRA_CONF += tainted-build/tainted-build/toolchain.mk
GAR_EXTRA_CONF += toolchain/binutils/package-api.mk
include ../../gar.mk

CC := $(build_DESTDIR)$(build_bindir)/ccache.d/cc
CXX := $(build_DESTDIR)$(build_bindir)/ccache.d/c++
CPP := $(build_DESTDIR)$(build_bindir)/cpp
LD := $(build_DESTDIR)$(build_bindir)/ld

CPPFLAGS :=
CFLAGS :=
CXXFLAGS :=
LDFLAGS :=
