GARNAME = hdparm
GARVERSION = 9.58
CATEGORIES = disk
MASTER_SITES = https://sourceforge.net/projects/hdparm/files/hdparm/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = hdparm
hdparm_LICENSE_TEXT = $(WORKSRC)/LICENSE.TXT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/make

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

DEFAULT_ARGS = \
	binprefix="$(prefix)" \
	manprefix="$(prefix)" \
	exec_prefix="$(exec_prefix)" \
	sbindir="$(sbindir)" \
	mandir="$(mandir)" \
	oldmandir="$(mandir)" \
	LDFLAGS="$(LDFLAGS) -s"
BUILD_ARGS   = \
	$(DEFAULT_ARGS)
INSTALL_ARGS = \
	$(DEFAULT_ARGS)

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

LDFLAGS := $(CFLAGS) $(LDFLAGS)
