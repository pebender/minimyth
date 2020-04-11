GARNAME = readline
GARVERSION = 8.0
CATEGORIES = lib
MASTER_SITES  = https://ftp.gnu.org/gnu/readline/
MASTER_SITES += https://ftp.gnu.org/gnu/readline/$(DISTNAME)-patches/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES  = \
	$(GARNAME)$(subst .,,$(GARVERSION))-001 \
	$(GARNAME)$(subst .,,$(GARVERSION))-002 \
	$(GARNAME)$(subst .,,$(GARVERSION))-003 \
	$(GARNAME)$(subst .,,$(GARVERSION))-004
PATCHFILES += \
	$(DISTNAME)-shlib_libs.patch
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/ncursesw

PATCHDIRLEVEL = 0

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-multibyte \
	--enable-shared \
	--disable-static \
	--with-curses \
	--without-purify

CONFIGURE_ENV = \
	bash_cv_termcap_lib=libncursesw

include ../../gar.mk

patch-%: normal-patch-%
	@$(MAKECOOKIE)

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(call FIX_LIBTOOL,$(WORKSRC)/support/config.rpath)
	@$(MAKECOOKIE)
