GARNAME = strace
GARVERSION = 5.6
CATEGORIES = devel
MASTER_SITES = https://github.com/strace/strace/releases/download/v$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = BSD_3_Clause

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
