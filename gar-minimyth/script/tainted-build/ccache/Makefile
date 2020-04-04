GARNAME = ccache
GARVERSION = $(CCACHE_VERSION)
CATEGORIES = tainted-build
MASTER_SITES = https://github.com/ccache/ccache/releases/download/v$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL3/FDL1_3

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	tainted-build/libc-crt
BUILDDEPS = \
	native/native \
	tainted-build/cc

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

GAR_EXTRA_CONF += tainted-build/tainted-build/toolchain.mk
include ../../gar.mk

CC := $(build_DESTDIR)$(build_bindir)/cc
CXX := $(build_DESTDIR)$(build_bindir)/c++
CPP := $(build_DESTDIR)$(build_bindir)/cpp
LD := $(build_DESTDIR)$(build_bindir)/ld

CPPFLAGS :=
CFLAGS :=
CXXFLAGS :=
LDFLAGS :=

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
