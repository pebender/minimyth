GARNAME = mesa
GARVERSION = 20.0.4
CATEGORIES = xorg
MASTER_SITES  = https://mesa.freedesktop.org/archive/
MASTER_SITES += https://mesa.freedesktop.org/archive/20.0.0/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = LGPL2/MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx build-tool/meson lib/expat lib/libelf lib/llvm lib/zlib utils/lm-sensors X11/libva-mini X11/libvdpau \
	xorg/libdrm \
	xorg/libpthread-stubs \
	xorg/libX11 \
	xorg/libxcb \
	xorg/libXdamage \
	xorg/libXext \
	xorg/libXfixes \
	xorg/libXrandr \
	xorg/libXv \
	xorg/libXvMC \
	xorg/libxshmfence \
	xorg/libXxf86vm \
	xorg/xorgproto
BUILDDEPS = lib/libxml2 \
	xorg/makedepend \
	python/python-mako

PWD := $(shell pwd)

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/meson
BUILD_SCRIPTS     = $(WORKBLD)/ninja
INSTALL_SCRIPTS   = $(WORKBLD)/ninja source

# 20.0.4 fails to configure with meson 0.54.0
#	-Dgallium-drivers='radeonsi,r300,r600,nouveau,swrast,svga'

CONFIGURE_ARGS  = \
	$(filter-out --exec_prefix=% --oldincludedir=%, $(DIRPATHS)) \
	--buildtype=release \
	-Db_asneeded=true \
	-Db_lto=false \
	-Dplatforms='x11,drm' \
	-Ddri3=true \
	-Ddri-drivers='i915,i965,nouveau,r100,,r200' \
	-Dgallium-drivers='r300,r600,nouveau,svga' \
	-Dgallium-vdpau=true \
	-Dvdpau-libs-path='$(libdir)/vdpau' \
	-Dgallium-xvmc=true \
	-Dxvmc-libs-path='$(libdir)' \
	-Dgallium-omx='disabled' \
	-Dgallium-va=true \
	-Dva-libs-path='$(libdir)/dri' \
	-Dgallium-xa=false \
	-Dgallium-nine=false \
	-Dgallium-opencl='disabled' \
	-Dvulkan-drivers='' \
	-Dshader-cache=false \
	-Dshared-glapi=true \
	-Dllvm=false \
	-Dgles1=false \
	-Dgles2=false \
	-Dopengl=true \
	-Dgbm=true \
	-Dglx=dri\
	-Degl=true \
	-Dglvnd=false \
	-Dasm=true \
	-Dglx-read-only-text=false \
	-Dvalgrind=false \
	-Dlibunwind=true \
	-Dlmsensors=true \
	-Dbuild-tests=false \
	-Dselinux=false \
	-Dosmesa='none' \
	-Dtools='' \
	-Dpower8=false \
	-Dxlib-lease=false \
	--native-file $(GARBUILD)
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--cross-file $(GARHOST) \
	-Dlibunwind=false
endif

GAR_EXTRA_CONF += xorg/xorg/package-api.mk
include ../../gar.mk

CONFIGURE_ENV := \
	XDG_DATA_DIRS="$(build_DESTDIR)$(build_datadir)" \
	XDG_DATA_HOME="$(build_DESTDIR)$(build_datadir)"

# mesa 10.0.4 fails to compile with llvm 10.0.0 link time optimization enabled.
CFLAGS   := $(CFLAGS) -fno-lto
CXXFLAGS := $(CXXFLAGS) -fno-lto
LDFLAGS  := $(LDFLAGS) -fno-lto

configure-%/meson:
	@mkdir -pv $(WORKBLD)
	@$(CONFIGURE_ENV) meson setup $(WORKSRC) $* $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-%/ninja:
	@echo " ==> Running ninja in $*"
	@$(BUILD_ENV) ninja -C $* -v $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/ninja: 
	@echo " ==> Running ninja install in $*"
	@$(INSTALL_ENV) ninja -C $* -v install $(INSTALL_ARGS)
	@$(MAKECOOKIE)

install-source:
	@mkdir -p $(DESTDIR)$(sourcedir)
	@rm -f $(DESTDIR)$(sourcedir)/Mesa
	@ln -sf $(PWD)/$(WORKSRC) $(DESTDIR)$(sourcedir)/Mesa
	@$(MAKECOOKIE)
