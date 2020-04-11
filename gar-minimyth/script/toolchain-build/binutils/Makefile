GARNAME = binutils
GARVERSION = $(BINUTILS_VERSION)
CATEGORIES = toolchain-build
SOURCEPKG = toolchain/binutils
LICENSE = GPL2/LGPL2/GPL3/LGPL3

DESCRIPTION =
define BLURB
endef

ifeq ($(DESTIMG),build)
BUILDDEPS = \
	native/native \
	tainted-build/tainted-build
endif

CONFIGURE_ARGS = $(BINUTILS_CONFIGURE_ARGS)

GAR_EXTRA_CONF += toolchain-build/toolchain-build/toolchain.mk
GAR_EXTRA_CONF += toolchain/binutils/package-api.mk
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
