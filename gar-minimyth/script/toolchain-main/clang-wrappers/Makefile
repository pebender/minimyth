GARNAME = clang-wrappers
GARVERSION = unknown
CATEGORIES = toolchain-main
SOURCEPKG = toolchain/clang-wrappers
LICENSE =

DESCRIPTION =
define BLURB
endef

BEPENDS =
BUILDDEPS = toolchain-build/clang

BUILD_SCRIPTS = wrappers
INSTALL_SCRIPTS = wrappers

GAR_EXTRA_CONF += toolchain-main/toolchain-main/toolchain.mk
GAR_EXTRA_CONF += toolchain/clang-wrappers/package-api.mk
include ../../gar.mk
