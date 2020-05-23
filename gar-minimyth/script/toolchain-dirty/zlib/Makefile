GARNAME = zlib
GARVERSION = $(ZLIB_VERSION)
CATEGORIES = toolchain-dirty
SOURCEPKG = lib/zlib
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKDIR)/license

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
	toolchain-dirty/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	--prefix=$(prefix) \
	--eprefix=$(exec_prefix) \
	--libdir=$(libdir) \
	--includedir=$(includedir) \
	--shared

GAR_EXTRA_CONF += toolchain-dirty/toolchain-dirty/toolchain.mk
GAR_EXTRA_CONF += lib/zlib/package-api.mk
include ../../gar.mk

# CCP and LD flags are not picked up correctly
CFLAGS += $(CPPFLAGS) $(LDFLAGS)
CXXFLAGS += $(CPPFLAGS) $(LDFLAGS)

post-install: post-install-static-libs

post-install-static-libs:
	@rm -rf $(DESTDIR)$(libdir)/libz.a
	@$(MAKECOOKIE)
