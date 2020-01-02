GARNAME = ruby
GARVERSION = 2.6.5
CATEGORIES = devel
MASTER_SITES = https://cache.ruby-lang.org/pub/ruby/2.6/
DISTFILES = $(DISTNAME).tar.gz
xPATCHFILES = \
	$(DISTNAME)-perl.patch.gar \
	$(DISTNAME).patch
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS = devel/ruby-mini

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-rpath \
	--with-baseruby=$(build_DESTDIR)$(build_bindir)/miniruby

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)
