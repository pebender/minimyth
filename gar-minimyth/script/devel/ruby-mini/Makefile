GARNAME = ruby
GARVERSION = 1.8.7-p374
CATEGORIES = devel
MASTER_SITES = https://cache.ruby-lang.org/pub/ruby/1.8/
DISTFILES = $(DISTNAME).tar.gz
xPATCHFILES = \
	$(DISTNAME)-perl.patch.gar \
	$(DISTNAME).patch
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/autotools

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = miniruby

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-rpath
BUILD_ARGS     = \
	Q="" \
	miniruby
INSTALL_ARGS = \
	Q=""

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)

install-miniruby:
	@cp -fv $(WORKSRC)/miniruby $(DESTDIR)$(bindir)/miniruby
	@$(MAKECOOKIE)
