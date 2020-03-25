GARNAME = m4
GARVERSION = 1.4.18
CATEGORIES = utils
MASTER_SITES = https://ftp.gnu.org/gnu/m4/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME)-glibc-change-work-around.patch
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = build-tool/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-rpath

include ../../gar.mk
