GARNAME = glib
GARVERSION = 2.64.2
CATEGORIES = glib
MASTER_SITES = https://ftp.gnome.org/pub/gnome/sources/glib/2.64/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES = \
	$(DISTNAME)-build_tools.patch.gar
LICENSE = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c build-tool/meson lib/libelf lib/libffi lib/pcre lib/zlib utils/util-linux
BUILDDEPS =
ifneq ($(DESTIMG),build)
BUILDDEPS += lib/glib
endif

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/meson
BUILD_SCRIPTS = $(WORKBLD)/ninja
INSTALL_SCRIPTS = $(WORKBLD)/ninja

CONFIGURE_ARGS  = \
	$(subst =$(prefix)/,=,$(filter-out --exec_prefix=% --oldincludedir=%, $(DIRPATHS))) \
	-Dbuildtype=release \
	--native-file="$(GARBUILD)" \
	-Db_asneeded=true \
	-Db_lto=true \
	-Dselinux=disabled \
	-Dc_args="$(CFLAGS)" \
	-Dcpp_args="$(CXXFLAGS)" \
	-Dc_link_args="$(LDFLAGS)" \
	-Dcpp_link_args="$(LDFLAGS)"

ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--cross-file="$(GARHOST)"
endif

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

LDFLAGS += -lintl

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
