GARNAME = libedit
GARVERSION = $(LIBEDIT_VERSION)
CATEGORIES = lib
MASTER_SITES = https://www.thrysoee.dk/editline/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = BSD_3_Clause

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-nls \
	--disable-rpath

include ../../gar.mk
