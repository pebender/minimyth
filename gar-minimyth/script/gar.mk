#-*- mode: Fundamental; tab-width: 4; -*-
# ex:ts=4 sw=4

# Copyright (C) 2001 Nick Moffitt
# 
# Redistribution and/or use, with or without modification, is
# permitted.  This software is without warranty of any kind.  The
# author(s) shall not be liable in the event that use of the
# software causes damage.


# Comment this out to make much verbosity
#.SILENT:

#ifeq ($(origin GARDIR), undefined)
#GARDIR := $(CURDIR)/../..
#endif

####### Invariants #######
GARDIR ?= ../..

# GARBUILD is the platform on which you're running GAR.  If you want to
# override it with a value other than what GCC thinks it's running on that's
# ok, but the results will be very... VERY ...strange.
GARBUILD ?= $(shell gcc -dumpmachine)

# include the configuration file to override any of these variables
# no variable expansions or targets are allowed in these files.
include $(GARDIR)/minimyth.conf.mk
include $(GARDIR)/gar.conf.mk
-include $(addprefix $(GARDIR)/,$(GAR_EXTRA_CONF)) package-api.mk

####### Default values for variables which remain unconfigured. #######

##### Default image configuration #####
# Default DESTIMG
DESTIMG ?= main

# Default image filesystem structure
$(DESTIMG)_DESTDIR ?= $(mm_HOME)/images/$(DESTIMG)
$(DESTIMG)_rootdir ?=
$(DESTIMG)_prefix ?= $($(DESTIMG)_rootdir)/usr
$(DESTIMG)_exec_prefix ?= $($(DESTIMG)_rootdir)/usr
$(DESTIMG)_ebindir ?= $($(DESTIMG)_exec_prefix)/bin
$(DESTIMG)_bindir ?= $($(DESTIMG)_prefix)/bin
$(DESTIMG)_esbindir ?= $($(DESTIMG)_exec_prefix)/sbin
$(DESTIMG)_sbindir ?= $($(DESTIMG)_prefix)/sbin
$(DESTIMG)_libexecdir ?= $($(DESTIMG)_prefix)/libexec
$(DESTIMG)_datadir ?= $($(DESTIMG)_prefix)/share
$(DESTIMG)_sysconfdir ?= $($(DESTIMG)_rootdir)/etc
$(DESTIMG)_sharedstatedir ?= $($(DESTIMG)_prefix)/share
$(DESTIMG)_localstatedir ?= $($(DESTIMG)_rootdir)/var
$(DESTIMG)_elibdir ?= $($(DESTIMG)_exec_prefix)/lib
$(DESTIMG)_libdir ?= $($(DESTIMG)_prefix)/lib
$(DESTIMG)_infodir ?= $($(DESTIMG)_prefix)/share/info
$(DESTIMG)_lispdir ?= $($(DESTIMG)_prefix)/share/emacs/site-lisp
$(DESTIMG)_includedir ?= $($(DESTIMG)_prefix)/include
$(DESTIMG)_oldincludedir ?= $($(DESTIMG)_prefix)/include
$(DESTIMG)_mandir ?= $($(DESTIMG)_prefix)/share/man
$(DESTIMG)_docdir ?= $($(DESTIMG)_prefix)/share/doc
$(DESTIMG)_sourcedir ?= $($(DESTIMG)_prefix)/src
$(DESTIMG)_licensedir ?= $($(DESTIMG)_rootdir)/licenses
$(DESTIMG)_versiondir ?= $($(DESTIMG)_rootdir)/versions
$(DESTIMG)_qt5prefix ?= $($(DESTIMG)_libdir)/qt5
$(DESTIMG)_qt5bindir ?= $($(DESTIMG)_qt5prefix)/bin
$(DESTIMG)_qt5includedir ?= $($(DESTIMG)_qt5prefix)/include
$(DESTIMG)_qt5libdir ?= $($(DESTIMG)_qt5prefix)/lib
$(DESTIMG)_qt5elibdir ?= $($(DESTIMG)_qt5prefix)/lib

# Default image architecture
$(DESTIMG)_GARCH ?= $(main_GARCH)
$(DESTIMG)_GARCH_FAMILY ?= $(main_GARCH_FAMILY)
$(DESTIMG)_GARHOST ?= $(main_GARHOST)

