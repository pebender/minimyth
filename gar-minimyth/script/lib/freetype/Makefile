GARNAME = freetype
GARVERSION = 2.10.2
CATEGORIES = lib
MASTER_SITES = https://download.savannah.gnu.org/releases/freetype/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = FTL/GPL2
FTL_LICENSE_TEXT = $(WORKSRC)/docs/FTL.TXT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/zlib utils/bzip2

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-biarch-config \
	--enable-freetype-config \
	--enable-mmap \
	--enable-shared \
	--disable-static \
	--with-zlib \
	--with-bzip2 \
	--without-png \
	--without-harfbuzz

CONFIGURE_ENV  = \
	CC_BUILD="$(build_CC) $(build_CFLAGS)"

include ../../gar.mk

PARALLELMFLAGS := -j1

pre-configure:
	@cd $(WORKSRC)/builds/unix ; aclocal -I . --force
	@cd $(WORKSRC)/builds/unix ; libtoolize --force --copy --install
	@cd $(WORKSRC)/builds/unix ; autoconf --force
	@$(call FIX_LIBTOOL,$(WORKSRC)/builds/unix/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libfreetype.la
	@ln -sf freetype2/freetype $(DESTDIR)$(includedir)/freetype
	@rm -f $(DESTDIR)$(bindir)/config.d/freetype-config
	@rm -f $(DESTDIR)$(bindir)/config.d/$(GARHOST)-freetype-config
	@mkdir -p $(DESTDIR)$(bindir)/config.d
	@mv $(DESTDIR)$(bindir)/freetype-config $(DESTDIR)$(bindir)/config.d/freetype-config
	@ln -s freetype-config $(DESTDIR)$(bindir)/config.d/$(GARHOST)-freetype-config
	@$(MAKECOOKIE)
