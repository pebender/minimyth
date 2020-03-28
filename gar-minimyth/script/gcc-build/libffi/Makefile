GARNAME = libffi
GARVERSION = $(LIBFFI_VERSION)
CATEGORIES = gcc-build
SOURCEPKG = lib/libffi
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	native/native \
	cc-build/ccache \
	gcc-build/gcc \
	gcc-build/gcc-wrappers \
	gcc-build/bash \
	gcc-build/coreutils \
	gcc-build/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-docs \
	--disable-debug \
	--enable-structs \
	--enable-raw-api \
	--disable-purify-safety \
	--disable-multi-os-directory \
	--enable-symvers

GAR_EXTRA_CONF += gcc-build/gcc-build/toolchain.mk
GAR_EXTRA_CONF += lib/libffi/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libffi.la
	@$(MAKECOOKIE)
