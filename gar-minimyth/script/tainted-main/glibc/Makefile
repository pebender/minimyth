GARNAME = glibc
GARVERSION = $(GLIBC_VERSION)
CATEGORIES = tainted-main
SOURCEPKG = toolchain/glibc
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

ifneq ($(DESTIMG),build)
DEPENDS = \
	tainted-main/linux-headers \
	tainted-main/gcc-static \
	tainted-main/gcc-wrappers \
	tainted-main/binutils
BUILDDEPS = \
	native/native \
	tainted-build/tainted-build
endif

CONFIGURE_SCRIPTS = $(GLIBC_CONFIGURE_SCRIPTS)
BUILD_SCRIPTS = $(GLIBC_BUILD_SCRIPTS)
INSTALL_SCRIPTS = $(GLIBC_INSTALL_SCRIPTS)

CONFIGURE_ARGS = $(GLIBC_CONFIGURE_ARGS)
INSTALL_ARGS = $(GLIBC_INSTALL_ARGS)

GAR_EXTRA_CONF += toolchain/glibc/package-api.mk
GAR_EXTRA_CONF += tainted-main/tainted-main/toolchain.mk
include ../../gar.mk

pre-everything:
	echo "DEPENDS: $(DEPENDS)"
