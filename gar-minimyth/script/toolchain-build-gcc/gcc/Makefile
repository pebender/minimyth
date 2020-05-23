GARNAME = gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = toolchain-build-gcc
SOURCEPKG = toolchain/gcc
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION = 
define BLURB
endef

CROSSIMG ?= $(DESTIMG)
GARTARGET = $($(CROSSIMG)_GARHOST)

ifeq ($(DESTIMG),build)
IMGDEPS = $(CROSSIMG)
$(CROSSIMG)_DEPENDS = toolchain-build-gcc/binutils
DEPENDS = lang/c lang/cxx lib/gmp lib/isl lib/mpc lib/mpfr
endif

CONFIGURE_ARGS = $(GCC_CONFIGURE_ARGS)

GAR_EXTRA_CONF += toolchain-build-gcc/toolchain-build-gcc/toolchain.mk
GAR_EXTRA_CONF += toolchain/gcc/package-api.mk
include ../../gar.mk

C := $(build_DESTDIR)$(build_bindir)/ccache.d/$(GARHOST)-clang
CXX := $(build_DESTDIR)$(build_bindir)/ccache.d/$(GARHOST)-clang++
CPP := $(build_DESTDIR)$(build_bindir)/$(GARHOST)-clang-cpp
LD := $(build_DESTDIR)$(build_bindir)/ld.bfd
OBJDUMP := $(build_DESTDIR)$(build_bindir)/objdump
OBJCOPY := $(build_DESTDIR)$(build_bindir)/objcopy
STRIP := $(build_DESTDIR)$(build_bindir)/strip
RANLIB := $(build_DESTDIR)$(build_bindir)/ranlib
READELF := $(build_DESTDIR)$(build_bindir)/readelf
NM := $(build_DESTDIR)$(build_bindir)/nm
AS := $(build_DESTDIR)$(build_bindir)/as
AR := $(build_DESTDIR)$(build_bindir)/ar
