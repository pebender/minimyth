GARNAME = zlib
GARVERSION = $(ZLIB_VERSION)
CATEGORIES = tainted-build
SOURCEPKG = lib/zlib
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKDIR)/license

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	tainted-build/libc-crt
BUILDDEPS = \
	native/native \
	tainted-build/gcc-wrappers \
	tainted-build/bash \
	tainted-build/coreutils \
	tainted-build/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	--prefix=$(prefix) \
	--eprefix=$(exec_prefix) \
	--libdir=$(libdir) \
	--includedir=$(includedir) \
	--shared

GAR_EXTRA_CONF += tainted-build/tainted-build/toolchain.mk
GAR_EXTRA_CONF += lib/zlib/package-api.mk
include ../../gar.mk

# CCP and LD flags are not picked up correctly
CFLAGS += $(CPPFLAGS) $(LDFLAGS)
CXXFLAGS += $(CPPFLAGS) $(LDFLAGS)

post-install: post-install-static-libs

post-install-static-libs:
	@rm -rf $(DESTDIR)$(libdir)/libz.a
	@$(MAKECOOKIE)
