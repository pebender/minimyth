GARNAME = binutils
GARVERSION = $(BINUTILS_VERSION)
CATEGORIES = toolchain-main
SOURCEPKG = toolchain/binutils
LICENSE = GPL2/LGPL2/GPL3/LGPL3

DESCRIPTION =
define BLURB
endef

ifeq ($(DESTIMG),build)
BUILDDEPS = \
	native/native \
	toolchain-build/toolchain-build
endif

CONFIGURE_ARGS = $(BINUTILS_CONFIGURE_ARGS)

GAR_EXTRA_CONF += toolchain-main/toolchain-main/toolchain-gcc.mk
GAR_EXTRA_CONF += toolchain/binutils/package-api.mk
include ../../gar.mk