# Default compiler tools
$(DESTIMG)_CC ?= clang
$(DESTIMG)_CXX ?= clang++
$(DESTIMG)_CPP ?= clang-cpp
$(DESTIMG)_LD ?= ld.lld
$(DESTIMG)_OBJDUMP ?= llvm-objdump
$(DESTIMG)_OBJCOPY ?= llvm-objcopy
$(DESTIMG)_STRIP ?= llvm-strip
$(DESTIMG)_RANLIB ?= llvm-ranlib
$(DESTIMG)_READELF ?= llvm-readelf
$(DESTIMG)_NM ?= llvm-nm
$(DESTIMG)_AS ?= llvm-as
$(DESTIMG)_AR ?= llvm-ar

# Filesystem structure
DESTDIR ?= $($(DESTIMG)_DESTDIR)
rootdir ?= $($(DESTIMG)_rootdir)
prefix = $(rootdir)/usr
exec_prefix = $(rootdir)/usr
ebindir = $(exec_prefix)/bin
bindir = $(prefix)/bin
esbindir = $(exec_prefix)/sbin
sbindir = $(prefix)/sbin
libexecdir = $(prefix)/libexec
datadir = $(prefix)/share
sysconfdir = $(rootdir)/etc
sharedstatedir = $(prefix)/share
localstatedir = $(rootdir)/var
elibdir = $(exec_prefix)/lib
libdir = $(prefix)/lib
infodir = $(prefix)/share/info
lispdir = $(prefix)/share/emacs/site-lisp
includedir = $(prefix)/include
oldincludedir = $(prefix)/include
mandir = $(prefix)/share/man
docdir = $(prefix)/share/doc
sourcedir = $(prefix)/src
licensedir = $(prefix)/licenses
versiondir = $(prefix)/versions
qt5prefix = $(libdir)/qt5
qt5bindir = $(qt5prefix)/bin
qt5includedir = $(qt5prefix)/include
qt5libdir = $(qt5prefix)/lib
qt5elibdir = $(qt5prefix)/lib

# Architecture
GARCH = $($(DESTIMG)_GARCH)
GARCH_FAMILY = $($(DESTIMG)_GARCH_FAMILY)
GARHOST = $($(DESTIMG)_GARHOST)

# GARTARGET may be exported from a package with an arbitrary value to indicate
# that dependencies of that package which recognize a "target" platform, such
# as GCC and GNU binutils, should target the specified platform.  The default
# value of $(GARHOST) causes the those packages to produce native tools.
GARTARGET ?= $(GARHOST)

# Tools
CC = $($(DESTIMG)_CC)
CXX = $($(DESTIMG)_CXX)
CPP = $($(DESTIMG)_CPP)
LD = $($(DESTIMG)_LD)
OBJDUMP = $($(DESTIMG)_OBJDUMP)
OBJCOPY = $($(DESTIMG)_OBJCOPY)
STRIP = $($(DESTIMG)_STRIP)
RANLIB = $($(DESTIMG)_RANLIB)
READELF = $($(DESTIMG)_READELF)
NM = $($(DESTIMG)_NM)
AS = $($(DESTIMG)_AS)
AR = $($(DESTIMG)_AR)

# Tool options -- These are append-mode assignments so that packages may
# provide additional tool options.
CPPFLAGS += $($(DESTIMG)_CPPFLAGS)
CFLAGS += $($(DESTIMG)_CFLAGS)
CXXFLAGS += $($(DESTIMG)_CXXFLAGS)
LDFLAGS += $($(DESTIMG)_LDFLAGS)

# So many packages ignore CPPFLAGS what it is easier just to add them to CFLAGS and CXXFLAGS
CFLAGS += $(CPPFLAGS)
CXXFLAGS += $(CPPFLAGS)

####### Defaults for GAR target control variables #######
DISTNAME ?= $(GARNAME)-$(GARVERSION)
FILEDIR ?= files
DOWNLOADDIR ?= download
PARTIALDIR ?= $(DOWNLOADDIR)/partial
COOKIEROOTDIR ?= cookies
COOKIEDIR ?= $(COOKIEROOTDIR)/$(DESTIMG).d
WORKROOTDIR ?= work
WORKDIR ?= $(WORKROOTDIR)/$(DESTIMG).d
WORKSRC ?= $(WORKDIR)/$(DISTNAME)
EXTRACTDIR ?= $(WORKDIR)
SCRATCHDIR ?= tmp
CHECKSUM_FILE ?= checksums
MANIFEST_FILE ?= manifest
ALLFILES ?= $(DISTFILES) $(PATCHFILES)
STAGINGDIR ?= $(build_DESTDIR)$(build_prefix)/staging

