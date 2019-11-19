GARNAME = ncurses
GARVERSION = $(NCURSES_VERSION)
CATEGORIES = lib
MASTER_SITES  = https://ftp.gnu.org/gnu/$(GARNAME)/
MASTER_SITES += https://invisible-mirror.net/archives/$(GARNAME)/
MASTER_SITES += https://invisible-mirror.net/archives/$(GARNAME)/$(GARVERSION)/
DISTFILES = $(GARNAME)-$(word 1,$(subst -, ,$(GARVERSION))).tar.gz 
PATCHFILES  = $(DISTNAME)-$(NCURSES_PATCH_VERSION)-patch.sh.bz2
PATCHFILES += $(DISTNAME)-shell.patch $(DISTNAME)-perl.patch.gar $(DISTNAME).patch.gar
LICENSE = MIT_Modified

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--without-cxx-binding \
	--without-ada \
	--with-manpages \
	--without-tests \
	--with-build-cc="$(build_CC)" \
	--with-build-cppflags="$(build_CPPFLAGS)" \
	--with-build-cflags="$(build_CFLAGS)" \
	--with-build-ldflags="$(build_LDFLAGS)" \
	--with-build-libs="" \
	--with-shared \
	--without-normal \
	--without-debug \
	--without-profile \
	--disable-rpath \
	--disable-relink \
	--disable-rpath-hack \
	--enable-overwrite \
	--disable-widec \
	--enable-termcap \
	--enable-pc-files \
	--with-pkg-config=$(build_DESTDIR)$(build_bindir)/pkg-config \
	--with-pkg-config-libdir=$(DESTDIR)$(build_libdir)/pkg-config
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--without-progs
endif

include ../../gar.mk

patch-%.sh.bz2:
	echo " ==> Extracting $(DOWNLOADDIR)/$*"
	mkdir -p $(WORKSRC)
	cp $(DOWNLOADDIR)/$*.sh.bz2 $(WORKSRC)/$*.sh.bz2
	cd $(WORKSRC) && bzip2 -df $*.sh.bz2 && sleep 1 && sh $*.sh
	@$(MAKECOOKIE)

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@cd $(DESTDIR)$(libdir) && ln -sf libncurses.so libtermcap.so
	@rm -f $(DESTDIR)$(bindir)-config/ncurses5-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)ncurses5-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/ncurses5-config $(DESTDIR)$(bindir)-config/ncurses5-config
	@$(if $(compiler_prefix), ln -s ncurses5-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)ncurses5-config)
	@$(MAKECOOKIE)
