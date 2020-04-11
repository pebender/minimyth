GARNAME = gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = toolchain-build
SOURCEPKG = toolchain/gcc
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION =
define BLURB
endef
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION = 
define BLURB
endef

ifeq ($(CROSSIMG),build)
DEPENDS = \
	toolchain-build/binutils
BUILDDEPS = \
	native/native \
	tainted-build/tainted-build
endif

CONFIGURE_ARGS = $(GCC_CONFIGURE_ARGS)

GAR_EXTRA_CONF += toolchain-build/toolchain-build/toolchain.mk
GAR_EXTRA_CONF += toolchain/gcc/package-api.mk
include ../../gar.mk

CC := $(build_DESTDIR)$(build_bindir)/ccache.d/$(build_GARHOST)-gcc
CXX := $(build_DESTDIR)$(build_bindir)/ccache.d/$(build_GARHOST)-g++
CPP := $(build_DESTDIR)$(build_bindir)/wrapper.d/$(build_GARHOST)-cpp
LD := $(build_DESTDIR)$(build_bindir)/wrapper.d/$(build_GARHOST)-ld.bfd
OBJDUMP := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-objdump
OBJCOPY := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-objcopy
STRIP := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-strip
RANLIB := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-ranlib
READELF := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-readelf
NM := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-nm
AS := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-as
AR := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-ar
