GARNAME = libexif
GARVERSION = 0.6.21
CATEGORIES = lib
MASTER_SITES = https://sourceforge.net/projects/libexif/files/libexif/$(GARVERSION)/
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
	--enable-shared \
	--disable-static \
	--disable-docs \
	--disable-internal-docs \
	--enable-nls \
	--disable-rpath \
	--with-doc-dir="$(docdir)"

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libexif.la
	@$(MAKECOOKIE)
