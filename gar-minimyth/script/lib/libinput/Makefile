GARNAME = libinput
GARVERSION = 1.15.4
CATEGORIES = lib
MASTER_SITES = https://www.freedesktop.org/software/libinput/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c
BUILDDEPS = devel/meson

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/meson
BUILD_SCRIPTS     = $(WORKBLD)/ninja
INSTALL_SCRIPTS   = $(WORKBLD)/ninja

CONFIGURE_ARGS  = \
	$(filter-out --exec_prefix=% --oldincludedir=%, $(DIRPATHS)) \
	--buildtype=release \
	-Db_asneeded=true \
	-Db_lto=true \
	-Dlibwacom=false \
	-Ddebug-gui=false \
	-Dtests=false \
	-Ddocumentation=false
ifneq ($(DESTIMG),build)
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
