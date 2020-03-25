GARNAME = libirman
GARVERSION = 0.4.6
CATEGORIES = lib
MASTER_SITES = https://sourceforge.net/projects/libirman/files/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2/LGPL2

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
	--disable-swtest

include ../../gar.mk

post-install:
	@cp -fv $(WORKSRC)/test_io   $(DESTDIR)/$(bindir)
	@cp -fv $(WORKSRC)/test_name $(DESTDIR)/$(bindir)
	@cp -fv $(WORKSRC)/test_func $(DESTDIR)/$(bindir)
	@rm -fv $(DESTDIR)$(libdir)/libirman.la
	@$(MAKECOOKIE)
