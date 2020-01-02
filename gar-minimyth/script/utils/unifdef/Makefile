GARNAME = unifdef
GARVERSION = 2.11
CATEGORIES = utils
MASTER_SITES = https://dotat.at/prog/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME).patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

include ../../gar.mk

pre-build:
	@make -C $(WORKSRC) clean
	@$(MAKECOOKIE)
