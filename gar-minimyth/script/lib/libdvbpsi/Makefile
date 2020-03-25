GARNAME = libdvbpsi
GARVERSION = 1.3.3
CATEGORIES = lib
MASTER_SITES = https://download.videolan.org/pub/videolan/libdvbpsi/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-debug \
	--disable-gcc-sanitize \
	--enable-release

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libdvbpsi.la
	@$(MAKECOOKIE)
