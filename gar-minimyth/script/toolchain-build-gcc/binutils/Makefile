GARNAME = binutils
GARVERSION = $(BINUTILS_VERSION)
CATEGORIES = toolchain-build-gcc
SOURCEPKG = toolchain/binutils
LICENSE = GPL2/LGPL2/GPL3/LGPL3

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/gmp lib/isl lib/mpc lib/mpfr
BUILDDEPS = perl/perl doc/texinfo

CONFIGURE_ARGS = $(BINUTILS_CONFIGURE_ARGS)

GAR_EXTRA_CONF += toolchain-build-gcc/toolchain-build-gcc/toolchain.mk
GAR_EXTRA_CONF += toolchain/binutils/package-api.mk
include ../../gar.mk
