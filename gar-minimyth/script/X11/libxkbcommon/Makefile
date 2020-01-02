GARNAME = libxkbcommon
GARVERSION = 0.9.1
CATEGORIES = X11
MASTER_SITES = https://xkbcommon.org/download/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c xorg/xorg

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/meson
BUILD_SCRIPTS     = $(WORKBLD)/ninja
INSTALL_SCRIPTS   = $(WORKBLD)/ninja

CONFIGURE_ARGS  = \
	$(filter-out --exec_prefix=% --oldincludedir=%, $(DIRPATHS)) \
	--buildtype=release \
	-Db_asneeded=true \
	-Db_lto=true \
	-Denable-docs=false \
	-Denable-wayland=false \
	-Dxkb-config-root=$(datadir)/X11/xkb
ifneq ("$(DESTIMG),"build)
CONFIGURE_ARGS += \
	--cross-file $(GARHOST)
endif

include ../../gar.mk

CONFIGURE_ENV := \
	XDG_DATA_HOME=$(build_DESTDIR)$(build_datadir)

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
