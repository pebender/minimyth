GARNAME = squashfs-tools
GARVERSION = 4.4
CATEGORIES = lib
MASTER_SITES = https://github.com/plougher/squashfs-tools/archive/
DISTFILES = $(GARVERSION).tar.gz
PATCHFILES = $(DISTNAME).patch.gar
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/zlib utils/xz

BUILD_SCRIPTS   = $(WORKSRC)/squashfs-tools/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/squashfs-tools/Makefile

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program
