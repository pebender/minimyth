GARNAME = argp-standalone
GARVERSION = 1.3
CATEGORIES = lib
MASTER_SITES = https://www.lysator.liu.se/~nisse/misc/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-gnu89-inline.patch $(DISTNAME)-throw-in-funcdef.patch
LICENSE =

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c build-tool/autotools

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = lib.a

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

install-lib.a:
	@install -v --mode=0755 $(WORKSRC)/libargp.a $(DESTDIR)$(libdir)/libargp.a
	@install -v --mode=0644 $(WORKSRC)/argp.h $(DESTDIR)$(includedir)/argp.h
	@$(MAKECOOKIE)
