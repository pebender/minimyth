GARNAME = rpcsvc-proto
GARVERSION = 1.4.1
CATEGORIES = net
MASTER_SITES = https://github.com/thkukuk/rpcsvc-proto/releases/download/v$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = BSD_3_Clause

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-nls \
	--disable-rpath

include ../../gar.mk

LDFLAGS += -lintl
