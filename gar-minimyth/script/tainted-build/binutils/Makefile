GARNAME = binutils
GARVERSION = $(BINUTILS_VERSION)
CATEGORIES = tainted-build
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
LICENSE = GPL2/LGPL2/GPL3/LGPL3

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	tainted-build/libc-crt
BUILDDEPS = \
	native/native \
	tainted-build/cc \
	tainted-build/ccache \
	tainted-build/bash \
	tainted-build/coreutils \
	tainted-build/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--with-static-standard-libraries \
	--enable-plugins \
	--disable-gold \
	--enable-ld=default \
	--disable-libgomp \
	--disable-libada \
	--disable-libssp \
	--disable-multilib \
	--disable-nls \
	--disable-werror \
	--with-sysroot=/

GAR_EXTRA_CONF += tainted-build/tainted-build/toolchain.mk
include ../../gar.mk

CC := $(build_DESTDIR)$(build_bindir)/ccache.d/cc
CXX := $(build_DESTDIR)$(build_bindir)/ccache.d/c++
CPP := $(build_DESTDIR)$(build_bindir)/cpp
LD := $(build_DESTDIR)$(build_bindir)/ld

CPPFLAGS :=
CFLAGS :=
CXXFLAGS :=
LDFLAGS :=

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

post-install:
	@rm -fv $(DESTDIR)$(libdir)/libbfd.la
	@rm -fv $(DESTDIR)$(libdir)/libopcodes.la
	@$(if $(filter $(DESTIMG),build), \
		ln -sfv ld $(DESTDIR)$(bindir)/$(GARHOST)-ld && \
		ln -sfv ld.bfd $(DESTDIR)$(bindir)/$(GARHOST)-ld.bfd && \
		ln -sfv objdump $(DESTDIR)$(bindir)/$(GARHOST)-objdump && \
		ln -sfv objcopy $(DESTDIR)$(bindir)/$(GARHOST)-objcopy && \
		ln -sfv strip $(DESTDIR)$(bindir)/$(GARHOST)-strip && \
		ln -sfv ranlib $(DESTDIR)$(bindir)/$(GARHOST)-ranlib && \
		ln -sfv readelf $(DESTDIR)$(bindir)/$(GARHOST)-readelf && \
		ln -sfv nm $(DESTDIR)$(bindir)/$(GARHOST)-nm && \
		ln -sfv as $(DESTDIR)$(bindir)/$(GARHOST)-as && \
		ln -sfv ar $(DESTDIR)$(bindir)/$(GARHOST)-ar \
	)
	@$(MAKECOOKIE)
