GARNAME = lzo
GARVERSION = 2.10
CATEGORIES = lib
MASTER_SITES = https://www.oberhumer.com/opensource/lzo/download/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared

include ../../gar.mk

post-install:
	@rm -fv $(DESTDIR)$(libdir)/liblzo2.la
	@$(MAKECOOKIE)
