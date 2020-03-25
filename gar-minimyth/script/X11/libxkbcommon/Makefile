GARNAME = libxkbcommon
GARVERSION = 0.9.1
CATEGORIES = X11
MASTER_SITES = https://xkbcommon.org/download/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/meson
BUILDDEPS =

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/meson
BUILD_SCRIPTS     = $(WORKBLD)/ninja
INSTALL_SCRIPTS   = $(WORKBLD)/ninja

CONFIGURE_ARGS  = \
	$(filter-out --exec_prefix=% --oldincludedir=%, $(DIRPATHS)) \
	--buildtype=release \
	-Db_asneeded=true \
	-Db_lto=false \
	-Denable-x11=false \
	-Denable-docs=false \
	-Denable-wayland=false \
	-Dxkb-config-root=$(datadir)/X11/xkb \
	-Dc="$(CC) $(CFLAGS)"
	-Dcc="$(CC) $(CFLAGS)"
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--cross-file $(GARHOST)
endif

include ../../gar.mk

# libxkbcommon 0.9.1 fails to compile with gcc 9.2.0's link time optimization enabled.
CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

CONFIGURE_ENV += \
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
