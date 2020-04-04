GARNAME = libaio
GARVERSION = 0.3.111
CATEGORIES = lib
MASTER_SITES = https://pagure.io/libaio/archive/$(DISTNAME)/
DISTFILES = $(GARNAME)-$(DISTNAME).tar.gz
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/make
  
WORKSRC = $(WORKDIR)/$(GARNAME)-$(DISTNAME)

BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

INSTALL_OVERRIDE_DIRS = prefix includedir libdir

include ../../gar.mk
