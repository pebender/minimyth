GARNAME = ccache
GARVERSION = 3.7.8
CATEGORIES = cc-build
MASTER_SITES = https://github.com/ccache/ccache/releases/download/v$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL3/FDL1_3

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	native/native \
	cc-build/cc

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

build_DESTDIR = $(cc_build_DESTDIR)
build_rootdir = $(cc_build_rootdir)
DESTDIR = $(ccache_DESTDIR)
rootdir = $(ccache_rootdir)

build_CC = $(build_DESTDIR)$(build_bindir)/cc
build_CXX = $(build_DESTDIR)$(build_bindir)/c++
build_LD = $(build_DESTDIR)$(build_bindir)/ld
build_OBJDUMP = $(build_DESTDIR)$(build_bindir)/objdump
build_OBJCOPY = $(build_DESTDIR)$(build_bindir)/objcopy
build_STRIP = $(build_DESTDIR)$(build_bindir)/strip
build_RANLIB = $(build_DESTDIR)$(build_bindir)/ranlib
build_READELF = $(build_DESTDIR)$(build_bindir)/readelf
build_NM = $(build_DESTDIR)$(build_bindir)/nm
build_AS = $(build_DESTDIR)$(build_bindir)/as
build_AR = $(build_DESTDIR)$(build_bindir)/ar
build_CPP = $(build_DESTDIR)$(build_bindir)/cpp

include ../../gar.mk

PATH := $(native_DESTDIR)$(native_bindir):$(PATH)

LDFLAGS += -Wl,--strip-all

install-ccache-symlinks:
	@ln -sfv ccache $(DESTDIR)$(bindir)/cc
	@ln -sfv ccache $(DESTDIR)$(bindir)/c++
	@ln -sfv ccache $(DESTDIR)$(bindir)/gcc
	@ln -sfv ccache $(DESTDIR)$(bindir)/g++
	@ln -sfv ccache $(DESTDIR)$(bindir)/clang
	@ln -sfv ccache $(DESTDIR)$(bindir)/clang++
	@$(MAKECOOKIE)
