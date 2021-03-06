GARNAME = ncursesw
GARVERSION = $(NCURSESW_VERSION)
CATEGORIES = toolchain-build
SOURCEPKG = lib/ncursesw
LICENSE = MIT_Modified

DESCRIPTION =
define BLURB
endef

WORKSRC = $(WORKDIR)/ncurses-$(GARVERSION)

DEPENDS = \
	toolchain-build/libc-crt
BUILDDEPS = \
	native/native \
	toolchain-dirty/toolchain-dirty

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
	--with-shared \
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

GAR_EXTRA_CONF += toolchain-build/toolchain-build/toolchain.mk
GAR_EXTRA_CONF += lib/ncursesw/package-api.mk
include ../../gar.mk

post-install: post-install-configs

post-install-configs:
	@mkdir -p $(DESTDIR)$(bindir)/config.d
	@rm -fv $(DESTDIR)$(bindir)/config.d/ncursesw6-config
	@rm -fv $(DESTDIR)$(bindir)/config.d/ncurses6-config
	@rm -fv $(DESTDIR)$(bindir)/config.d/$(GARHOST)-ncursesw6-config
	@rm -fv $(DESTDIR)$(bindir)/config.d/$(GARHOST)-ncurses6-config
	@mv -fv $(DESTDIR)$(bindir)/ncurses6-config $(DESTDIR)$(bindir)/config.d/ncurses6-config
	@ln -sfv ncurses6-config $(DESTDIR)$(bindir)/config.d/ncursesw6-config
	@ln -sfv ncursesw6-config $(DESTDIR)$(bindir)/config.d/$(GARHOST)-ncursesw6-config
	@ln -sfv ncurses6-config $(DESTDIR)$(bindir)/config.d/$(GARHOST)-ncurses6-config
	@$(foreach lib, ncurses form panel menu, ln -sfv ${lib}.pc $(PKG_CONFIG_LIBDIR)/${lib}w.pc;)
	@$(foreach lib, ncurses form panel menu, ln -sfv lib${lib}.so $(DESTDIR)$(libdir)/lib${lib}w.so;)
	@$(foreach lib, ncurses form panel menu, rm -fv $(DESTDIR)$(libdir)/lib${lib}.a;)
	@$(MAKECOOKIE)
