GARNAME = coreutils
GARVERSION = $(COREUTILS_VERSION)
CATEGORIES = utils
MASTER_SITES = https://ftp.gnu.org/gnu/coreutils/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES = $(DISTNAME)-sysinfo.patch
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-rpath \
	--without-openssl

GAR_EXTRA_CONF += utils/coreutils/package-api.mk
include ../../gar.mk
