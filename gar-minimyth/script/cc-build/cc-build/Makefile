GARNAME = cc-build
GARVERSION =
CATEGORIES = cc-build
LICENSE =

DESCRIPTION =
define BLURB
endef

BUILDDEPS = \
	native/native \
	cc-build/cc \
	cc-build/ccache \
	cc-build/bash \
	cc-build/coreutils \
	cc-build/make

GAR_EXTRA_CONF += cc-build/cc-build/toolchain.mk
include ../../gar.mk
