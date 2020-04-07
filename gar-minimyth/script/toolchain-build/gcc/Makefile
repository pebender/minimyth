GARNAME = gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = toolchain-build
SOURCEPKG = tainted-build/gcc
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION =
define BLURB
endef
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	toolchain-build/binutils

BUILDDEPS = \
	native/native \
	tainted-build/tainted-build

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS = $(WORKBLD)/Makefile
INSTALL_SCRIPTS = $(WORKBLD)/Makefile lib-wrappers lib-locations ccache-links

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
	--with-sysroot=/ \
	--with-local-prefix=$(patsubst %/include,%,$(includedir)) \
	--with-build-time-tools="$(DESTDIR)$(bindir)"

GAR_EXTRA_CONF += toolchain-build/toolchain-build/toolchain.mk
GAR_EXTRA_CONF += tainted-build/gcc/package-api.mk
include ../../gar.mk

CC := $(build_DESTDIR)$(build_bindir)/ccache.d/$(build_GARHOST)-gcc
CXX := $(build_DESTDIR)$(build_bindir)/ccache.d/$(build_GARHOST)-g++
CPP := $(build_DESTDIR)$(build_bindir)/wrapper.d/$(build_GARHOST)-cpp
LD := $(build_DESTDIR)$(build_bindir)/wrapper.d/$(build_GARHOST)-ld.bfd
OBJDUMP := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-objdump
OBJCOPY := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-objcopy
STRIP := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-strip
RANLIB := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-ranlib
READELF := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-readelf
NM := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-nm
AS := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-as
AR := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-ar

configure-custom:
	@mkdir -pv $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

install-lib-wrappers:
	@rm -fv $(DESTDIR)$(libdir)/libcc1.la
	@rm -fv $(DESTDIR)$(libdir)/libasan.la
	@rm -fv $(DESTDIR)$(libdir)/libatomic.la
	@rm -fv $(DESTDIR)$(libdir)/libitm.la
	@rm -fv $(DESTDIR)$(libdir)/liblsan.la
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

install-ccache-links:
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/$(GARTARGET)-gcc
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/$(GARTARGET)-g++
	@$(MAKECOOKIE)
