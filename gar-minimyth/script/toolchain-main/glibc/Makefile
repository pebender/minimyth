GARNAME = glibc
GARVERSION = $(GLIBC_VERSION)
CATEGORIES = toolchain-main
SOURCEPKG = toolchain/glibc
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

ifneq ($(DESTIMG),build)
DEPENDS = \
	tainted-main/tainted-main \
	toolchain-main/linux-headers
endif

build_DESTDIR = $(tainted_build_DESTDIR)
build_rootdir = $(tainted_build_rootdir)

CONFIGURE_SCRIPTS = $(GLIBC_CONFIGURE_SCRIPTS)
BUILD_SCRIPTS = $(GLIBC_BUILD_SCRIPTS)
INSTALL_SCRIPTS = $(GLIBC_INSTALL_SCRIPTS)

CONFIGURE_ARGS = $(GLIBC_CONFIGURE_ARGS)
INSTALL_ARGS = $(GLIBC_INSTALL_ARGS)\

GAR_EXTRA_CONF += toolchain/glibc/package-api.mk
GAR_EXTRA_CONF += toolchain-main/toolchain-main/toolchain-gcc.mk
include ../../gar.mk
