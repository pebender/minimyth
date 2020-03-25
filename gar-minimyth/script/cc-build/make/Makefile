GARNAME = make
GARVERSION = $(MAKE_VERSION)
CATEGORIES = cc-build
SOURCEPKG = devel/make
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	native/native \
	cc-build/libc-crt \
	cc-build/cc \
	cc-build/ccache \
	cc-build/bash \
	cc-build/coreutils

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-nls \
	--enable-rpath

GAR_EXTRA_CONF += cc-build/cc-build/toolchain.mk
GAR_EXTRA_CONF += devel/make/package-api.mk
include ../../gar.mk
