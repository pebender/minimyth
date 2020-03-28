GARNAME = gcc-wrappers
GARVERSION = unknown
CATEGORIES = gcc-build
SOURCEPKG = toolchain-wrappers/gcc-wrappers
LICENSE = 

DESCRIPTION =
define BLURB
endef

BUILDDEPS = gcc-build/gcc

BUILD_SCRIPTS = wrappers
INSTALL_SCRIPTS = wrappers

GAR_EXTRA_CONF += gcc-build/gcc-build/toolchain.mk
GAR_EXTRA_CONF += toolchain-wrappers/gcc-wrappers/package-api.mk
include ../../gar.mk
