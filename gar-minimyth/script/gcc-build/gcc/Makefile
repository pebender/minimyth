GARNAME = gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = gcc-build
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
PATCHFILES = $(DISTNAME)-disable_multilib_i386_linux64.patch
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION =
define BLURB
endef

WORKBLD = $(WORKSRC)_build

BUILDDEPS = \
	native/native \
	cc-build/ccache \
	cc-build/cc-build \
	gcc-build/libc-crt \
	gcc-build/binutils

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS = $(WORKBLD)/Makefile
INSTALL_SCRIPTS = $(WORKBLD)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-__cxa_atexit \
	--enable-clocale=gnu \
	--enable-plugins \
	--disable-gold \
	--enable-ld=default \
	--enable-languages=c,c++ \
	--disable-decimal-float \
	--disable-libatomic \
	--disable-libgomp \
	--disable-libquadmath \
	--disable-libquadmath-support \
	--disable-libada \
	--disable-libssp \
	--disable-multiarch \
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

GAR_EXTRA_CONF += gcc-build/gcc/package-api.mk
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

configure-custom:
	@mkdir -pv $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

post-install: post-install-lib-wrappers post-install-lib-locations post-install-cc-links post-install-ccache-links

post-install-lib-wrappers:
	@rm -fv $(DESTDIR)$(libdir)/libbfd.la
	@rm -fv $(DESTDIR)$(libdir)/libcc1.la
	@rm -fv $(DESTDIR)$(libdir)/libasan.la
	@rm -fv $(DESTDIR)$(libdir)/libatomic.la
	@rm -fv $(DESTDIR)$(libdir)/libitm.la
	@rm -fv $(DESTDIR)$(libdir)/liblsan.la
	@rm -fv $(DESTDIR)$(libdir)/libopcodes.la
	@rm -fv $(DESTDIR)$(libdir)/libstdc++.la
	@rm -fv $(DESTDIR)$(libdir)/libstdc++fs.la
	@rm -fv $(DESTDIR)$(libdir)/libsupc++.la
	@rm -fv $(DESTDIR)$(libdir)/libtsan.la
	@rm -fv $(DESTDIR)$(libdir)/libubsan.la
	@rm -fv $(CROSS_GCC_LIBDIR)/plugin/libcc1plugin.la
	@rm -fv $(CROSS_GCC_LIBDIR)/plugin/libcp1plugin.la
	@rm -fv $(CROSS_GCC_LIBEXECDIR)/liblto_plugin.la

post-install-lib-locations:
	@mkdir -pv $(DESTDIR)$(elibdir)
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc.a   ),cp -afv $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc.so  ),cp -afv $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc.so.*),cp -afv $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_s.so  ),cp -afv $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_s.so.*),cp -afv $(file) $(DESTDIR)$(elibdir) ; )

	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_eh.a   ),cp -afv $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_eh.so  ),cp -afv $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_eh.so.*),cp -afv $(file) $(DESTDIR)$(elibdir) ; )
	@mkdir -pv $(DESTDIR)$(libdir)
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libstdc++.so  ),cp -afv $(file) $(DESTDIR)$(libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libstdc++.so.*),cp -afv $(file) $(DESTDIR)$(libdir) ; )
	@$(MAKECOOKIE)

post-install-cc-links:
	@ln -sfv gcc $(DESTDIR)$(bindir)/cc
	@ln -sfv g++ $(DESTDIR)$(bindir)/c++
	@$(MAKECOOKIE)

post-install-ccache-links:
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/$(GARHOST)-gcc
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/$(GARHOST)-g++
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/gcc
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/g++
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/cc
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/c++
	@$(MAKECOOKIE)
