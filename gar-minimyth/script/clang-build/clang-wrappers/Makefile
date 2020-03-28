GARNAME = clang-wrappers
GARVERSION = unknown
CATEGORIES = clang-build
SOURCEPKG = toolchain-wrappers/clang-wrappers
LICENSE =

DESCRIPTION =
define BLURB
endef

BUILDEPS = clang-build/clang

BUILD_SCRIPTS = wrappers
INSTALL_SCRIPTS = wrappers

GAR_EXTRA_CONF += clang-build/clang-build/toolchain.mk
GAR_EXTRA_CONF += toolchain-wrappers/clang-wrappers/package-api.mk
include ../../gar.mk
