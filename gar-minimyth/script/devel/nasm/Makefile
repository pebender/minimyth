GARNAME = nasm
GARVERSION = 2.14.02
CATEGORIES = devel
MASTER_SITES = https://www.nasm.us/pub/nasm/releasebuilds/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = BSD_2_Clause

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile
                                                                                                                             
CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

INSTALL_ENV = INSTALLROOT="$(DESTDIR)"

include ../../gar.mk
