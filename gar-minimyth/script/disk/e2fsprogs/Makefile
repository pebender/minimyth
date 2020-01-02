GARNAME = e2fsprogs
GARVERSION = 1.45.4
CATEGORIES = disk
MASTER_SITES = https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES = $(DISTNAME)-gettext.patch
LICENSE = GPL2/LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c utils/util-linux

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
	--enable-nls \
	--disable-rpath \
	--disable-fuse2fs \
	--enable-lto \
	--disable-ubsan \
	--disable-addrsan \
	--disable-threadsan

include ../../gar.mk

x-pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)
