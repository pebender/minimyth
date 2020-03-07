GARNAME = libffi
GARVERSION = $(LIBFFI_VERSION)
CATEGORIES = lib
MASTER_SITES = https://github.com/libffi/libffi/releases/download/v$(GARVERSION)/
DISTFILES  = $(DISTNAME).tar.gz
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
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

post-install: post-install-lib-wrappers

post-install-lib-wrappers::
	@rm -f $(DESTDIR)$(libdir)/libffi.la
	@$(MAKECOOKIE)
