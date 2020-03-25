GARNAME = findutils
GARVERSION = 4.7.0
CATEGORIES = utils
MASTER_SITES = https://ftp.gnu.org/gnu/findutils/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--disable-silent-rules \
	--disable-largefile \
	--enable-threads \
	--enable-assert \
	--disable-rpath \
	--enable-nls \
	--without-libpth-prefix \
	--without-selinux \
	--without-libiconv-prefix \
	--without-libintl-prefix

include ../../gar.mk
