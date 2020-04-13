GARNAME = mame
GARVERSION = 0.220
CATEGORIES = emulators
MASTER_SITES = https://github.com/mamedev/mame/archive/
DISTFILES = $(GARNAME)$(subst .,,$(GARVERSION)).tar.gz
PATCHFILES = \
	$(DISTNAME)-clang-detection.patch \
	$(DISTNAME)-ar.patch \
	$(DISTNAME).patch.gar
LICENSE = BSD_3_Clause/LGPL2_1/GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx build-tool/make db/sqlite lib/expat lib/flac lib/libjpeg lib/SDL2 lib/SDL2_ttf lib/zlib xorg/libXi xorg/libXinerama
BUILDDEPS = python/python

WORKSRC = $(WORKDIR)/mame-$(GARNAME)$(subst .,,$(GARVERSION))

BUILD_SCRIPTS   = $(WORKSRC)/makefile
INSTALL_SCRIPTS = custom

BUILD_ARGS  = \
	VERBOSE="1" \
	OVERRIDE_CC="$(CC)" \
	OVERRIDE_CXX="$(CXX)" \
	OVERRIDE_LD="$(CXX)" \
	OVERRIDE_AR="$(AR)" \
	PYTHON_EXECUTABLE="$(build_DESTDIR)$(build_bindir)/python" \
	CROSS_BUILD="$(CROSS_BUILD)" \
	NOWERROR="1" \
	USE_QTDEBUG="0" \
	OPTIMIZE="$(OPTIMIZE)" \
	ARCHOPTS="$(ARCHOPTS)" \
	TARGETOS="linux" \
	OPT_FLAGS="$(OPT_FLAGS)" \
	LDOPTS="$(LDOPTS)" \
	PTR64="$(PTR64)" \
	LTO="$(LTO)" \
	USE_LIBSDL=1 \
	USE_SYSTEM_LIB_EXPAT=1 \
	USE_SYSTEM_LIB_ZLIB=1 \
	USE_SYSTEM_LIB_JPEG=1 \
	USE_SYSTEM_LIB_FLAC=1 \
	USE_SYSTEM_LIB_SQLITE3=1

# MESA_INSTALL_ROOT = /opt/mesa
# SDL_INSTALL_ROOT = /opt/sdl2
# SDL_FRAMEWORK_PATH = $(HOME)/Library/Frameworks
# USE_LIBSDL = 1
# CYGWIN_BUILD = 1

include ../../gar.mk

CROSS_BUILD := $(if $(filter $(GARBUILD),$(GARHOST)),0,1)
OPTIMIZE := $(subst -O,,$(filter -O%,$(CFLAGS)))
ARCHOPTS := $(CFLAGS) $(CXXFLAGS) $(LDFLAGS)
OPT_FLAGS := $(CFLAGS) $(CXXFLAGS) $(LDFLAGS)
LDOPTS := $(CFLAGS) $(CXXFLAGS) $(LDFLAGS)
PTR64 := $(if $(filter x86_64,$(GARCH_FAMILY)),1,0)
LTO := $(if $(filter -flto,$(LDFLAGS)),1,0)

CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@$(if $(filter x86_64,$(GARCH_FAMILY)), \
		cp -f $(WORKSRC)/mame64 $(DESTDIR)$(bindir)/mame, \
		cp -f $(WORKSRC)/mame   $(DESTDIR)$(bindir)/mame)
	@$(MAKECOOKIE)
