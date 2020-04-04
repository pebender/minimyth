GARNAME = clang-wrappers
GARVERSION = unknown
CATEGORIES = tainted-build
DISTFILES = \
	$(DESTIMG)-clang-cpp \
	$(DESTIMG)-clang \
	$(DESTIMG)-clang++ \
	$(DESTIMG)-ld.lld
LICENSE = 

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	tainted-build/clang

BUILD_SCRIPTS = wrappers
INSTALL_SCRIPTS = wrappers

GAR_EXTRA_CONF += tainted-build/tainted-build/toolchain.mk
include ../../gar.mk
