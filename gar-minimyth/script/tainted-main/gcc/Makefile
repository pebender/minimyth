GARNAME = gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = tainted-main
SOURCEPKG = tainted-build/gcc
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION =
define BLURB
endef
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION = 
define BLURB
endef

CROSSIMG ?= $(DESTIMG)
GARTARGET = $($(CROSSIMG)_GARHOST)

ifeq ($(DESTIMG),build)
IMGDEPS += $(CROSSIMG)
$(CROSSIMG)_DEPENDS = \
	tainted-main/binutils \
	tainted-main/glibc
BUILDDEPS = \
	native/native \
	tainted-build/tainted-build
else
export CROSSIMG
BUILDDEPS = \
	tainted-main/gcc
endif

WORKDIR = $(WORKROOTDIR)/$(DESTIMG)_$(CROSSIMG).d
COOKIEDIR = $(COOKIEROOTDIR)/$(DESTIMG)_$(CROSSIMG).d

WORKSRC = $(WORKDIR)/gcc-$(GARVERSION)

WORKBLD = $(WORKSRC)_build

ifeq ($(DESTIMG),build)
CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS = $(WORKBLD)/Makefile
INSTALL_SCRIPTS = $(WORKBLD)/Makefile lib-locations ccache-links
endif

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --target=$(GARTARGET) \
	--enable-plugin \
	--disable-gold \
	--enable-ld=default \
	--enable-__cxa_atexit \
	--enable-clocale=gnu \
	--enable-languages=c,c++ \
	--disable-libgomp \
	--disable-libquadmath \
	--disable-libquadmath-support \
	--disable-libada \
	--disable-libssp \
	--disable-libvtv \
	--enable-libstdcxx \
	--disable-multilib \
	--disable-nls \
	--enable-shared \
	--enable-threads=posix \
	--with-local-prefix=$(patsubst %/include,%,$($(CROSSIMG)_includedir)) \
	--with-sysroot=$($(CROSSIMG)_DESTDIR)

GAR_EXTRA_CONF += tainted-main/tainted-main/toolchain.mk
GAR_EXTRA_CONF += tainted-build/gcc/package-api.mk
include ../../gar.mk

configure-custom:
	@mkdir -p $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

install-lib-locations:
	@mkdir -pv $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir)
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc.a   ),cp -afv $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc.so  ),cp -afv $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc.so.*),cp -afv $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_s.so  ),cp -afv $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_s.so.*),cp -afv $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_eh.a   ),cp -afv $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_eh.so  ),cp -afv $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_eh.so.*),cp -afv $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@mkdir -pv $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir)
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libstdc++.so  ),cp -afv $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libstdc++.so.*),cp -afv $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(MAKECOOKIE)

install-ccache-links:
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/$(GARTARGET)-gcc
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/$(GARTARGET)-g++
	@$(MAKECOOKIE)
