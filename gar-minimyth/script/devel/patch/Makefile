GARNAME = patch
GARVERSION = 2.7.6
CATEGORIES = devel
MASTER_SITES = https://ftp.gnu.org/gnu/patch/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules

include ../../gar.mk
