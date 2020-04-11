GARNAME = gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = tainted-main
SOURCEPKG = toolchain/gcc
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION = 
define BLURB
endef

CROSSIMG ?= $(DESTIMG)
GARTARGET = $($(CROSSIMG)_GARHOST)

ifeq ($(DESTIMG),build)
IMGDEPS += $(CROSSIMG)
$(CROSSIMG)_DEPENDS = \
	tainted-main/linux-headers \
	tainted-main/glibc-headers \
	tainted-main/binutils
BUILDDEPS = \
	native/native \
	tainted-build/tainted-build
endif

CONFIGURE_ARGS = $(GCC_CONFIGURE_ARGS) \
	--with-newlib \
	--disable-libatomic \
	--disable-libstdcxx \
	--disable-shared \
	--disable-host-shared \
	--enable-threads=no

GAR_EXTRA_CONF += toolchain/gcc/package-api.mk
GAR_EXTRA_CONF += tainted-main/tainted-main/toolchain.mk
include ../../gar.mk
