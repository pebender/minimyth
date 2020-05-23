GARNAME = ccache
GARVERSION = $(CCACHE_VERSION)
CATEGORIES = toolchain-dirty
MASTER_SITES = https://github.com/ccache/ccache/releases/download/v$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL3/FDL1_3

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	toolchain-dirty/libc-crt
BUILDDEPS = \
	native/native \
	toolchain-dirty/cc

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

GAR_EXTRA_CONF += toolchain-dirty/toolchain-dirty/toolchain.mk
include ../../gar.mk

CC := $(build_DESTDIR)$(build_bindir)/cc
CXX := $(build_DESTDIR)$(build_bindir)/++
CPP := $(build_DESTDIR)$(build_bindir)/cpp
LD := $(build_DESTDIR)$(build_bindir)/ld
OBJDUMP := $(build_DESTDIR)$(build_bindir)/objdump
OBJCOPY := $(build_DESTDIR)$(build_bindir)/objcopy
STRIP := $(build_DESTDIR)$(build_bindir)/strip
RANLIB := $(build_DESTDIR)$(build_bindir)/ranlib
READELF := $(build_DESTDIR)$(build_bindir)/readelf
NM := $(build_DESTDIR)$(build_bindir)/nm
AS := $(build_DESTDIR)$(build_bindir)/as
AR := $(build_DESTDIR)$(build_bindir)/ar

CPPFLAGS :=
CFLAGS :=
CXXFLAGS :=
LDFLAGS :=

LDFLAGS += -Wl,--strip-all

install-ccache-symlinks:
	@mkdir -pv $(DESTDIR)$(bindir)/ccache.d
	@ln -sfv ../ccache $(DESTDIR)$(bindir)/ccache.d/cc
	@ln -sfv ../ccache $(DESTDIR)$(bindir)/ccache.d/c++
	@$(MAKECOOKIE)
