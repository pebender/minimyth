GARNAME = gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = toolchain
MASTER_SITES = https://ftp.gnu.org/gnu/gcc/$(DISTNAME)/
MASTER_SITES += https://ftp.gnu.org/gnu/binutils/
MASTER_SITES += https://ftp.gnu.org/gnu/gmp/
MASTER_SITES += http://isl.gforge.inria.fr/
MASTER_SITES += https://ftp.gnu.org/gnu/mpc/
MASTER_SITES += https://ftp.gnu.org/gnu/mpfr/
DISTFILES = $(DISTNAME).tar.xz
DISTFILES += gmp-$(GMP_VERSION).tar.xz
DISTFILES += isl-$(ISL_VERSION).tar.xz
DISTFILES += mpc-$(MPC_VERSION).tar.gz
DISTFILES += mpfr-$(MPFR_VERSION).tar.xz
PATCHFILES = $(DISTNAME)-libctf.patch $(DISTNAME)-disable_multilib_i386_linux64.patch
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION =
define BLURB
endef

ifeq ($(CROSSIMG),build)
IMGDEPS += $(CROSSIMG)
$(CROSSIMG)_DEPENDS =
DEPENDS =
BUILDDEPS =
endif

CONFIGURE_ARGS = $(GCC_CONFIGURE_ARGS)

include ../../gar.mk

post-extract:
	@rm -rfv $(WORKSRC)/gmp
	@mv -fv $(WORKDIR)/gmp-$(GMP_VERSION) $(WORKSRC)/gmp
	@rm -rfv $(WORKSRC)/isl
	@mv -fv $(WORKDIR)/isl-$(ISL_VERSION) $(WORKSRC)/isl
	@rm -rfv $(WORKSRC)/mpc
	@mv -fv $(WORKDIR)/mpc-$(MPC_VERSION) $(WORKSRC)/mpc
	@rm -rfv $(WORKSRC)/mpfr
	@mv -fv $(WORKDIR)/mpfr-$(MPFR_VERSION) $(WORKSRC)/mpfr
	@$(MAKECOOKIE)
