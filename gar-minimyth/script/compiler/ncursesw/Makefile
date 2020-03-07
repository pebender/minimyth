GARNAME = ncursesw
GARVERSION = $(NCURSES_VERSION)
CATEGORIES = compiler
SOURCEPKG = lib/ncurses
LICENSE = MIT_Modified

DESCRIPTION =
define BLURB
endef

WORKSRC = $(WORKDIR)/ncurses-$(GARVERSION)

BUILDDEPS = \
	native/native \
	ccache/ccache \
	compiler-clang/compiler-clang

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--without-ada \
	--without-cxx \
	--without-cxx-binding \
	--without-ada \
	--without-manpages \
	--without-tests \
	--with-pkg-config \
	--with-pkg-config-libdir="$(libdir)/pkgconfig" \
	--enable-pc-files \
	--with-build-cc="$(CC)" \
	--with-build-cpp="$(CPP)" \
	--with-build-cflags="" \
	--with-build-cppflags="" \
	--with-build-ldflags="" \
	--with-build-libs="" \
	--without-shared \
	--without-normal \
	--without-debug \
	--without-profile \
	--without-cxx-shared \
	--without-termlib \
	--with-ticlib \
	--enable-rpath \
	--disable-relink \
	--disable-lib-suffixes \
	--disable-rpath-hack \
	--enable-overwrite \
	--enable-widec \
	--with-progs

GAR_EXTRA_CONF += compiler/compiler/toolchain.mk
GAR_EXTRA_CONF += lib/ncurses/package-api.mk
include ../../gar.mk

CFLAGS += -fPIC
CXXFLAGS += -fPIC

post-install: post-install-configs

post-install-configs:
	@mkdir -p $(DESTDIR)$(bindir)/config
	@rm -fv $(DESTDIR)$(bindir)/config/ncursesw6-config
	@rm -fv $(DESTDIR)$(bindir)/config/ncurses6-config
	@rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-ncursesw6-config
	@rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-ncurses6-config
	@mv -fv $(DESTDIR)$(bindir)/ncurses6-config $(DESTDIR)$(bindir)/config/ncurses6-config
	@ln -sfv ncurses6-config $(DESTDIR)$(bindir)/config/ncursesw6-config
	@ln -sfv ncursesw6-config $(DESTDIR)$(bindir)/config/$(GARHOST)-ncursesw6-config
	@ln -sfv ncurses6-config $(DESTDIR)$(bindir)/config/$(GARHOST)-ncurses6-config
	@$(foreach lib, ncurses form panel menu, ln -sfv ${lib}.pc $(PKG_CONFIG_LIBDIR)/${lib}w.pc;)
	@$(foreach lib, ncurses form panel menu, rm -fv $(DESTDIR)$(libdir)/lib${lib}.so;)
	@$(foreach lib, ncurses form panel menu, rm -fv $(DESTDIR)$(libdir)/lib${lib}.so.*;)
	@$(foreach lib, ncurses form panel menu, ln -sfv lib${lib}.a $(DESTDIR)$(libdir)/lib${lib}w.a;)
	@$(MAKECOOKIE)
