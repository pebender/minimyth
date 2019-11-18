GARNAME = ncurses
GARVERSION = $(NCURSES_VERSION)
CATEGORIES = lib
MASTER_SITES  = https://ftp.gnu.org/gnu/$(GARNAME)/
MASTER_SITES += https://invisible-mirror.net/archives/$(GARNAME)/
MASTER_SITES += https://invisible-mirror.net/archives/$(GARNAME)/$(word 1,$(subst -, ,$(GARVERSION)))/
DISTFILES = $(GARNAME)-$(word 1,$(subst -, ,$(GARVERSION))).tar.gz
PATCHFILES = $(DISTNAME)-patch.sh.bz2 $(DISTNAME)-shell.patch $(DISTNAME)-perl.patch.gar $(DISTNAME).patch.gar
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
	--enable-termcap
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--without-progs
endif

include ../../gar.mk

post-extract:
	mv $(WORKDIR)/$(GARNAME)-$(word 1,$(subst -, ,$(GARVERSION))) $(WORKSRC)
	@$(MAKECOOKIE)

patch-$(DISTNAME)-patch.sh.bz2:
	@tar jxf -C $(DOWNLOADDIR) $(WORKSRC)/$(DISTNAME)-patch.sh.bz2
	@cd $(WORKSRC) ; sh $(DISTNAME)-patch.sh
https://invisible-mirror.net/archives/ncurses/5.9/ncurses-5.9-20141206-patch.sh.bz2

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