# allow us to use programs we just built
BUILD_SYSTEM_PATH := $(if $(BUILD_SYSTEM_PATH),$(BUILD_SYSTEM_PATH),$(PATH))
GAR_SYSTEM_PATH = $(ccache_DESTDIR)$(ccache_bindir)$(strip \
	:$(build_DESTDIR)$(build_bindir)/wrapper)$(strip \
	:$(DESTDIR)$(bindir)/config)$(strip \
	:$(build_DESTDIR)$(build_esbindir):$(build_DESTDIR)$(build_ebindir):$(build_DESTDIR)$(build_sbindir):$(build_DESTDIR)$(build_bindir))$(strip \
	:$(native_DESTDIR)/$(native_bindir))
NATIVE_LINKTIME_PATH = /lib/$(GARBUILD):/usr/lib/$(GARBUILD)$(strip \
	$(if $(filter i386,$(build_GARCH_FAMILY)), \
		:/lib32:/usr/lib32 \
	))$(strip \
	$(if $(filter x86_64,$(build_GARCH_FAMILY)), \
		:/lib64:/usr/lib64 \
	))$(strip \
	:/lib:/usr/lib)
BUILD_LINKTIME_PATH = $(build_DESTDIR)$(build_libdir):$(build_DESTDIR)$(build_qt5libdir):$(build_DESTDIR)$(build_libdir)/mysql
TARGET_LINKTIME_PATH = $(DESTDIR)$(elibdir):$(DESTDIR)$(libdir):$(DESTDIR)$(qt5libdir):$(DESTDIR)$(libdir)/mysql

PATH = $(if $(wildcard $(native_DESTDIR)$(native_bindir)/true),$(GAR_SYSTEM_PATH),$(GAR_SYSTEM_PATH):$(BUILD_SYSTEM_PATH))
LIBRARY_PATH = $(BUILD_LINKTIME_PATH):$(NATIVE_LINKTIME_PATH)
LD_LIBRARY_PATH = $(BUILD_LINKTIME_PATH)
#LIBRARY_PATH =
#LD_LIBRARY_PATH =
# or at least it did before we had DESTDIR and fully-munged
# builddeps.  The following may be more of a hindrance than a
# help nowadays:
#LD_PRELOAD +=/lib/libc.so.6

# XXX: These macros should go in lib
DIRSTODOTS = $(subst . /,./,$(patsubst %,/..,$(subst /, ,/$(1))))
ROOTFROMDEST = $(call DIRSTODOTS,$(DESTDIR))

# XXX: BUILD_CLEAN handling should go in lib
ifdef BUILD_CLEAN
DO_BUILD_CLEAN = buildclean
export CCACHE_DISABLE=foo
else
DO_BUILD_CLEAN =
endif

CCACHE_BASEDIR =
export CCACHE_BASEDIR
CCACHE_COMPILERCHECK = content
export CCACHE_COMPILERCHECK
CCACHE_DIR = $(mm_HOME)/ccache
export CCACHE_DIR
CCACHE_MAXSIZE = $(mm_CCACHE_MAXSIZE)
export CCACHE_MAXSIZE

PARALLELMFLAGS ?= $(MFLAGS)
export PARALLELMFLAGS

INSTALL_DIRS = $(addprefix $(DESTDIR),$(prefix) $(exec_prefix) $(ebindir) $(bindir) $(esbindir) $(sbindir) $(libexecdir) $(datadir) $(sysconfdir) $(sharedstatedir) $(localstatedir) $(elibdir) $(libdir) $(infodir) $(lispdir) $(includedir) $(oldincludedir) $(mandir) $(foreach NUM,1 2 3 4 5 6 7 8, $(mandir)/man$(NUM)) $(sourcedir))

# For rules that do nothing, display what dependencies they
# successfully completed
#DONADA = @echo "	[$@] complete.  Finished rules: $+"
DONADA = @touch $(COOKIEDIR)/$@; echo "	[$@] complete for $(GARNAME)."

# TODO: write a stub rule to print out the name of a rule when it
# *does* do something, and handle indentation intelligently.

