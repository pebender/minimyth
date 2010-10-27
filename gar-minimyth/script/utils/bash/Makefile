GARNAME = bash
GARVERSION = 4.1
CATEGORIES = utils
MASTER_SITES  = http://ftp.gnu.org/gnu/$(GARNAME)/
MASTER_SITES += http://ftp.gnu.org/gnu/$(GARNAME)/$(DISTNAME)-patches/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES  = \
	$(GARNAME)$(subst .,,$(GARVERSION))-001 \
	$(GARNAME)$(subst .,,$(GARVERSION))-002 \
	$(GARNAME)$(subst .,,$(GARVERSION))-003 \
	$(GARNAME)$(subst .,,$(GARVERSION))-004 \
	$(GARNAME)$(subst .,,$(GARVERSION))-005 \
	$(GARNAME)$(subst .,,$(GARVERSION))-006 \
	$(GARNAME)$(subst .,,$(GARVERSION))-007 \
	$(GARNAME)$(subst .,,$(GARVERSION))-008 \
	$(GARNAME)$(subst .,,$(GARVERSION))-009
PATCHFILES += $(DISTNAME)-perl.patch.gar
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

PATCHDIRLEVEL = 0

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--with-gnu-ld

include ../../gar.mk

libdir  := $(elibdir)
bindir  := $(ebindir)
sbindir := $(esbindir)

patch-%: normal-patch-%
	@$(MAKECOOKIE)

pre-configure:
	@# Running autotools fails.
	@#$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@ln -fs bash $(DESTDIR)$(bindir)/sh
	@$(MAKECOOKIE)