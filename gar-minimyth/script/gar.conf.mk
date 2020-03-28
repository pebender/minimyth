#-*- mode: Fundamental; tab-width: 4; -*-
# ex:ts=4

# This file contains configuration variables that are global to
# the GAR system.  Users wishing to make a change on a
# per-package basis should edit the category/package/Makefile, or
# specify environment variables on the make command-line.

# Variables that define the default *actions* (rather than just
# default data) of the system will remain in bbc.gar.mk
# (bbc.port.mk)

# Setting this variable will cause the results of your builds to
# be cleaned out after being installed.  Uncomment only if you
# desire this behavior!

# export BUILD_CLEAN = true

ALL_DESTIMGS = main build

main_DESTDIR ?= $(mm_HOME)/images/main
main_rootdir ?=
# build DESTDIR and rootdir are reversed for build because some packages (e.g.
# autoconf, automake and libtool) embed the absolute paths. For these packages
# to run on the build system, they cannot be compiled with sysroot so we compile
# the build system with an abolute prefix and no sysroot. Since identifying all
# packages that embed absolute paths is error prone, assume all build packages
# suffer from this shortcoming. None of the packages for building the compiler
# suffer from this shortcoming, so we reverse build_DESTDIR and build_rootdir
# when building the compiler in order for the compiler and linker to use
# the correct sysroot.
build_DESTDIR ?=
build_rootdir ?= $(mm_HOME)/images/build
build_DESTDIR_swapped ?= $(mm_HOME)/images/build
build_rootdir_swapped ?=

clang_target_DESTDIR ?= $(mm_HOME)/images/clang-target
clang_target_rootdir ?=
clang_target_prefix ?= $(clang_target_rootdir)/usr
clang_target_bindir ?= $(clang_target_prefix)/bin
clang_target_libdir ?= $(clang_target_prefix)/lib
clang_target_includedir ?= $(clang_target_prefix)/include

clang_build_DESTDIR ?= $(mm_HOME)/images/clang-build
clang_build_rootdir ?=
clang_build_prefix ?= $(clang_build_rootdir)/usr
clang_build_bindir ?= $(clang_build_prefix)/bin
clang_build_libdir ?= $(clang_build_prefix)/lib
clang_build_includedir ?= $(clang_build_prefix)/include

gcc_target_DESTDIR ?= $(mm_HOME)/images/gcc-target
gcc_target_rootdir ?=
gcc_target_prefix ?= $(gcc_target_rootdir)/usr
gcc_target_bindir ?= $(gcc_target_prefix)/bin
gcc_target_libdir ?= $(gcc_target_prefix)/lib
gcc_target_includedir ?= $(gcc_target_prefix)/include
gcc_target_exec_prefix ?= $(gcc_target_rootdir)/usr
gcc_target_libexecdir ?= $(gcc_target_exec_prefix)/lib

gcc_build_DESTDIR ?= $(mm_HOME)/images/gcc-build
gcc_build_rootdir ?=
gcc_build_prefix ?= $(gcc_build_rootdir)/usr
gcc_build_bindir ?= $(gcc_build_prefix)/bin
gcc_build_libdir ?= $(gcc_build_prefix)/lib
gcc_build_elibdir ?= $(gcc_build_libdir)
gcc_build_includedir ?= $(gcc_build_prefix)/include
gcc_build_exec_prefix ?= $(gcc_build_rootdir)/usr
gcc_build_libexecdir ?= $(gcc_build_exec_prefix)/lib

ccache_DESTDIR ?= $(mm_HOME)/images/ccache
ccache_rootdir ?=
ccache_prefix ?= $(ccache_rootdir)/usr
ccache_bindir ?= $(ccache_prefix)/bin
ccache_libdir ?= $(ccache_prefix)/lib
ccache_includedir ?= $(ccache_prefix)/include

cc_build_DESTDIR ?= $(mm_HOME)/images/cc-build
cc_build_rootdir ?=
cc_build_prefix ?= $(cc_build_rootdir)/usr
cc_build_bindir ?= $(cc_build_prefix)/bin
cc_build_libdir ?= $(cc_build_prefix)/lib
cc_build_includedir ?= $(cc_prefix)/include

native_DESTDIR ?= $(mm_HOME)/images/native
native_rootdir ?=
native_prefix ?= $(native_rootdir)/usr
native_bindir ?= $(native_prefix)/bin
native_libdir ?= $(native_prefix)/lib
native_includedir ?= $(native_prefix)/include

