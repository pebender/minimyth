GARNAME = ccache
GARVERSION = $(CCACHE_VERSION)
CATEGORIES = toolchain-build
SOURCEPKG = tainted-build/ccache
LICENSE = GPL3/FDL1_3

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	tainted-build/libc-crt
BUILDDEPS = \
	native/native \
	tainted-build/tainted-build

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
GAR_EXTRA_CONF += tainted-build/ccache/package-api.mk
include ../../gar.mk

LDFLAGS += -Wl,--strip-all

install-ccache-symlinks:
	@mkdir -pv $(DESTDIR)$(bindir)/ccache.d
	@ln -sfv ../ccache $(DESTDIR)$(bindir)/ccache.d/cc
	@ln -sfv ../ccache $(DESTDIR)$(bindir)/ccache.d/c++
	@ln -sfv ../ccache $(DESTDIR)$(bindir)/ccache.d/gcc
	@ln -sfv ../ccache $(DESTDIR)$(bindir)/ccache.d/g++
	@ln -sfv ../ccache $(DESTDIR)$(bindir)/ccache.d/clang
	@ln -sfv ../ccache $(DESTDIR)$(bindir)/ccache.d/clang++
	@$(MAKECOOKIE)
