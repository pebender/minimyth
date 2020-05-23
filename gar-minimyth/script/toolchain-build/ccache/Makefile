GARNAME = ccache
GARVERSION = $(CCACHE_VERSION)
CATEGORIES = toolchain-build
SOURCEPKG = toolchain-dirty/ccache
LICENSE = GPL3/FDL1_3

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	toolchain-dirty/libc-crt
BUILDDEPS = \
	native/native \
	toolchain-dirty/toolchain-dirty

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile ccache-symlinks

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-man \
	--with-bundled-zlib
BUILD_ARGS = \
	quiet=0 \
	Q=
INSTALL_ARGS = \
	quiet=0 \
	Q=

GAR_EXTRA_CONF += toolchain-build/toolchain-build/toolchain.mk
GAR_EXTRA_CONF += toolchain-dirty/ccache/package-api.mk
include ../../gar.mk

LDFLAGS += -Wl,--strip-all -v

install-ccache-symlinks:
	@mkdir -pv $(DESTDIR)$(bindir)/ccache.d
	@$(MAKECOOKIE)
