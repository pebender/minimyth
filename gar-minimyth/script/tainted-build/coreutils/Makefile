GARNAME = coreutils
GARVERSION = $(COREUTILS_VERSION)
CATEGORIES = tainted-build
SOURCEPKG = utils/coreutils
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	tainted-build/libc-crt
BUILDDEPS = \
	native/native \
	tainted-build/cc \
	tainted-build/ccache \
	tainted-build/bash

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-nls \
	--enable-rpath

GAR_EXTRA_CONF += tainted-build/tainted-build/toolchain.mk
GAR_EXTRA_CONF += utils/coreutils/package-api.mk
include ../../gar.mk

CC := $(build_DESTDIR)$(build_bindir)/ccache.d/cc
CXX := $(build_DESTDIR)$(build_bindir)/ccache.d/c++
CPP := $(build_DESTDIR)$(build_bindir)/cpp
LD := $(build_DESTDIR)$(build_bindir)/ld

CPPFLAGS :=
CFLAGS :=
CXXFLAGS :=
LDFLAGS :=

