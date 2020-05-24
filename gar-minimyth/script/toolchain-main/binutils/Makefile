GARNAME = binutils
GARVERSION = $(BINUTILS_VERSION)
CATEGORIES = toolchain-main
SOURCEPKG = toolchain/binutils
LICENSE = GPL2/LGPL2/GPL3/LGPL3

DESCRIPTION =
define BLURB
endef

ifeq ($(DESTIMG),build)
DEPENDS = lang/c lang/cxx lib/gmp lib/isl lib/mpc lib/mpfr
BUILDDEPS = perl/perl doc/texinfo
endif

CONFIGURE_ARGS = $(BINUTILS_CONFIGURE_ARGS)

GAR_EXTRA_CONF += toolchain/binutils/package-api.mk
include ../../gar.mk
