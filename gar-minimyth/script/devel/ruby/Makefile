GARNAME = ruby
# 2.7.1 fails to compile
GARVERSION = 2.6.5
CATEGORIES = devel
MASTER_SITES = https://cache.ruby-lang.org/pub/ruby/2.6/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c build-tool/autotools
BUILDDEPS = devel/ruby-mini

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-rpath \
	--with-baseruby=$(build_DESTDIR)$(build_bindir)/miniruby
BUILD_ARGS = \
	Q=""
INSTALL_ARGS = \
	Q=""

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)
