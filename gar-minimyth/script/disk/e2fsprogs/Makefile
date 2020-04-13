GARNAME = e2fsprogs
GARVERSION = 1.45.6
CATEGORIES = disk
MASTER_SITES = https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2/LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c build-tool/make utils/util-linux
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-verbose-makecmds \
	--enable-elf-shlibs \
	--disable-bsd-shlibs \
	--disable-profile \
	--disable-gcov \
	--disable-hardening \
	--disable-jbd-debug \
	--disable-blkid-debug \
	--disable-testio-debug \
	--disable-libuuid \
	--disable-libblkid \
	--disable-subset \
	--disable-backtrace \
	--disable-debugfs \
	--disable-imager \
	--disable-resizer \
	--disable-defrag \
	--disable-fsck \
	--disable-e2initrd-helper \
	--enable-tls \
	--disable-uuidd \
	--disable-mmp \
	--disable-tdb \
	--disable-bmap-stats \
	--disable-bmap-stats-ops \
	--disable-nls \
	--disable-rpath \
	--disable-fuse2fs \
	--enable-lto \
	--disable-ubsan \
	--disable-addrsan \
	--disable-threadsan \
	BUILD_CC="$(build_CC)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"

build_DESTDIR = $(build_DESTDIR_swapped)
build_rootdir = $(build_rootdir_swapped)

include ../../gar.mk

x-pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)
