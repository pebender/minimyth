GARNAME = confuse
GARVERSION = 3.2.2
CATEGORIES = lib
MASTER_SITES = https://github.com/martinh/libconfuse/releases/download/v$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--disable-rpath \
	--disable-examples \
	--enable-nls \
	--disable-rpath

include ../../gar.mk

post-install:
	@rm -fv $(DESTDIR)$(libdir)/libconfuse.la
	@$(MAKECOOKIE)
