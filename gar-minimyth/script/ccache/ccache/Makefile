GARNAME = ccache
GARVERSION = 3.7.7
CATEGORIES = ccache
MASTER_SITES = https://github.com/ccache/ccache/releases/download/v$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL3/FDL1_3

DESCRIPTION = 
define BLURB
endef

DESTIMG := cc

BUILDDEPS = \
	native/native \
	compiler-cc/compiler-cc

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

GAR_EXTRA_CONF += compiler/compiler/toolchains.mk
include ../../gar.mk

build_DESTDIR := $(build_DESTDIR)$(build_rootdir)
build_rootdir :=
DESTDIR := $(ccache_DESTDIR)
rootdir := $(ccache_rootdir)

PATH := $(native_DESTDIR)$(native_bindir):$(cc_DESTDIR)/$(cc_bindir):$(PATH)

CC := cc
CXX := c++
LD := ld
OBJDUMP := objdump
OBJCOPY := objcopy
STRIP := strip
RANLIB := ranlib
READELF := readelf
NM := nm
AS := as
AR := ar
CPP := cpp

CPPFLAGS :=
CFLAGS :=
CXXFLAGS :=
LDFLAGS :=

LDFLAGS += -Wl,--strip-all

install-ccache-symlinks:
	@ln -sfv ccache $(DESTDIR)$(bindir)/cc
	@ln -sfv ccache $(DESTDIR)$(bindir)/c++
	@ln -sfv ccache $(DESTDIR)$(bindir)/gcc
	@ln -sfv ccache $(DESTDIR)$(bindir)/g++
	@ln -sfv ccache $(DESTDIR)$(bindir)/clang
	@ln -sfv ccache $(DESTDIR)$(bindir)/clang++
	@$(MAKECOOKIE)
