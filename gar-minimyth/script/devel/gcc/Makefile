GARNAME = gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = devel
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
ifneq ("$(DESTIMG)+$(CROSSIMG)","build+build")
PATCHFILES += $(DISTNAME)-perl.patch.gar
PATCHFILES += $(DISTNAME)-dynamic_linker.patch
PATCHFILES += $(DISTNAME)-libstdc++-v3_config.patch
endif
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION =
define BLURB
endef

CROSSIMG ?= $(DESTIMG)
GARTARGET = $($(CROSSIMG)_GARHOST)

IMGDEPS += $(CROSSIMG)
ifneq ("$(DESTIMG)+$(CROSSIMG)","build+build")
$(CROSSIMG)_DEPENDS = devel/glibc
DEPENDS   = lang/c devel/binutils devel/meson
BUILDDEPS = devel/make
else
DEPENDS   = devel/binutils
BUILDDEPS = devel/make devel-tainted/devel-tainted
endif

WORKDIR   = $(WORKROOTDIR)/$(DESTIMG)_$(CROSSIMG).d
COOKIEDIR = $(COOKIEROOTDIR)/$(DESTIMG)_$(CROSSIMG).d

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --target=$(GARTARGET) \
	--with-gnu-as \
	--with-local-prefix=$(patsubst %/include,%,$($(CROSSIMG)_includedir)) \
	--enable-__cxa_atexit \
	--enable-clocale=gnu \
	--enable-plugin \
	--disable-gold \
	--enable-ld=default \
	--enable-languages=c,c++ \
	--disable-decimal-float \
	--enable-libatomic \
	--disable-libgomp \
	--disable-libquadmath \
	--disable-libquadmath-support \
	--disable-libada \
	--disable-libssp \
	--disable-werror \
	--disable-multilib \
	--enable-nls \
	--enable-host-shared \
	--enable-threads=posix \
	--enable-version-specific-runtime-libs \
	--with-sysroot=$($(CROSSIMG)_DESTDIR)

GAR_EXTRA_CONF += devel/glibc/package-api.mk
include ../../gar.mk

CPPFLAGS :=
CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=

post-extract:
	@rm -rf $(WORKSRC)/gmp-$(GMP_VERSION) $(WORKSRC)-gmp
	@cp -a $(WORKDIR)/gmp-$(GMP_VERSION) $(WORKSRC)/
	@mv $(WORKSRC)/gmp-$(GMP_VERSION) $(WORKSRC)/gmp
	@rm -rf $(WORKSRC)/isl-$(ISL_VERSION) $(WORKSRC)/isl
	@cp -a $(WORKDIR)/isl-$(ISL_VERSION) $(WORKSRC)/
	@mv $(WORKSRC)/isl-$(ISL_VERSION) $(WORKSRC)/isl
	@rm -rf $(WORKWRC)/mpc-$(MPC_VERSION) $(WORKSRC)/mpc
	@cp -a $(WORKDIR)/mpc-$(MPC_VERSION) $(WORKSRC)/
	@mv $(WORKSRC)/mpc-$(MPC_VERSION) $(WORKSRC)/mpc
	@rm -rf $(WORKSRC)/mpfr-$(MPFR_VERSION) $(WORKSRC)/mpfr
	@cp -a $(WORKDIR)/mpfr-$(MPFR_VERSION) $(WORKSRC)/
	@mv $(WORKSRC)/mpfr-$(MPFR_VERSION) $(WORKSRC)/mpfr
	@$(MAKECOOKIE)

configure-custom:
	@mkdir -p $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libcc1.la
	@rm -f $(CROSS_GCC_LIBDIR)/libasan.la
	@rm -f $(CROSS_GCC_LIBDIR)/libatomic.la
	@rm -f $(CROSS_GCC_LIBDIR)/libitm.la
	@rm -f $(CROSS_GCC_LIBDIR)/liblsan.la
	@rm -f $(CROSS_GCC_LIBDIR)/libstdc++.la
	@rm -f $(CROSS_GCC_LIBDIR)/libstdc++fs.la
	@rm -f $(CROSS_GCC_LIBDIR)/libsupc++.la
	@rm -f $(CROSS_GCC_LIBDIR)/libtsan.la
	@rm -f $(CROSS_GCC_LIBDIR)/libubsan.la
	@rm -f $(CROSS_GCC_LIBDIR)/plugin/libcc1plugin.la
	@rm -f $(CROSS_GCC_LIBDIR)/plugin/libcp1plugin.la
	@rm -f $(CROSS_GCC_LIBEXECDIR)/liblto_plugin.la
	$(if $(wildcard $(DESTDIR)$(bindir)/$(GARTARGET)-gcc-ar    ),ln -sf $(GARTARGET)-gcc-ar     $(DESTDIR)$(bindir)/$(GARTARGET)-ar    )
	$(if $(wildcard $(DESTDIR)$(bindir)/$(GARTARGET)-gcc-nm    ),ln -sf $(GARTARGET)-gcc-nm     $(DESTDIR)$(bindir)/$(GARTARGET)-nm    )
	$(if $(wildcard $(DESTDIR)$(bindir)/$(GARTARGET)-gcc-ranlib),ln -sf $(GARTARGET)-gcc-ranlib $(DESTDIR)$(bindir)/$(GARTARGET)-ranlib)
	@# Native compile.
	@$(if $(filter     $(DESTIMG),$(CROSSIMG)), \
		ln -sf gcc $(DESTDIR)$(bindir)/cc ; \
		$(if $(wildcard $(DESTDIR)$(bindir)/gcc-ar    ),ln -sf gcc-ar     $(DESTDIR)$(bindir)/ar    ) ; \
		$(if $(wildcard $(DESTDIR)$(bindir)/gcc-nm    ),ln -sf gcc-nm     $(DESTDIR)$(bindir)/nm    ) ; \
		$(if $(wildcard $(DESTDIR)$(bindir)/gcc-ranlib),ln -sf gcc-ranlib $(DESTDIR)$(bindir)/ranlib) ; \
	)
	@# Cross compile.
	@$(if $(filter-out $(DESTIMG),$(CROSSIMG)), \
		mkdir -p $(DESTDIR)$(prefix)/$(GARHOST)/bin ; \
		cp $(DESTDIR)$(bindir)/$(GARTARGET)-cpp $(DESTDIR)$(prefix)/$(GARTARGET)/bin/cpp ; \
		cp $(DESTDIR)$(bindir)/$(GARTARGET)-gcc $(DESTDIR)$(prefix)/$(GARTARGET)/bin/cc ; \
	)
	@mkdir -p $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir)
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_s.so  ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_s.so.*),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@mkdir -p $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir)
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libstdc++.so  ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libstdc++.so.*),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(MAKECOOKIE)
