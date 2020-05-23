GARNAME = ninja
GARVERSION = $(NINJA_VERSION)
CATEGORIES = toolchain-dirty
SOURCEPKG = devel/ninja
LICENSE = Apache_2_0

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	toolchain-dirty/libc-crt
BUILDDEPS = \
	native/native \
	toolchain-dirty/ccache \
	toolchain-dirty/clang-wrappers \
	toolchain-dirty/bash \
	toolchain-dirty/coreutils \
	toolchain-dirty/make \
	toolchain-dirty/python

BUILD_SCRIPTS = $(WORKSRC)/configure.py
INSTALL_SCRIPTS = custom

BUILD_ARGS = \
	--bootstrap \
	--verbose

GAR_EXTRA_CONF += toolchain-dirty/toolchain-dirty/toolchain.mk
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
