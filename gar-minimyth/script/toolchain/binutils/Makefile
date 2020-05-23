GARNAME = binutils
GARVERSION = $(BINUTILS_VERSION)
CATEGORIES = toolchain
MASTER_SITES = https://ftp.gnu.org/gnu/binutils/
DISTFILES  = $(DISTNAME).tar.xz
LICENSE = GPL2/LGPL2/GPL3/LGPL3

DESCRIPTION =
define BLURB
endef

ifeq ($(CROSSIMG),build)
IMGDEPS += $(CROSSIMG)
$(CROSSIMG)_DEPENDS =
DEPENDS =
BUILDDEPS = lib/gmp lib/isl lib/mpc lib/mpfr perl/perl doc/texinfo
endif

CONFIGURE_ARGS = $(BINUTILS_CONFIGURE_ARGS)

include ../../gar.mk
