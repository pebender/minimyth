GARNAME = binutils
GARVERSION = $(BINUTILS_VERSION)
CATEGORIES = compiler
MASTER_SITES  = https://ftp.gnu.org/gnu/binutils/
MASTER_SITES += https://ftp.gnu.org/gnu/gmp/
MASTER_SITES += http://isl.gforge.inria.fr/
MASTER_SITES += https://ftp.gnu.org/gnu/mpc/
MASTER_SITES += https://ftp.gnu.org/gnu/mpfr/
DISTFILES  = $(DISTNAME).tar.xz
DISTFILES += gmp-$(GMP_VERSION).tar.xz
DISTFILES += isl-$(ISL_VERSION).tar.xz
DISTFILES += mpc-$(MPC_VERSION).tar.gz
DISTFILES += mpfr-$(MPFR_VERSION).tar.xz
PATCHFILES  = $(DISTNAME)-multi_os_directory.patch
LICENSE = GPL2/LGPL2/GPL3/LGPL3

DESCRIPTION =
define BLURB
endef

BUILDDEPS = \
	native/native \
	compiler-cc/compiler-cc \
	ccache/ccache \
	compiler-gcc/bash \
	compiler-gcc/coreutils \
	compiler-gcc/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--with-static-standard-libraries \
	--enable-plugins \
	--enable-gold \
	--enable-ld=default \
	--disable-libgomp \
	--disable-libada \
	--disable-libssp \
	--disable-werror \
	--disable-multilib \
	--disable-nls \
	--with-lib-path="=$(elibdir):=$(libdir)"

GAR_EXTRA_CONF += compiler-gcc/compiler-gcc/toolchain.mk
GAR_EXTRA_CONF += devel/binutils/package-api.mk
include ../../gar.mk

post-extract:
	@mv -fv $(WORKDIR)/gmp-$(GMP_VERSION) $(WORKSRC)/gmp
	@mv -fv $(WORKDIR)/isl-$(ISL_VERSION) $(WORKSRC)/isl
	@mv -fv $(WORKDIR)/mpc-$(MPC_VERSION) $(WORKSRC)/mpc
	@mv -fv $(WORKDIR)/mpfr-$(MPFR_VERSION) $(WORKSRC)/mpfr
	@$(MAKECOOKIE)

post-install: post-install-lib-wrappers

post-install-lib-wrappers:
	@rm -fv $(DESTDIR)$(libdir)/libbfd.la
	@rm -fv $(DESTDIR)$(libdir)/libopcodes.la
	@$(MAKECOOKIE)
