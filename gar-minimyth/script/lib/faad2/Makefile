GARNAME = faad2
GARVERSION = 2.8.8
CATEGORIES = lib
MASTER_SITES = https://sourceforge.net/projects/faac/files/faad2-src/faad2-2.8.0/
DISTFILES = $(DISTNAME).tar.gz
xPATCHFILES = \
	$(DISTNAME)-mp4ff_shared.patch \
	$(DISTNAME)-automake_1.13.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c build-tool/autotools
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--without-xmms \
	--without-drm

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libfaad.la
	@#rm -f $(DESTDIR)$(libdir)/libmp4ff.a
	@#rm -f $(DESTDIR)$(libdir)/libmp4ff.la
	@$(MAKECOOKIE)
