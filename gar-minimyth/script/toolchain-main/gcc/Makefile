GARNAME = gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = toolchain-main-gcc
SOURCEPKG = toolchain/gcc
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION = 
define BLURB
endef

CROSSIMG ?= $(DESTIMG)
GARTARGET = $($(CROSSIMG)_GARHOST)

ifeq ($(DESTIMG),build)
IMGDEPS = $(CROSSIMG)
$(CROSSIMG)_DEPENDS += \
	toolchain-main/binutils \
	toolchain-main/musl \
	toolchain-main/libunwind
DEPENDS = lang/c lang/cxx lib/gmp lib/isl lib/mpc lib/mpfr
BUILDDEPS =
endif

CONFIGURE_ARGS = $(GCC_CONFIGURE_ARGS) \
	--enable-clocale="generic" \
	--disable-libsanitizer

GAR_EXTRA_CONF += toolchain-main-gcc/toolchain-main-gcc/toolchain.mk
GAR_EXTRA_CONF += toolchain/gcc/package-api.mk
include ../../gar.mk
