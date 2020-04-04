GARNAME = stella
GARVERSION = 6.1
CATEGORIES = emulators
MASTER_SITES = https://github.com/stella-emu/stella/releases/download/$(GARVERSION)/
DISTFILES = $(DISTNAME)-src.tar.xz
#PATCHFILES = $(DISTNAME).patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/cxx build-tool/make lib/libpng lib/SDL2 lib/zlib xorg/xorg

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	--prefix="$(prefix)" \
	--bindir="$(bindir)" \
	--docdir="$(docdir)/stella" \
	--datadir="$(datadir)" \
	--enable-gui \
	--enable-sound \
	--enable-debugger \
	--enable-joystick \
	--enable-cheats \
	--enable-png \
	--enable-zip \
	--disable-sqlite \
	--enable-windowed \
	--enable-shared \
	--disable-static \
	--disable-profile \
	--disable-debug

include ../../gar.mk

LDFLAGS := $(CXXFLAGS) $(LDFLAGS)
