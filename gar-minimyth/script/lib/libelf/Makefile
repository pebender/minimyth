GARNAME = libelf
GARVERSION = 0.8.13
CATEGORIES = devel
MASTER_SITES = http://www.mr511.de/software/
MASTER_SITES += https://fossies.org/linux/misc/old/
MASTER_SITES += https://ftp.osuosl.org/pub/blfs/conglomeration/libelf/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME).patch.gar $(DISTNAME)-if_defined.patch
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-compat \
	--disable-nls \
	--enable-shared
INSTALL_ARGS = \
	instroot="$(DESTDIR)"

CONFIGURE_ENV = \
	mr_cv_target_elf="yes"
include ../../gar.mk

pre-configure:
	@cp -fv $(build_DESTDIR)$(build_datadir)/automake-*/config.guess $(WORKSRC)/
	@cp -fv $(build_DESTDIR)$(build_datadir)/automake-*/config.sub $(WORKSRC)/
	@cp -fv $(build_DESTDIR)$(build_datadir)/automake-*/install-sh $(WORKSRC)/
	@#rm -rf $(WORKSRC)/config.guess
	@#rm -rf $(WORKSRC)/config.sub
	@#cd $(WORKSRC) ; aclocal  --force --verbose
	@#cd $(WORKSRC) ; automake --force
	@#cd $(WORKSRC) ; libtoolize --force --copy --install
	@#cd $(WORKSRC) ; autoconf --force
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

x-post-install:
	@rm -rf $(DESTDIR)$(libdir)/libelf.a
	@$(MAKECOOKIE)
