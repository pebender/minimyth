GARNAME = rsync
GARVERSION = $(RSYNC_VERSION)
CATEGORIES = net
MASTER_SITES  = https://download.samba.org/pub/rsync/src/
MASTER_SITES += https://fossies.org/linux/misc/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = 

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/popt lib/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk
