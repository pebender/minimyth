GARNAME = make
GARVERSION = $(MAKE_VERSION)
CATEGORIES = devel
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES  = $(DISTNAME)-4.2.1.patch
ifneq ($(GARHOST),$(GARBUILD))
PATCHFILES += $(DISTNAME)-perl.patch.gar
endif
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-nls \
	--disable-rpath

include ../../gar.mk