# These are the standard directory name variables from all GNU
# makefiles.  They're also used by autoconf, and can be adapted
# for a variety of build systems.
main_prefix = $(main_rootdir)/usr
main_exec_prefix = $(main_prefix)
main_bindir = $(main_prefix)/bin
main_ebindir = $(main_bindir)
main_sbindir = $(main_prefix)/sbin
main_esbindir = $(main_sbindir)
main_libexecdir = $(main_prefix)/libexec
main_datadir = $(main_prefix)/share
main_sysconfdir = $(main_rootdir)/etc
main_sharedstatedir = $(main_prefix)/share
main_localstatedir = $(main_rootdir)/var
main_libdir = $(main_prefix)/lib
main_elibdir = $(main_libdir)
main_infodir = $(main_prefix)/share/info
main_lispdir = $(main_prefix)/share/emacs/site-lisp
main_includedir = $(main_prefix)/include
main_oldincludedir = $(main_prefix)/include
main_mandir = $(main_prefix)/share/man
main_docdir = $(main_prefix)/share/doc
main_sourcedir = $(main_prefix)/src
main_licensedir = $(main_prefix)/licenses
main_versiondir = $(main_prefix)/versions
main_qt5prefix = $(main_libdir)/qt5
main_qt5bindir = $(main_qt5prefix)/bin
main_qt5includedir = $(main_qt5prefix)/include
main_qt5libdir = $(main_qt5prefix)/lib
main_qt5elibdir = $(main_qt5prefix)/lib

build_prefix = $(build_rootdir)/usr
build_exec_prefix = $(build_prefix)
build_bindir = $(build_prefix)/bin
build_ebindir = $(build_bindir)
build_sbindir = $(build_prefix)/sbin
build_esbindir = $(build_sbindir)
build_libexecdir = $(build_prefix)/libexec
build_datadir = $(build_prefix)/share
build_sysconfdir = $(build_rootdir)/etc
build_sharedstatedir = $(build_prefix)/share
build_localstatedir = $(build_rootdir)/var
build_libdir = $(build_prefix)/lib
build_elibdir = $(build_libdir)
build_infodir = $(build_prefix)/share/info
build_lispdir = $(build_prefix)/share/emacs/site-lisp
build_includedir = $(build_prefix)/include
build_oldincludedir = $(build_prefix)/include
build_mandir = $(build_prefix)/share/man
build_docdir = $(build_prefix)/share/doc
build_sourcedir = $(build_prefix)/src
build_licensedir = $(build_prefix)/licenses
build_versiondir = $(build_prefix)/versions
build_qt5prefix = $(build_libdir)/qt5
build_qt5bindir = $(build_qt5prefix)/bin
build_qt5includedir = $(build_qt5prefix)/include
build_qt5libdir = $(build_qt5prefix)/lib
build_qt5elibdir = $(build_qt5prefix)/lib

# Architectures
main_GARCH ?= $(mm_GARCH)
main_GARCH_FAMILY ?= $(mm_GARCH_FAMILY)
main_GARHOST ?= $(mm_GARHOST)

build_GARCH := $(strip $(subst x86_64,x86-64, \
    $(if $(filter-out unknown,$(shell uname -m)), \
        $(shell uname -m) \
    , \
        $(shell arch) \
    )))
build_GARCH_FAMILY := $(strip \
    $(if $(filter i386 i486 i586 i686,$(build_GARCH)),i386  ) \
    $(if $(filter x86-64             ,$(build_GARCH)),x86_64))
build_GARHOST := $(GARBUILD)

# Compiler tools.
main_CC ?= $(ccache_DESTDIR)$(ccache_bindir)/$(main_GARHOST)-clang
main_CXX ?= $(ccache_DESTDIR)$(ccache_bindir)/$(main_GARHOST)-clang++
main_CPP ?= $(build_DESTDIR)$(build_bindir)/wrapper/$(main_GARHOST)-clang-cpp
main_LD ?= $(build_DESTDIR)$(build_bindir)/wrapper/$(main_GARHOST)-ld.lld
main_OBJDUMP ?= $(build_DESTDIR)$(build_bindir)/llvm-objdump
main_OBJCOPY ?= $(build_DESTDIR)$(build_bindir)/llvm-objcopy
main_STRIP ?= $(build_DESTDIR)$(build_bindir)/llvm-strip
main_RANLIB ?= $(build_DESTDIR)$(build_bindir)/llvm-ranlib
main_READELF ?= $(build_DESTDIR)$(build_bindir)/lvm-readelf
main_NM ?= $(build_DESTDIR)$(build_bindir)/llvm-nm
main_AS ?= $(build_DESTDIR)$(build_bindir)/llvm-as
main_AR ?= $(build_DESTDIR)$(build_bindir)/llvm-ar

build_CC ?= $(ccache_DESTDIR)$(ccache_bindir)/$(build_GARHOST)-clang
build_CXX ?= $(ccache_DESTDIR)$(ccache_bindir)/$(build_GARHOST)-clang++
build_CPP ?= $(build_DESTDIR)$(build_bindir)/wrapper/$(build_GARHOST)-clang-cpp
build_LD ?= $(build_DESTDIR)$(build_bindir)/wrapper/$(build_GARHOST)-ld.lld
build_OBJDUMP ?= $(build_DESTDIR)$(build_bindir)/llvm-objdump
build_OBJCOPY ?= $(build_DESTDIR)$(build_bindir)/llvm-objcopy
build_STRIP ?= $(build_DESTDIR)$(build_bindir)/llvm-strip
build_RANLIB ?= $(build_DESTDIR)$(build_bindir)/llvm-ranlib
build_READELF ?= $(build_DESTDIR)$(build_bindir)/llvm-readelf
build_NM ?= $(build_DESTDIR)$(build_bindir)/llvm-nm
build_AS ?= $(build_DESTDIR)$(build_bindir)/llvm-as
build_AR ?= $(build_DESTDIR)$(build_bindir)/llvm-ar

