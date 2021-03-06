GARNAME = mednafen
GARVERSION = 1.24.3
CATEGORIES = emulators
MASTER_SITES = https://mednafen.github.io/releases/files/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx build-tool/make lib/alsa-lib lib/libsndfile lib/SDL2 lib/SDL2_net
BUILDDEPS =

WORKSRC = $(WORKDIR)/$(GARNAME)

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-rpath \
	--disable-nls \
	--enable-threads=posix \
	--disable-debugger \
	--disable-cjk-fonts \
	--disable-fancy-scalers \
	--disable-altivec \
	--enable-gb \
	--enable-gba \
	--enable-lynx \
	--enable-md \
	--enable-nes \
	--enable-ngp \
	--enable-pce \
	--enable-pce-fast \
	--enable-pcfx \
	--enable-psx \
	--enable-sms \
	--enable-snes \
	--enable-vb \
	--enable-wswan \
	--enable-alsa \
	--disable-alsatest \
	--disable-jack \
	--disable-sdltest \
	--without-libiconv-prefix \
	--without-libpth-prefix \
	--without-included-gettext \
	--without-libintl-prefix \
	--with-libsndfile

CONFIGURE_ENV = \
	SDL_CONFIG=$(DESTDIR)$(bindir)/config.d/sdl2-config

include ../../gar.mk

CFLAGS += -Wl,-z,notext
CXXFLAGS += -Wl,-z,notext
LDFLAGS += -Wl,-z,notext

pre-configure:
	@cp -fv $(build_DESTDIR)$(build_datadir)/libtool/config/config.guess $(WORKSRC)/config.guess
	@cp -fv $(build_DESTDIR)$(build_datadir)/libtool/config/config.sub   $(WORKSRC)/config.sub
	@$(MAKECOOKIE)
