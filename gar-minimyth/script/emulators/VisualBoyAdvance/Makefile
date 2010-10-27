GARNAME = VisualBoyAdvance
GARVERSION = 1.7.2
CATEGORIES = emulators
MASTER_SITES = http://easynews.dl.sourceforge.net/sourceforge/vba/
DISTFILES = $(GARNAME)-src-$(GARVERSION).tar.gz
PATCHFILES = $(DISTNAME)-configure.patch $(DISTNAME)-strrchr.patch $(DISTNAME)-x86_64.patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lang/cxx lib/libpng lib/SDL lib/zlib xorg/xorg
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
	--with-x \
	--with-gnu-ld

CONFIGURE_ENV = \
	SDL_CONFIG=$(DESTDIR)$(prefix)/bin-config/sdl-config

include ../../gar.mk

# Suffers from bug 44149 <http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44149>.
CFLAGS   := $(filter-out -fuse-linker-plugin, $(CFLAGS))
CXXFLAGS := $(filter-out -fuse-linker-plugin, $(CXXFLAGS))
LDFLAGS  := $(filter-out -fuse-linker-plugin, $(LDFLAGS))

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)