RPATH_FLAG = -Wl,-rpath,
RPATH_LINK_FLAG = -Wl,-rpath-link,
main_CPPFLAGS ?=
main_CFLAGS ?= \
	-pipe \
	$(mm_CFLAGS)
main_CXXFLAGS ?= \
	-pipe \
	$(mm_CFLAGS)
main_LDFLAGS ?= \
	-fno-lto

build_CPPFLAGS ?=
build_CFLAGS ?= \
	-pipe \
	-march=$(build_GARCH) \
	-O2 \
	$(if $(filter i386,$(build_GARCH_FAMILY)),-m32) \
	$(if $(filter x86_64,$(build_GARCH_FAMILY)),-m64)
build_CXXFLAGS ?= \
	-pipe \
	-march=$(build_GARCH) \
	-O2 \
	$(if $(filter i386,$(build_GARCH_FAMILY)),-m32) \
	$(if $(filter x86_64,$(build_GARCH_FAMILY)),-m64)
build_LDFLAGS ?= \
	$(subst :, -L,:$(BUILD_LINKTIME_PATH):$(NATIVE_LINKTIME_PATH)) \
	$(subst :, $(RPATH_LINK_FLAG),:$(BUILD_LINKTIME_PATH):$(NATIVE_LINKTIME_PATH))

# Make sure that the build system finds the correct libraries at link time.
# We embed the paths so that it can find them at runtime as well so that programs
# use the correct libraries when running on the build system.

# This is for foo-config chaos
SHELL = $(if $(wildcard $(build_DESTDIR)$(build_ebindir)/bash),$(build_DESTDIR)$(build_ebindir)/bash,/bin/sh)
CONFIG_SHELL = $(SHELL)
PKG_CONFIG = $(if $(wildcard $(build_DESTDIR)$(build_bindir)/pkg-config), \
	$(build_DESTDIR)$(build_bindir)/pkg-config, \
	$(native_DESTDIR)$(native_bindir)/pkg-config \
)
PKG_CONFIG_PATH = $(DESTDIR)$(libdir)/pkgconfig:$(DESTDIR)$(datadir)/pkgconfig:$(DESTDIR)$(qt5libdir)/pkgconfig
PKG_CONFIG_LIBDIR = $(DESTDIR)$(libdir)/pkgconfig
PKG_CONFIG_SYSROOT_DIR = $(DESTDIR)
PERLLIB = 
PERL5LIB =

# Put these variables in the environment during the
# configure build and install stages
STAGE_EXPORTS = DESTDIR prefix exec_prefix bindir sbindir libexecdir datadir
STAGE_EXPORTS += sysconfdir sharedstatedir localstatedir libdir infodir lispdir
STAGE_EXPORTS += includedir oldincludedir mandir docdir sourcedir
STAGE_EXPORTS += CPPFLAGS CFLAGS LDFLAGS CXXFLAGS
STAGE_EXPORTS += CC CXX LD CPP AR AS NM RANLIB STRIP OBJCOPY OBJDUMP

CONFIGURE_ENV += $(foreach TTT,$(STAGE_EXPORTS),$(TTT)="$($(TTT))")
BUILD_ENV += $(foreach TTT,$(STAGE_EXPORTS),$(TTT)="$($(TTT))")
INSTALL_ENV += $(foreach TTT,$(STAGE_EXPORTS),$(TTT)="$($(TTT))")
MANIFEST_ENV += $(foreach TTT,$(STAGE_EXPORTS),$(TTT)="$($(TTT))")

# Global environment
export GARBUILD
export BUILD_SYSTEM_PATH GAR_SYSTEM_PATH PATH LIBRARY_PATH LD_LIBRARY_PATH #LD_PRELOAD
export SHELL CONFIG_SHELL
export PKG_CONFIG PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR
export PERLLIB PERL5LIB

GARCHIVEROOT ?= $(mm_HOME)/source
GARCHIVEDIR = $(GARCHIVEROOT)/$(DISTNAME)
GARPKGROOT ?= /var/www/garpkg
GARPKGDIR = $(GARPKGROOT)/$(GARNAME)

# prepend the local file listing
FILE_SITES = file://$(FILEDIR)/ file://$(GARCHIVEDIR)/

#append the public archive
MASTER_SITES += http://minimyth.org/download/garchive/

# Extra confs to include after gar.conf.mk
GAR_EXTRA_CONF += extras/extras.conf.mk

# Extra libs to include with gar.mk
GAR_EXTRA_LIBS += minimyth.lib.mk
