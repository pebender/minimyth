GARNAME = ninja
GARVERSION = $(NINJA_VERSION)
CATEGORIES = tainted-build
SOURCEPKG = devel/ninja
LICENSE = Apache_2_0

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	tainted-build/libc-crt
BUILDDEPS = \
	native/native \
	tainted-build/gcc-wrappers \
	tainted-build/bash \
	tainted-build/coreutils \
	tainted-build/make \
	tainted-build/python

BUILD_SCRIPTS = $(WORKSRC)/configure.py
INSTALL_SCRIPTS = custom

BUILD_ARGS = \
	--bootstrap \
	--verbose

GAR_EXTRA_CONF += tainted-build/tainted-build/toolchain.mk
GAR_EXTRA_CONF += devel/ninja/package-api.mk
include ../../gar.mk

build-%/configure.py:
	@echo " ==> Running configure.py in in $*"
	@cd $* && $(BUILD_ENV) $(DESTDIR)$(bindir)/python3 configure.py $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-custom: 
	@echo " ==> Installing ninja"
	@cp -fv $(WORKSRC)/ninja $(DESTDIR)$(bindir)/ninja
	@$(MAKECOOKIE)
