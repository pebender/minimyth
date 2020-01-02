GARNAME = popt
GARVERSION = 1.16
CATEGORIES = lib
MASTER_SITES = https://fossies.org/linux/misc/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = \
	$(DISTNAME)-automake_1.12.patch \
	$(DISTNAME)-disable_tests.patch
LICENSE = MIT

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
	--disable-rpath

include ../../gar.mk

pre-configure:
	@$(call RUN_GETTEXTIZE)
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libpopt.la
	@$(MAKECOOKIE)
