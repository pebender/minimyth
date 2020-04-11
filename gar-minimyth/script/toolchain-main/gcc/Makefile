GARNAME = gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = toolchain-main
SOURCEPKG = toolchain/gcc
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION =
define BLURB
endef
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION = 
define BLURB
endef

ifeq ($(DESTIMG),build)
IMGDEPS += $(CROSSIMG)
$(CROSSIMG)_DEPENDS = \
	toolchain-main/binutils \
	toolchain-main/glibc
BUILDDEPS = \
	native/native \
	toolchain-build/toolchain-build
endif

CONFIGURE_ARGS = $(GCC_CONFIGURE_ARGS)

GAR_EXTRA_CONF += toolchain-main/toolchain-main/toolchain-gcc.mk
GAR_EXTRA_CONF += toolchain/gcc/package-api.mk
include ../../gar.mk
