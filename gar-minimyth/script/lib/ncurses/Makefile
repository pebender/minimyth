GARNAME = ncurses
GARVERSION = $(NCURSES_VERSION)
CATEGORIES = lib
MASTER_SITES  = https://ftp.gnu.org/gnu/$(GARNAME)/
MASTER_SITES += https://invisible-mirror.net/archives/$(GARNAME)/
MASTER_SITES += https://invisible-mirror.net/archives/$(GARNAME)/$(GARVERSION)/
DISTFILES = $(GARNAME)-$(word 1,$(subst -, ,$(GARVERSION))).tar.gz 
PATCHFILES = \
	$(DISTNAME)-includesubdir.patch \
	$(DISTNAME).patch.gar
LICENSE = MIT_Modified

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx

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
	--with-pkg-config-libdir="$(PKG_CONFIG_LIBDIR)" \
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
	--with-termlib \
	--with-ticlib \
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

include ../../gar.mk

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
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
	@$(foreach lib, ncurses form panel menu, rm -fv $(DESTDIR)$(libdir)/lib${lib}.a $(DESTDIR)$(libdir)/lib${lib}_g.a;)
	@$(MAKECOOKIE)
