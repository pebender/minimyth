GARNAME = gcc-wrappers
GARVERSION = unknown
CATEGORIES = tainted-main
SOURCEPKG = tainted-build/gcc-wrappers
LICENSE = 

DESCRIPTION =
define BLURB
endef

DEPENDS = tainted-main/gcc-static

BUILD_SCRIPTS = wrappers
INSTALL_SCRIPTS = wrappers

GAR_EXTRA_CONF += tainted-main/tainted-main/toolchain.mk
GAR_EXTRA_CONF += tainted-build/gcc-wrappers/package-api.mk
include ../../gar.mk
