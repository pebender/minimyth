GARNAME = gdb
GARVERSION = 9.2
CATEGORIES = devel
MASTER_SITES = https://ftp.gnu.org/gnu/gdb/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2/LGPL2/GPL3/LGPL3

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c build-tool/make lib/ncursesw lib/gmp lib/isl lib/mpc lib/mpfr

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS = $(WORKBLD)/Makefile
INSTALL_SCRIPTS = $(WORKBLD)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-werror \
	--with-build-sysroot=$(DESTDIR)$(rootdir)

include ../../gar.mk

configure-custom:
	@mkdir -pv $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libbfd.la
	@rm -f $(DESTDIR)$(libdir)/libopcodes.la
	@$(if $(filter $(GARHOST), $(GARTARGET)),, rm -f $(DESTDIR)$(prefix)/$(GARHOST)/$(GARTARGET)/lib/libbfd.la)
	@$(if $(filter $(GARHOST), $(GARTARGET)),, rm -f $(DESTDIR)$(prefix)/$(GARHOST)/$(GARTARGET)/lib/libopcodes.la)
	@$(MAKECOOKIE)