# Default sequence for "all" is:  fetch checksum extract patch configure build
all: build
	$(DONADA)


include $(GARDIR)/gar.lib.mk
include $(GARDIR)/gar.bugs.mk

#################### DIRECTORY MAKERS ####################

# This is to make dirs as needed by the base rules
$(sort $(DOWNLOADDIR) $(PARTIALDIR) $(COOKIEDIR) $(WORKSRC) $(WORKDIR) $(EXTRACTDIR) $(FILEDIR) $(SCRATCHDIR) $(INSTALL_DIRS) $(GARCHIVEDIR) $(GARPKGDIR) $(STAGINGDIR)):
	@if test -d $@; then : ; else \
		install -d $@; \
		echo "install -d $@"; \
	fi

$(COOKIEDIR)/%:
	@if test -d $@; then : ; else \
		install -d $@; \
		echo "install -d $@"; \
	fi

# These stubs are wildcarded, so that the port maintainer can
# define something like "pre-configure" and it won't conflict,
# while the configure target can call "pre-configure" safely even
# if the port maintainer hasn't defined it.
# 
# in addition to the pre-<target> rules, the maintainer may wish
# to set a "pre-everything" rule, which runs before the first
# actual target.
pre-%:
	@true

post-%:
	@true

# Call any arbitrary rule recursively
deep-%: %
	@$(foreach IMG,$(IMGDEPS),for dep in $(filter-out $($(IMG)_NODEPEND),$($(IMG)_DEPENDS)); do $(MAKE) -C ../../$$dep DESTIMG=$(IMG) $@; done; )

# ========================= MAIN RULES ========================= 
# The main rules are the ones that the user can specify as a
# target on the "make" command-line.  Currently, they are:
#	fetch-list fetch checksum makesum extract checkpatch patch
#	build install reinstall uninstall package
# (some may not be complete yet).
#
# Each of these rules has dependencies that run in the following
# order:
# 	- run the previous main rule in the chain (e.g., install
# 	  depends on build)
#	- run the pre- rule for the target (e.g., configure would
#	  then run pre-configure)
#	- generate a set of files to depend on.  These are typically
#	  cookie files in $(COOKIEDIR), but in the case of fetch are
#	  actual downloaded files in $(DOWNLOADDIR)
# 	- run the post- rule for the target
# 
# The main rules also run the $(DONADA) code, which prints out
# what just happened when all the dependencies are finished.

announce:
	@echo "[===== NOW BUILDING:	$(DISTNAME)	=====]"

# fetch-list	- Show list of files that would be retrieved by fetch.
# NOTE: DOES NOT RUN pre-everything!
fetch-list:
	@echo "Distribution files: "
	@for i in $(DISTFILES); do echo "	$$i"; done
	@echo "Patch files: "
	@for i in $(PATCHFILES); do echo "	$$i"; done

# showdeps		- Show dependencies in a tree-structure
showdeps:
	@$(foreach IMG,$(IMGDEPS),for dep in $(filter-out $($(IMG)_NODEPEND),$($(IMG)_DEPENDS)); do echo -e "$(TABLEVEL)$(IMG): $$dep"; $(MAKE) -s -C $(GARDIR)/$$dep TABLEVEL="$(TABLEVEL)\t" DESTIMG=$(IMG) showdeps; done ;) true

# fetch			- Retrieves $(DISTFILES) (and $(PATCHFILES) if defined)
#				  into $(DOWNLOADDIR) as necessary.
FETCH_TARGETS =  $(addprefix $(DOWNLOADDIR)/,$(ALLFILES))

fetch: announce pre-everything $(COOKIEDIR) $(DOWNLOADDIR) $(PARTIALDIR) $(addprefix dep-$(GARDIR)/,$(FETCHDEPS)) pre-fetch $(FETCH_TARGETS) post-fetch 
	$(DONADA)

# returns true if fetch has completed successfully, false
# otherwise
fetch-p:
	@$(foreach COOKIEFILE,$(FETCH_TARGETS), test -e $(COOKIEDIR)/$(COOKIEFILE) ;)

# checksum		- Use $(CHECKSUMFILE) to ensure that your
# 				  distfiles are valid.
CHECKSUM_TARGETS = $(addprefix checksum-,$(filter-out $(NOCHECKSUM),$(ALLFILES)))

checksum: fetch $(COOKIEDIR) pre-checksum $(CHECKSUM_TARGETS) post-checksum
	$(DONADA)

