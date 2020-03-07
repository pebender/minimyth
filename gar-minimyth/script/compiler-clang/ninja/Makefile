GARNAME = ninja
GARVERSION = $(NINJA_VERSION)
CATEGORIES = compiler-clang
SOURCEPKG = devel/ninja
LICENSE = Apache_2_0

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	native/native \
	ccache/ccache \
	compiler-gcc/compiler-gcc \
	compiler-clang/bash \
	compiler-clang/coreutils \
	compiler-clang/make \
	compiler-clang/python

BUILD_SCRIPTS = $(WORKSRC)/configure.py
INSTALL_SCRIPTS = custom

BUILD_ARGS = \
	--bootstrap \
	--verbose

GAR_EXTRA_CONF += compiler-clang/compiler-clang/toolchain.mk
GAR_EXTRA_CONF += devel/ninja/package-api.mk
include ../../gar.mk

build-%/configure.py:
	@echo " ==> Running configure.py in in $*"
	@cd $* && $(BUILD_ENV) $(DESTDIR)$(bindir)/python configure.py $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-custom: 
	@echo " ==> Installing ninja"
	@cp -fv $(WORKSRC)/ninja $(DESTDIR)$(bindir)/ninja
	@$(MAKECOOKIE)
