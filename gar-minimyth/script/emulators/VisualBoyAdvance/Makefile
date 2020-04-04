GARNAME = VisualBoyAdvance
GARVERSION = 1.7.2
CATEGORIES = emulators
MASTER_SITES = https://sourceforge.net/projects/vba/files/VisualBoyAdvance/$(GARVERSION)/
DISTFILES = $(GARNAME)-src-$(GARVERSION).tar.gz
PATCHFILES = \
	$(DISTNAME)-libpng_1.5.patch \
	$(DISTNAME)-zlib_1.2.6.patch \
	$(DISTNAME)-configure.patch \
	$(DISTNAME)-strrchr.patch \
	$(DISTNAME)-x86_64.patch \
	$(DISTNAME)-cheats_cpp.patch \
	$(DISTNAME)-debugger.patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lang/cxx build-tool/autotools lib/libpng lib/SDL lib/zlib xorg/xorg
BUILDDEPS = devel/nasm

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes="$(DESTDIR)$(includedir)" \
	--x-libraries="$(DESTDIR)$(libdir)" \
	$(if $(filter i386,$(GARCH_FAMILY)),--disable-c-core,--enable-c-core) \
	--disable-profiling \
	--enable-sdl \
	--disable-gtk \
	--disable-dev \
	--disable-sdltest \
	--disable-rpath \
	$(if $(filter i386,$(GARCH_FAMILY)),--with-mmx,--without-mmx) \
	--with-x

CONFIGURE_ENV = \
	SDL_CONFIG=$(DESTDIR)$(bindir)/config/sdl-config

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)