# returns true if checksum has completed successfully, false
# otherwise
checksum-p:
	@$(foreach COOKIEFILE,$(CHECKSUM_TARGETS), test -e $(COOKIEDIR)/$(COOKIEFILE) ;)

# makesum		- Generate distinfo (only do this for your own ports!).
MAKESUM_TARGETS =  $(addprefix $(DOWNLOADDIR)/,$(filter-out $(NOCHECKSUM),$(ALLFILES))) 

makesum: fetch $(MAKESUM_TARGETS)
	@if test "x$(MAKESUM_TARGETS)" != "x "; then \
		md5sum $(MAKESUM_TARGETS) > $(CHECKSUM_FILE) ; \
		echo "Checksums made for $(MAKESUM_TARGETS)" ; \
		cat $(CHECKSUM_FILE) ; \
	fi

# I am always typing this by mistake
makesums: makesum

GARCHIVE_TARGETS =  $(addprefix $(GARCHIVEDIR)/,$(ALLFILES))

garchive: checksum $(GARCHIVE_TARGETS) ;


# extract		- Unpacks $(DISTFILES) into $(EXTRACTDIR) (patches are "zcatted" into the patch program)
EXTRACT_TARGETS = $(addprefix extract-,$(filter-out $(NOEXTRACT),$(DISTFILES)))
EXTRACT_SOURCEPKG = $(addprefix $(COOKIEDIR)/sourcepkg-,$(addsuffix /patch,$(SOURCEPKG)))

extract: checksum $(EXTRACTDIR) $(COOKIEDIR) $(EXTRACT_SOURCEPKG) $(addprefix dep-$(GARDIR)/,$(EXTRACTDEPS)) pre-extract $(EXTRACT_TARGETS) post-extract
	$(DONADA)

# returns true if extract has completed successfully, false
# otherwise
extract-p:
	@$(foreach COOKIEFILE,$(EXTRACT_TARGETS), test -e $(COOKIEDIR)/$(COOKIEFILE) ;)

# checkpatch	- Do a "patch -C" instead of a "patch".  Note
# 				  that it may give incorrect results if multiple
# 				  patches deal with the same file.
# TODO: actually write it!
checkpatch: extract
	@echo "$@ NOT IMPLEMENTED YET"

# patch			- Apply any provided patches to the source.
PATCH_TARGETS = $(addprefix patch-,$(PATCHFILES))

patch: extract $(WORKSRC) pre-patch $(PATCH_TARGETS) post-patch
	$(DONADA)

# returns true if patch has completed successfully, false
# otherwise
patch-p:
	@$(foreach COOKIEFILE,$(PATCH_TARGETS), test -e $(COOKIEDIR)/$(COOKIEFILE) ;)

# makepatch		- Grab the upstream source and diff against $(WORKSRC).  Since
# 				  diff returns 1 if there are differences, we remove the patch
# 				  file on "success".  Goofy diff.
makepatch: $(SCRATCHDIR) $(FILEDIR) $(FILEDIR)/gar-base.diff
	$(DONADA)

# this takes the changes you've made to a working directory,
# distills them to a patch, updates the checksum file, and tries
# out the build (assuming you've listed the gar-base.diff in your
# PATCHFILES).  This is way undocumented.  -NickM
beaujolais: makepatch makesum clean build
	$(DONADA)

# configure		- Runs either GNU configure, one or more local
# 				  configure scripts or nothing, depending on
# 				  what's available.
CONFIGURE_TARGETS = $(addprefix configure-,$(CONFIGURE_SCRIPTS))
CONFIGURE_IMGDEPS = $(addprefix imgdep-,$(IMGDEPS))

configure: patch $(CONFIGURE_IMGDEPS) $(addprefix srcdep-$(GARDIR)/,$(SOURCEDEPS)) pre-configure $(CONFIGURE_TARGETS) post-configure
	$(DONADA)

# returns true if configure has completed successfully, false
# otherwise
configure-p:
	@$(foreach COOKIEFILE,$(CONFIGURE_TARGETS), test -e $(COOKIEDIR)/$(COOKIEFILE) ;)

# build			- Actually compile the sources.
BUILD_TARGETS = $(addprefix build-,$(BUILD_SCRIPTS))

build: configure pre-build $(BUILD_TARGETS) post-build
	$(DONADA)

