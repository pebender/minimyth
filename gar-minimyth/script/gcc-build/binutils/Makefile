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
#PATCHFILES = $(DISTNAME)-multi_os_directory.patch
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
	--disable-libatomic \
	--disable-libgomp \
	--disable-libada \
	--disable-libssp \
	--disable-multilib \
	--disable-nls \
	--disable-werror

build_DESTDIR = $(cc_build_DESTDIR)
build_rootdir = $(cc_build_rootdir)
DESTDIR =
rootdir = $(gcc_build_DESTDIR)$(gcc_build_rootdir)

build_CC = $(ccache_DESTDIR)$(ccache_bindir)/cc
build_CXX = $(ccache_DESTDIR)$(ccache_bindir)/c++
build_LD = $(cc_build_DESTDIR)$(cc_build_bindir)/ld
build_OBJDUMP = $(cc_build_DESTDIR)$(cc_build_bindir)/objdump
build_OBJCOPY = $(cc_build_DESTDIR)$(cc_build_bindir)/objcopy
build_STRIP = $(cc_build_DESTDIR)$(cc_build_bindir)/strip
build_RANLIB = $(cc_build_DESTDIR)$(cc_build_bindir)/ranlib
build_READELF = $(cc_build_DESTDIR)$(cc_build_bindir)/readelf
build_NM = $(cc_build_DESTDIR)$(cc_build_bindir)/nm
build_AS = $(cc_build_DESTDIR)$(cc_build_bindir)/as
build_AR = $(cc_build_DESTDIR)$(cc_build_bindir)/ar
build_CPP = $(cc_build_DESTDIR)$(cc_build_bindir)/cpp

build_CPPFLAGS =
build_CFLAGS =
build_CXXFLAGS =
build_LDFLAGS =

include ../../gar.mk

PATH := $(cc_build_DESTDIR)$(cc_build_bindir):$(PATH)

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
	@$(MAKECOOKIE)
