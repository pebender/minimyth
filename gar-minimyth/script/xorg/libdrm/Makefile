GARNAME = libdrm
GARVERSION = 2.4.101
CATEGORIES = xorg
MASTER_SITES = https://dri.freedesktop.org/libdrm/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES = $(DISTNAME)-o_cloexec.patch
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	devel/meson \
	xorg/libpciaccess \
	xorg/libpthread-stubs
ifneq ($(DESTIMG),build)
DEPENDS += system/udev
endif

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/meson
BUILD_SCRIPTS     = $(WORKBLD)/ninja
INSTALL_SCRIPTS   = $(WORKBLD)/ninja

CONFIGURE_ARGS  = \
	$(filter-out --exec_prefix=% --oldincludedir=%, $(DIRPATHS)) \
	--buildtype=release \
	-Db_asneeded=true \
	-Db_lto=false \
	-Dlibkms=true \
	-Dintel=true \
	-Dradeon=true \
	-Damdgpu=true \
	-Dnouveau=true \
	-Dvmwgfx=false \
	-Domap=false \
	-Dexynos=false \
	-Dfreedreno=false \
	-Dtegra=false \
	-Dvc4=false \
	-Detnaviv=false \
	-Dcairo-tests=false \
	-Dman-pages=false \
	-Dvalgrind=false \
	-Dfreedreno-kgsl=false \
	-Dinstall-test-programs=false \
	--native-file $(GARBUILD)
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--cross-file $(GARHOST)
endif
ifeq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	-Dudev=false
else
CONFIGURE_ARGS += \
	-Dudev=true
endif
CONFIGURE_ENV = \
	XDG_DATA_DIRS="$(build_DESTDIR)$(build_datadir)" \
	XDG_DATA_HOME="$(build_DESTDIR)$(build_datadir)"

GAR_EXTRA_CONF += xorg/xorg/package-api.mk
include ../../gar.mk

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
