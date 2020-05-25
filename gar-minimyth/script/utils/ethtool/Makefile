GARNAME = ethtool
GARVERSION = 5.6
CATEGORIES = utils
MASTER_SITES = https://www.kernel.org/pub/software/network/ethtool/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c net/libmnl

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program
