GARNAME = libdrm
GARVERSION = 2.4.100
CATEGORIES = xorg
MASTER_SITES = https://dri.freedesktop.org/libdrm/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME)-o_cloexec.patch
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS  = lang/c \
	xorg/libpciaccess \
	xorg/libpthread-stubs
ifneq ($(DESTIMG),build)
DEPENDS += system/udev
endif

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--enable-libkms \
	--enable-intel \
	--enable-radeon \
	--enable-nouveau \
	--disable-vmwgfx \
	--disable-omap-experimental-api \
	--disable-exynos-experimental-api \
	--disable-freedreno \
	--disable-freedreno-kgsl \
	--disable-tegra-experimental-api \
	--disable-install-test-programs \
	--disable-cairo-tests \
	--disable-manpages \
	--disable-valgrind
ifeq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--disable-udev
else
CONFIGURE_ARGS += \
	--enable-udev
endif

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)_amdgpu.la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)_intel.la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)_nouveau.la
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME)_radeon.la
	@rm -f $(DESTDIR)$(libdir)/libkms.la
	@$(MAKECOOKIE)
