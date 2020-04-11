GARNAME = tainted-main
GARVERSION =
CATEGORIES = tainted-main
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	tainted-main/linux-headers \
	tainted-main/glibc \
	tainted-main/binutils \
	tainted-main/gcc \
	tainted-main/gcc-wrappers

GAR_EXTRA_CONF += tainted-main/tainted-main/toolchain.mk
include ../../gar.mk
