GARNAME = gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = tainted-main
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
	tainted-main/glibc
endif

CONFIGURE_ARGS = $(GCC_CONFIGURE_ARGS)

GAR_EXTRA_CONF += toolchain/gcc/package-api.mk
GAR_EXTRA_CONF += tainted-main/tainted-main/toolchain.mk
include ../../gar.mk
