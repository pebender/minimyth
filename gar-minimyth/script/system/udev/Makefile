GARNAME = eudev
GARVERSION = 3.2.9
CATEGORIES = system
MASTER_SITES = https://dev.gentoo.org/~blueness/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c lib/libxslt utils/kmod utils/util-linux
BUILDDEPS = utils/gperf

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--disable-split-usr \
	--disable-introspection \
	--disable-selinux \
	--disable-manpages \
	--disable-kmod \
	--disable-hwdb \
	--disable-rule_generator \
	--enable-mtd_probe \
	--with-rootprefix=$(rootdir) \
	--with-rootlibdir=$(libdir) \
	--with-rootlibexecdir=$(libexecdir)

include ../../gar.mk

libexecdir := $(libdir)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

pre-install:
	@rm -rf $(DESTDIR)$(sysconfdir)/udev
	@rm -rf $(DESTDIR)$(bindir)/udevadm
	@rm -rf $(DESTDIR)$(libdir)/libudev.*
	@rm -rf $(DESTDIR)$(libdir)/pkgconfig/libudev.pc
	@rm -rf $(DESTDIR)$(libexecdir)/udev
	@rm -rf $(DESTDIR)$(licensedir)/udev
	@rm -rf $(DESTDIR)$(versiondir)/udev
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libudev.la
	@$(MAKECOOKIE)
