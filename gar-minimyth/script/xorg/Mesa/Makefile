GARNAME = mesa
GARVERSION = 18.2.8
CATEGORIES = xorg
MASTER_SITES  = https://mesa.freedesktop.org/archive/
MASTER_SITES += https://mesa.freedesktop.org/archive/18.0.0/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES = \
	$(DISTNAME)-disable_intel_tools.patch \
	$(DISTNAME)-libxv.patch \
	$(DISTNAME)-meson_libxv.patch
LICENSE = LGPL2/MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx build-tool/meson devel-target-llvm/llvm lib/expat lib/libelf lib/zlib utils/lm_sensors X11/libva-mini X11/libvdpau \
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
	xorg/makedepend

PWD := $(shell pwd)

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/meson
BUILD_SCRIPTS     = $(WORKBLD)/ninja
INSTALL_SCRIPTS   = $(WORKBLD)/ninja source

LDFLAGS := $(LDFLAGS) -lLLVv

CONFIGURE_ARGS  = \
	$(filter-out --exec_prefix=% --oldincludedir=%, $(DIRPATHS)) \
	--buildtype=release \
	-Db_asneeded=true \
	-Db_lto=false \
	-Dplatforms='x11,drm' \
	-Ddri3=true \
	-Ddri-drivers='i915,i965,nouveau,r100,,r200' \
	-Dgallium-drivers='radeonsi,r300,r600,nouveau,swrast,svga' \
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
	-Dlibunwind=false \
	-Dlmsensors=true \
	-Dbuild-tests=false \
	-Dselinux=false \
	-Dosmesa='none' \
	-Dtools='' \
	-Dpower8=false \
	-Dxlib-lease=false
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--cross-file $(GARHOST)
endif

GAR_EXTRA_CONF += xorg/xorg/package-api.mk
include ../../gar.mk

CONFIGURE_ENV := \
	XDG_DATA_HOME=$(build_DESTDIR)$(build_datadir)

# mesa 18.2.8 fails to compile with gcc 9.2.0's link time optimization enabled.
CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

LDFLAGS  := $(LDFLAGS) -lXv
LDFLAGS  := $(LDFLAGS) -lXv

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
