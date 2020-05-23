GARNAME = gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = toolchain
MASTER_SITES = https://ftp.gnu.org/gnu/gcc/gcc/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES = $(DISTNAME)-disable_multilib_i386_linux64.patch
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION =
define BLURB
endef


ifeq ($(CROSSIMG),build)
IMGDEPS += $(CROSSIMG)
$(CROSSIMG)_DEPENDS =
DEPENDS = lib/gmp lib/isl lib/mpc lib/mpfr
BUILDDEPS =
endif

CONFIGURE_ARGS = $(GCC_CONFIGURE_ARGS)

include ../../gar.mk
