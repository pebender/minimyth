GARNAME = make
GARVERSION = $(MAKE_VERSION)
CATEGORIES = compiler-gcc
SOURCEPKG = devel/make
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	native/native \
	compiler-cc/compiler-cc \
	ccache/ccache \
	compiler-gcc/bash \
	compiler-gcc/coreutils

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-nls \
	--enable-rpath

GAR_EXTRA_CONF += compiler-gcc/compiler-gcc/toolchain.mk
GAR_EXTRA_CONF += devel/make/package-api.mk
include ../../gar.mk
