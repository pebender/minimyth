GARNAME = zlib
GARVERSION = $(ZLIB_VERSION)
CATEGORIES = compiler
SOURCEPKG = lib/zlib
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKDIR)/license

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

CONFIGURE_ARGS = \
	--prefix=$(prefix) \
	--eprefix=$(exec_prefix) \
	--libdir=$(libdir) \
	--includedir=$(includedir) \
	--static

GAR_EXTRA_CONF += compiler/compiler/toolchain.mk
GAR_EXTRA_CONF += lib/zlib/package-api.mk
include ../../gar.mk

CFLAGS += -fPIC
CXXFLAGS += -fPIC

CFLAGS += $(CPPFLAGS)
CXXFLAGS += $(CPPFLAGS)
