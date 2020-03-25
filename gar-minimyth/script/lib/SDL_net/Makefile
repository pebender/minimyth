GARNAME = SDL_net
GARVERSION = 1.2.8
CATEGORIES = lib
MASTER_SITES = https://www.libsdl.org/projects/SDL_net/release/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-configure.patch
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/SDL

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--disable-sdltest \
	--disable-gui

CONFIGURE_ENV = \
	SDL_CONFIG=$(DESTDIR)$(bindir)/config/sdl-config

include ../../gar.mk

pre-configure:
	@cd $(WORKSRC) ; rm -rf acinclude
	@cd $(WORKSRC) ; mkdir -p acinclude
	@cd $(WORKSRC) ; rm -f aclocal.m4
	@cd $(WORKSRC) ; touch AUTHORS
	@cd $(WORKSRC) ; touch ChangeLog
	@cd $(WORKSRC) ; touch COPYING
	@cd $(WORKSRC) ; touch INSTALL
	@cd $(WORKSRC) ; touch NEWS
	@cd $(WORKSRC) ; touch README
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libSDL_net.la
	@$(MAKECOOKIE)
