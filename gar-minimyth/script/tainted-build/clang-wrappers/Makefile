GARNAME = clang-wrappers
GARVERSION = unknown
CATEGORIES = tainted-build
SOURCEPKG = toolchain/clang-wrappers
LICENSE = 

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	tainted-build/clang

BUILD_SCRIPTS = wrappers
INSTALL_SCRIPTS = wrappers

GAR_EXTRA_CONF += tainted-build/tainted-build/toolchain.mk
GAR_EXTRA_CONF += toolchain/clang-wrappers/package-api.mk
include ../../gar.mk
