GARNAME = meson
GARVERSION = $(MESON_VERSION)
CATEGORIES = devel
MASTER_SITES = https://github.com/mesonbuild/meson/releases/download/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = \
	$(DISTNAME)-environment.patch.gar
LICENSE = Apache_2_0

DESCRIPTION = 
define BLURB
endef


DEPENDS = lang/c
BUILDDEPS = python/python
ifneq ($(DESTIMG),build)
BUILDDEPS = devel/meson
endif

ifeq ($(DESTIMG),build)
BUILD_SCRIPTS = $(WORKSRC)/setup.py
INSTALL_SCRIPTS = $(WORKSRC)/setup.py
endif
INSTALL_SCRIPTS += cross_file

INSTALL_ARGS = \
	--prefix=$(DESTDIR)$(prefix)
INSTALL_ENV  = \
	PYTHONPATH=$(DESTDIR)$(PYTHON_libdir)/site-packages

GAR_EXTRA_CONF += python/python/package-api.mk
include ../../gar.mk

CONFIGURE_ENV := \
	XDG_DATA_HOME=$(build_DESTDIR)$(build_sharedir)

build-%/setup.py:
	@echo " ==> Running setup.py build in $*"
	@cd $* && $(CONFIGURE_ENV) $(BUILD_ENV) python3 setup.py $(CONFIGURE_ARGS) build $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/setup.py: 
	@echo " ==> Running setup.py install in $*"
	@cd $* && $(CONFIGURE_ENV) $(INSTALL_ENV) python3 setup.py $(CONFIGURE_ARGS) install --skip-build $(INSTALL_ARGS)

install-cross_file:
	@mkdir -pv $(build_DESTDIR)$(build_datadir)/meson/native
	@rm -rfv $(build_DESTDIR)$(build_datadir)/meson/native/$(GARBUILD)
	@cp -fv $(WORKSRC)/native/$(GARBUILD) $(build_DESTDIR)$(build_datadir)/meson/native/$(GARBUILD)
	@mkdir -pv $(build_DESTDIR)$(build_datadir)/meson/cross
	@rm -rfv $(build_DESTDIR)$(build_datadir)/meson/cross/$(GARHOST)
	@cp -fv $(WORKSRC)/cross/$(GARHOST) $(build_DESTDIR)$(build_datadir)/meson/cross/$(GARHOST)
	@$(MAKECOOKIE)
