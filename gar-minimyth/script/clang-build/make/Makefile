GARNAME = make
GARVERSION = $(MAKE_VERSION)
CATEGORIES = clang-build
SOURCEPKG = devel/make
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	native/native \
	cc-build/ccache \
	clang-build/clang \
	clang-build/clang-wrappers \
	clang-build/bash \
	clang-build/coreutils

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-nls \
	--enable-rpath

GAR_EXTRA_CONF += clang-build/clang-build/toolchain.mk
GAR_EXTRA_CONF += devel/make/package-api.mk
include ../../gar.mk
