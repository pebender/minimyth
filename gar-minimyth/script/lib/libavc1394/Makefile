GARNAME = libavc1394
GARVERSION = 0.5.4
CATEGORIES = lib
MASTER_SITES = https://sourceforge.net/projects/libavc1394/files/libavc1394/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/make lib/libraw1394

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libavc1394.la
	@rm -f $(DESTDIR)$(libdir)/librom1394.la
	@$(MAKECOOKIE)
