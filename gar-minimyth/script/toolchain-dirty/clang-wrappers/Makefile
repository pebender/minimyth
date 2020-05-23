GARNAME = clang-wrappers
GARVERSION = unknown
CATEGORIES = toolchain-dirty
SOURCEPKG = toolchain/clang-wrappers
LICENSE = 

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	toolchain-dirty/clang

BUILD_SCRIPTS = wrappers
INSTALL_SCRIPTS = wrappers

GAR_EXTRA_CONF += toolchain-dirty/toolchain-dirty/toolchain.mk
GAR_EXTRA_CONF += toolchain/clang-wrappers/package-api.mk
include ../../gar.mk
