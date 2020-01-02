GARNAME = libffi
GARVERSION = 3.3
CATEGORIES = lib
MASTER_SITES = https://github.com/libffi/libffi/releases/download/v$(GARVERSION)/
DISTFILES  = $(DISTNAME).tar.gz
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--disable-docs \
	--disable-debug \
	--enable-structs \
	--enable-raw-api \
	--disable-purify-safety \
	--disable-multi-os-directory \
	--enable-symvers

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@$(MAKECOOKIE)
