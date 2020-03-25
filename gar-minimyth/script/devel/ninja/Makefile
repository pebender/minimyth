GARNAME = ninja
GARVERSION = $(NINJA_VERSION)
CATEGORIES = devel
MASTER_SITES = https://github.com/ninja-build/ninja/archive/
DISTFILES = v$(GARVERSION).tar.gz
LICENSE = Apache_2_0

DESCRIPTION = 
define BLURB
endef

ifeq ($(DESTIMG),build)
DEPENDS   = lang/cxx
BUILDDEPS = python/python
else
BUILDDEPS = devel/ninja
endif

ifeq ($(DESTIMG),build)
build_DESTDIR = $(build_DESTDIR_swapped)
build_rootdir = $(build_rootdir_swapped)
DESTIDR = $(build_DESTDIR_swapped)
rootdir = $(build_rootdir_swapped)
endif

BUILD_SCRIPTS = $(WORKSRC)/configure.py
ifeq ($(DESTIMG),build)
BUILD_SCRIPTS = $(WORKSRC)/configure.py
INSTALL_SCRIPTS = custom
endif

BUILD_ARGS = \
	--bootstrap \
	--verbose

GAR_EXTRA_CONF += devel/ninja/package-api.mk
include ../../gar.mk

build-%/configure.py:
	@echo " ==> Running configure.y in in $*"
	@cd $* && $(BUILD_ENV) $(build_DESTDIR)$(build_bindir)/python configure.py $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-custom: 
	@echo " ==> Installing ninja"
	@cp -fv $(WORKSRC)/ninja $(DESTDIR)$(bindir)/ninja
	@$(MAKECOOKIE)
