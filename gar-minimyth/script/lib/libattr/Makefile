GARNAME = attr
GARVERSION = 2.4.48
CATEGORIES = lib
MASTER_SITES = https://download.savannah.gnu.org/releases/attr/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-rpath \
	--enable-debug

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libattr.la
	@$(MAKECOOKIE)
