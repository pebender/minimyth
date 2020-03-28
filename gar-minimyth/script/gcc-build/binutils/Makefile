GARNAME = binutils
GARVERSION = $(BINUTILS_VERSION)
CATEGORIES = gcc-build
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

BUILDDEPS = \
	native/native \
	cc-build/ccache \
	cc-build/cc-build \
	gcc-build/libc-crt

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

build_DESTDIR = $(cc_build_DESTDIR)
build_rootdir = $(cc_build_rootdir)
DESTDIR = $(gcc_build_DESTDIR)
rootdir = $(gcc_build_rootdir)

build_CC = $(ccache_DESTDIR)$(ccache_bindir)-cc
build_CXX = $(ccache_DESTDIR)$(ccache_bindir)-c++
build_LD = $(build_DESTDIR)$(build_bindir)/ld
build_OBJDUMP = $(build_DESTDIR)$(build_bindir)/objdump
build_OBJCOPY = $(build_DESTDIR)$(build_bindir)/objcopy
build_STRIP = $(build_DESTDIR)$(build_bindir)/strip
build_RANLIB = $(build_DESTDIR)$(build_bindir)/ranlib
build_READELF = $(build_DESTDIR)$(build_bindir)/readelf
build_NM = $(build_DESTDIR)$(build_bindir)/nm
build_AS = $(build_DESTDIR)$(build_bindir)/as
build_AR = $(build_DESTDIR)$(build_bindir)/ar
build_CPP = $(build_DESTDIR)$(build_bindir)/cpp

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
