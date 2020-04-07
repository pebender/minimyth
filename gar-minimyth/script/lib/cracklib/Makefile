GARNAME = cracklib
GARVERSION = 2.9.7
CATEGORIES = lib
MASTER_SITES = https://github.com/cracklib/cracklib/releases/download/v$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/make lib/zlib
  
CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-nls \
	--disable-rpath \
	--with-zlib \
	--without-python

include ../../gar.mk

post-install:
	@rm -fv $(DESTDIR)$(libdir)/libcrack.la
	@$(MAKECOOKIE)
