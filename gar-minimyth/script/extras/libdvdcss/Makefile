GARNAME = libdvdcss
GARVERSION = 1.4.2
CATEGORIES = extras
MASTER_SITES = https://download.videolan.org/pub/libdvdcss/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/make
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-doc

include ../../gar.mk
include ../extras.mk

post-install:
	@rm -f $(DESTDIR)$(extras_libdir)/libdvdcss.la
	@$(MAKECOOKIE)
