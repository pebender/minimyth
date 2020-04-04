GARNAME = gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = tainted-build
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

WORKBLD = $(WORKSRC)_build

DEPENDS = \
	tainted-build/libc-crt
BUILDDEPS = \
	native/native \
	tainted-build/cc \
	tainted-build/ccache \
	tainted-build/bash \
	tainted-build/coreutils \
	tainted-build/make \
	tainted-build/binutils

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS = $(WORKBLD)/Makefile
INSTALL_SCRIPTS = $(WORKBLD)/Makefile lib-wrappers lib-locations cc-links ccache-links

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-__cxa_atexit \
	--enable-clocale=gnu \
	--enable-plugin \
	--disable-gold \
	--enable-ld=default \
	--enable-languages=c,c++ \
	--disable-decimal-float \
	--disable-libgomp \
	--disable-libquadmath \
	--disable-libquadmath-support \
	--disable-libada \
	--disable-libssp \
	--enable-libstdcxx \
	--disable-multiarch \
	--disable-multilib \
	--disable-nls \
	--disable-werror \
	--with-sysroot=/ \
	--with-local-prefix=$(patsubst %/include,%,$($(DESTIMG)_includedir)) \
	--with-build-time-tools="$(DESTDIR)$(bindir)"

GAR_EXTRA_CONF += tainted-build/tainted-build/toolchain.mk
GAR_EXTRA_CONF += tainted-build/gcc/package-api.mk
include ../../gar.mk

CC := $(build_DESTDIR)$(build_bindir)/ccache.d/cc
CXX := $(build_DESTDIR)$(build_bindir)/ccache.d/c++
CPP := $(build_DESTDIR)$(build_bindir)/cpp
LD := $(build_DESTDIR)$(build_bindir)/ld.bfd

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

configure-custom:
	@mkdir -pv $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

install-lib-wrappers:
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
	@$(MAKECOOKIE)

install-lib-locations:
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

install-cc-links:
	@ln -sfv gcc $(DESTDIR)$(bindir)/cc
	@ln -sfv g++ $(DESTDIR)$(bindir)/c++
	@$(MAKECOOKIE)

install-ccache-links:
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/$(GARHOST)-gcc
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/$(GARHOST)-g++
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/gcc
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/g++
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/cc
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/c++
	@$(if $(filter $(DESTIMG),build), \
		ln -sfv cpp $(DESTDIR)$(bindir)/$(GARHOST)-cpp \
	)
	@$(MAKECOOKIE)
