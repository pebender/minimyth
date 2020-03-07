GARNAME = libffi
GARVERSION = $(LIBFFI_VERSION)
CATEGORIES = compiler
SOURCEPKG = lib/libffi
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	native/native \
	ccache/ccache \
	compiler-clang/compiler-clang

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-shared \
	--enable-static \
	--disable-docs \
	--disable-debug \
	--enable-structs \
	--enable-raw-api \
	--disable-purify-safety \
	--disable-multi-os-directory

GAR_EXTRA_CONF += compiler/compiler/toolchain.mk
GAR_EXTRA_CONF += lib/libffi/package-api.mk
include ../../gar.mk
