GARNAME = gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = devel-tainted
SOURCEPKG = devel/gcc
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION =
define BLURB
endef

CROSSIMG ?= $(DESTIMG)
GARTARGET = $($(CROSSIMG)_GARHOST)

ifneq ("$(DESTIMG)+$(CROSSIMG)","build+build")
endif

DEPENDS   = devel-tainted/binutils
BUILDDEPS = devel-tainted/make

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
	--disable-nls \
	--enable-host-shared \
	--enable-version-specific-runtime-libs \
	--with-sysroot=$($(CROSSIMG)_DESTDIR)

GAR_EXTRA_CONF += devel/gcc/package-api.mk
include ../../gar.mk

CPPFLAGS :=
CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=

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
	@ln -sf gcc $(DESTDIR)$(bindir)/cc
	@mkdir -p $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir)
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_s.so  ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_s.so.*),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_elibdir) ; )
	@mkdir -p $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir)
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libstdc++.so  ),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libstdc++.so.*),cp -af $(file) $($(CROSSIMG)_DESTDIR)$($(CROSSIMG)_libdir) ; )
	@$(MAKECOOKIE)
