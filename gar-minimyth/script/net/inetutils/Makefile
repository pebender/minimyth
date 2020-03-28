GARNAME = inetutils
GARVERSION = 1.9.4
CATEGORIES = net
MASTER_SITES = https://ftp.gnu.org/gnu/inetutils/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-path_procnet_dev.patch
LICENSE = 

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/ncursesw lib/readline

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-rlogind \
	--disable-rlogin \
	--disable-rcp \
	--disable-rshd \
	--disable-rsh \
	--disable-rpath

include ../../gar.mk
