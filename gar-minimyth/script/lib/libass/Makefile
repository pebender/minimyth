GARNAME = libass
GARVERSION = 0.14.0
CATEGORIES = lib
MASTER_SITES = https://github.com/libass/libass/releases/download/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = ISC

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c build-tool/autotools lib/fontconfig lib/freetype lib/fribidi

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-test \
	--enable-fontconfig \
	--disable-harfbuzz

include ../../gar.mk

LDFLAGS += -Wl,-z,notext

post-install:
	@rm -f $(DESTDIR)$(libdir)/libass.la
	@$(MAKECOOKIE)
