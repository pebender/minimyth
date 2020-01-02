GARNAME = ncursesw
GARVERSION = $(NCURSES_VERSION)
CATEGORIES = lib
SOURCEPKG = lib/ncurses
LICENSE = MIT_Modified

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx

WORKSRC = $(WORKDIR)/ncurses-$(GARVERSION)

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--without-ada \
	--without-cxx \
	--without-cxx-binding \
	--without-ada \
	--with-manpages \
	--without-tests \
	--with-pkg-config="$(build_DESTDIR)$(build_bindir)/pkg-config" \
	--with-pkg-config-libdir="$(libdir)/pkgconfig" \
	--enable-pc-files \
	--with-build-cc="$(build_CC)" \
	--with-build-cpp="$(build_CPP)" \
	--with-build-cflags="$(build_CFLAGS)" \
	--with-build-cppflags="$(build_CPPFLAGS)" \
	--with-build-ldflags="$(build_LDFLAGS)" \
	--with-build-libs="" \
	--with-shared \
	--without-normal \
	--without-debug \
	--without-profile \
	--with-cxx-shared \
	--without-termlib \
	--without-ticlib \
	--disable-rpath \
	--disable-relink \
	--disable-lib-suffixes \
	--disable-rpath-hack \
	--enable-overwrite \
	--enable-widec
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--without-progs
endif

GAR_EXTRA_CONF += lib/ncurses/package-api.mk
include ../../gar.mk

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@mkdir -p $(DESTDIR)$(bindir)-config
	@rm -fv $(DESTDIR)$(bindir)-config/ncursesw6-config
	@rm -fv $(DESTDIR)$(bindir)-config/ncurses6-config
	@rm -fv $(DESTDIR)$(bindir)-config/$(compiler_prefix)ncursesw6-config
	@rm -fv $(DESTDIR)$(bindir)-config/$(compiler_prefix)ncurses6-config
	@mv -fv $(DESTDIR)$(bindir)/ncurses6-config $(DESTDIR)$(bindir)-config/ncurses6-config
	@ln -sfv ncurses6-config $(DESTDIR)$(bindir)-config/ncursesw6-config
	@$(if $(compiler_prefix), ln -sfv ncursesw6-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)ncursesw6-config)
	@$(if $(compiler_prefix), ln -sfv ncurses6-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)ncurses6-config)
	@$(foreach lib, ncurses form panel menu, ln -sfv ${lib}.pc $(PKG_CONFIG_LIBDIR)/${lib}w.pc;)
	@$(foreach lib, ncurses form panel menu, ln -sfv lib${lib}.so $(DESTDIR)$(libdir)/lib${lib}w.so;)
	@#$(foreach lib, ncurses form panel menu, rm -fv $(DESTDIR)$(libdir)/lib${lib}.a $(DESTDIR)$(libdir)/lib${lib}_g.a;)
	@$(MAKECOOKIE)
