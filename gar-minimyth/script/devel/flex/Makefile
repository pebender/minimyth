GARNAME = flex
GARVERSION = 2.6.4
CATEGORIES = devel
MASTER_SITES = https://github.com/westes/flex/releases/download/v$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-perl.patch.gar
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT=$(WORKSRC)/COPYING

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c build-tool/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-rpath

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libfl.la
	@rm -f $(DESTDIR)$(libdir)/libfl_pic.la
	@rm -f $(DESTDIR)$(libdir)/libfl.a
	@rm -f $(DESTDIR)$(libdir)/libfl_pic.a
	@$(MAKECOOKIE)
