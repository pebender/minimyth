GARNAME = gcc-wrappers
GARVERSION = unknown
CATEGORIES = tainted-build
DISTFILES = \
	$(DESTIMG)-cpp \
	$(DESTIMG)-gcc \
	$(DESTIMG)-g++ \
	$(DESTIMG)-ld.bfd
LICENSE = 

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS = wrappers
INSTALL_SCRIPTS = wrappers

DEPENDS = \
	tainted-build/binutils \
	tainted-build/gcc

GAR_EXTRA_CONF += tainted-build/tainted-build/toolchain.mk
include ../../gar.mk
