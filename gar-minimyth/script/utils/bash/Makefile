GARNAME = bash
GARVERSION = $(BASH_VERSION)
CATEGORIES = utils
MASTER_SITES  = https://ftp.gnu.org/gnu/$(GARNAME)/
MASTER_SITES += https://ftp.gnu.org/gnu/$(GARNAME)/$(DISTNAME)-patches/
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
	$(GARNAME)$(subst .,,$(GARVERSION))-009 \
	$(GARNAME)$(subst .,,$(GARVERSION))-010 \
	$(GARNAME)$(subst .,,$(GARVERSION))-011 \
	$(GARNAME)$(subst .,,$(GARVERSION))-012 \
	$(GARNAME)$(subst .,,$(GARVERSION))-013 \
	$(GARNAME)$(subst .,,$(GARVERSION))-014 \
	$(GARNAME)$(subst .,,$(GARVERSION))-015 \
	$(GARNAME)$(subst .,,$(GARVERSION))-016 \
	$(GARNAME)$(subst .,,$(GARVERSION))-017 \
	$(GARNAME)$(subst .,,$(GARVERSION))-018 \
	$(GARNAME)$(subst .,,$(GARVERSION))-019 \
	$(GARNAME)$(subst .,,$(GARVERSION))-020 \
	$(GARNAME)$(subst .,,$(GARVERSION))-021 \
	$(GARNAME)$(subst .,,$(GARVERSION))-022 \
	$(GARNAME)$(subst .,,$(GARVERSION))-023
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

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

CONFIGURE_ENV = \
	bash_cv_termcap_lib="gnutermcap"

include ../../gar.mk

libdir  := $(elibdir)
bindir  := $(ebindir)
sbindir := $(esbindir)

patch-%: normal-patch-%
	@$(MAKECOOKIE)

pre-configure:
	echo $(PATH)

post-install:
	@ln -sfv bash $(DESTDIR)$(bindir)/sh
	@$(MAKECOOKIE)