# returns true if build has completed successfully, false
# otherwise
build-p:
	@$(foreach COOKIEFILE,$(BUILD_TARGETS), test -e $(COOKIEDIR)/$(COOKIEFILE) ;)

# strip			- Strip binaries
strip: build pre-strip $(addprefix strip-,$(STRIP_SCRIPTS)) post-strip
	@echo "$@ NOT IMPLEMENTED YET"

# install		- Install the results of a build.
INSTALL_TARGETS = $(addprefix install-,$(INSTALL_SCRIPTS)) $(addprefix install-license-,$(subst /, ,$(LICENSE))) install-version

install: build $(addprefix dep-$(GARDIR)/,$(INSTALLDEPS)) $(INSTALL_DIRS) pre-install $(INSTALL_TARGETS) post-install $(DO_BUILD_CLEAN)
	$(DONADA)

# returns true if install has completed successfully, false
# otherwise
install-p:
	@$(foreach COOKIEFILE,$(INSTALL_TARGETS), test -e $(COOKIEDIR)/$(COOKIEFILE) ;)

# installstrip		- Install the results of a build, stripping first.
installstrip: strip pre-install $(INSTALL_TARGETS) post-install
	$(DONADA)

# reinstall		- Install the results of a build, ignoring
# 				  "already installed" flag.
reinstall: build
	rm -rf $(COOKIEDIR)/*install*
	$(MAKE) install

# uninstall		- Remove the installation.
# TODO: actually write it!
uninstall: build
	@echo "$@ NOT IMPLEMENTED YET"
	

# package		- Create a package from an _installed_ port.
# TODO: actually write it!
package: build
	@echo "$@ NOT IMPLEMENTED YET"

# tarball		- Make a tarball from an install of the package into a scratch dir
tarball: tarball-$(DESTIMG)

tarball-%:
	$(MAKE) DESTIMG="$*" install
	$(MAKE) DESTIMG="$*" $*_DESTDIR="$(CURDIR)/$(SCRATCHDIR)" reinstall
	find $(SCRATCHDIR) -depth -type d | while read i; do rmdir $$i > /dev/null 2>&1 || true; done
	tar czvf $(CURDIR)/$(WORKDIR)/$(DISTNAME)-$*-install.tar.gz -C $(SCRATCHDIR) .
	$(MAKECOOKIE)

# garpkg		- Produce a garpkg and file it appropriately under $(GARPKGDIR)
garpkg: $(GARPKGDIR)
	$(MAKE) DESTIMG="$(DESTIMG)" $(DESTIMG)_prefix="/usr/local" tarball
	install -m 644 -D $(CURDIR)/$(WORKDIR)/$(DISTNAME)-$(DESTIMG)-install.tar.gz $(GARPKGDIR)/$(DISTNAME).tar.gz
	ln -fs $(DISTNAME).tar.gz $(GARPKGDIR)/$(GARNAME).tar.gz
	rm -f $(GARPKGDIR)/$(GARNAME).tar.gz.sig
	gpg --detach-sign $(GARPKGDIR)/$(GARNAME).tar.gz
	mv $(GARPKGDIR)/$(GARNAME).tar.gz.sig $(GARPKGDIR)/$(DISTNAME).tar.gz.sig	
	ln -fs $(DISTNAME).tar.gz.sig $(GARPKGDIR)/$(GARNAME).tar.gz.sig
	$(MAKECOOKIE)
	

# The clean rule.  It must be run if you want to re-download a
# file after a successful checksum (or just remove the checksum
# cookie, but that would be lame and unportable).
clean: cookieclean
	@rm -rf $(DOWNLOADDIR)

cookieclean: buildclean
	@rm -rf $(COOKIEROOTDIR)

buildclean:
	@rm -rf $(WORKSRC) $(WORKROOTDIR) $(EXTRACTDIR) $(SCRATCHDIR) $(SCRATCHDIR)-$(COOKIEDIR) $(SCRATCHDIR)-build *~

imgclean:
	rm -rf $(DESTDIR)$(prefix)

superclean: clean imgclean

love:
	@echo "not war!"

# these targets do not have actual corresponding files
.PHONY: all fetch-list beaujolais fetch-p checksum-p extract-p patch-p configure-p build-p install-p love

# apparently this makes all previous rules non-parallelizable,
# but the actual builds of the packages will be, according to
# jdub.
.NOTPARALLEL:
