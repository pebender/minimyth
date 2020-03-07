GARNAME = gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = compiler-gcc
MASTER_SITES  = https://ftp.gnu.org/gnu/gcc/$(DISTNAME)/
MASTER_SITES += https://ftp.gnu.org/gnu/gmp/
MASTER_SITES += http://isl.gforge.inria.fr/
MASTER_SITES += https://ftp.gnu.org/gnu/mpc/
MASTER_SITES += https://ftp.gnu.org/gnu/mpfr/
DISTFILES  = $(DISTNAME).tar.xz
DISTFILES  = $(DISTNAME).tar.xz
DISTFILES += gmp-$(GMP_VERSION).tar.xz
DISTFILES += isl-$(ISL_VERSION).tar.xz
DISTFILES += mpc-$(MPC_VERSION).tar.gz
DISTFILES += mpfr-$(MPFR_VERSION).tar.xz
PATCHFILES  = $(DISTNAME)-disable_multilib_i386_linux64.patch
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION =
define BLURB
endef

WORKBLD = $(WORKSRC)_build

BUILDDEPS = \
	native/native \
	compiler-cc/compiler-cc \
	ccache/ccache \
	compiler-gcc/bash \
	compiler-gcc/coreutils \
	compiler-gcc/make \
	compiler-gcc/binutils

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS = $(WORKBLD)/Makefile
INSTALL_SCRIPTS = $(WORKBLD)/Makefile

# We disable libatomic so that it does not compete with the compiler-rt.
CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-__cxa_atexit \
	--enable-clocale=gnu \
	--enable-plugin \
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
	--disable-werror \
	--disable-multilib \
	--disable-nls \
	--enable-host-shared \
	--enable-version-specific-runtime-libs \
	--with-sysroot=$(DESTDIR) \
	--with-build-sysroot=/

GAR_EXTRA_CONF += compiler-gcc/compiler-gcc/toolchain.mk
GAR_EXTRA_CONF += compiler-gcc/gcc/package-api.mk
include ../../gar.mk

# Use the just compiled binutils.
build_LD := $(gcc_DESTDIR)$(gcc_bindir)/ld
build_OBJDUMP := $(gcc_DESTDIR)$(gcc_bindir)/objdump
build_OBJCOPY := $(gcc_DESTDIR)$(gcc_bindir)/objcopy
build_STRIP := $(gcc_DESTDIR)$(gcc_bindir)/strip
build_RANLIB := $(gcc_DESTDIR)$(gcc_bindir)/ranlib
build_READELF := $(gcc_DESTDIR)$(gcc_bindir)/readelf
build_NM := $(gcc_DESTDIR)$(gcc_bindir)/nm
build_AS := $(gcc_DESTDIR)$(gcc_bindir)/as
build_AR := $(gcc_DESTDIR)$(gcc_bindir)/ar

build_CPPFLAGS = \
	-idirafter /usr/include
build_LDFLAGS = \
	-Wl,-rpath-link="$(TARGET_LINKTIME_PATH):$(NATIVE_LINKTIME_PATH)" \
	-Wl,-rpath="$(TARGET_LINKTIME_PATH)"

post-extract:
	@mv -fv $(WORKDIR)/gmp-$(GMP_VERSION)   $(WORKSRC)/gmp
	@mv -fv $(WORKDIR)/isl-$(ISL_VERSION)   $(WORKSRC)/isl
	@mv -fv $(WORKDIR)/mpc-$(MPC_VERSION)   $(WORKSRC)/mpc
	@mv -fv $(WORKDIR)/mpfr-$(MPFR_VERSION) $(WORKSRC)/mpfr
	@$(MAKECOOKIE)

configure-custom:
	@mkdir -pv $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

post-install: post-install-lib-wrappers post-install-lib-locations

post-install-lib-wrappers:
	@rm -fv $(DESTDIR)$(libdir)/libcc1.la
	@rm -fv $(CROSS_GCC_LIBDIR)/libasan.la
	@rm -fv $(CROSS_GCC_LIBDIR)/libatomic.la
	@rm -fv $(CROSS_GCC_LIBDIR)/libitm.la
	@rm -fv $(CROSS_GCC_LIBDIR)/liblsan.la
	@rm -fv $(CROSS_GCC_LIBDIR)/libstdc++.la
	@rm -fv $(CROSS_GCC_LIBDIR)/libstdc++fs.la
	@rm -fv $(CROSS_GCC_LIBDIR)/libsupc++.la
	@rm -fv $(CROSS_GCC_LIBDIR)/libtsan.la
	@rm -fv $(CROSS_GCC_LIBDIR)/libubsan.la
	@rm -fv $(CROSS_GCC_LIBDIR)/plugin/libcc1plugin.la
	@rm -fv $(CROSS_GCC_LIBDIR)/plugin/libcp1plugin.la
	@rm -fv $(CROSS_GCC_LIBEXECDIR)/liblto_plugin.la

post-install-lib-locations:
	@ln -sfv gcc $(DESTDIR)$(bindir)/cc
	@ln -sfv g++ $(DESTDIR)$(bindir)/c++
	@mkdir -pv $(DESTDIR)$(elibdir)
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc.a   ),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc.so  ),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc.so.*),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_s.so  ),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_s.so.*),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_eh.a   ),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_eh.so  ),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_eh.so.*),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	@mkdir -pv $(DESTDIR)$(libdir)
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libstdc++.so  ),cp -af $(file) $(DESTDIR)$(libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libstdc++.so.*),cp -af $(file) $(DESTDIR)$(libdir) ; )
	@$(MAKECOOKIE)
