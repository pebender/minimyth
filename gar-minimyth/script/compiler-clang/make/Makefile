GARNAME = make
GARVERSION = $(MAKE_VERSION)
CATEGORIES = compiler-clang
SOURCEPKG = devel/make
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	native/native \
	ccache/ccache \
	compiler-gcc/compiler-gcc \
	compiler-clang/bash \
	compiler-clang/coreutils

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-nls \
	--enable-rpath

GAR_EXTRA_CONF += compiler-clang/compiler-clang/toolchain.mk
GAR_EXTRA_CONF += devel/make/package-api.mk
include ../../gar.mk
