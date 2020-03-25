GARNAME = libffi
GARVERSION = $(LIBFFI_VERSION)
CATEGORIES = clang-build
SOURCEPKG = lib/libffi
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	native/native \
	cc-build/ccache \
	clang-build/clang \
	clang-build/clang-wrappers \
	clang-build/bash \
	clang-build/coreutils \
	clang-build/make

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

GAR_EXTRA_CONF += clang-build/clang-build/toolchain.mk
GAR_EXTRA_CONF += lib/libffi/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libffi.la
	@$(MAKECOOKIE)
