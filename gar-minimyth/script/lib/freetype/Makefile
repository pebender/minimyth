GARNAME = freetype
GARVERSION = 2.4.3
CATEGORIES = lib
MASTER_SITES = http://easynews.dl.sourceforge.net/sourceforge/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME).patch.gar
LICENSE = FTL/GPL2
FTL_LICENSE_TEXT = $(WORKSRC)/docs/FTL.TXT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--with-gnu-ld

CONFIGURE_ENV  = \
	CC_BUILD="$(build_CC) $(build_CFLAGS)"

include ../../gar.mk

pre-configure:
	@cd $(WORKSRC)/builds/unix ; aclocal -I . --force
	@cd $(WORKSRC)/builds/unix ; libtoolize --force --copy --install
	@cd $(WORKSRC)/builds/unix ; autoconf --force
	@$(call FIX_LIBTOOL,$(WORKSRC)/builds/unix/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libfreetype.la
	@ln -sf freetype2/freetype $(DESTDIR)$(includedir)/freetype
	@rm -f $(DESTDIR)$(bindir)-config/freetype-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)freetype-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/freetype-config $(DESTDIR)$(bindir)-config/freetype-config
	@$(if $(compiler_prefix), ln -s freetype-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)freetype-config)
	@$(MAKECOOKIE)