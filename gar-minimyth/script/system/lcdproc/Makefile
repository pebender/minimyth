GARNAME = lcdproc
GARVERSION = 0.5.9
CATEGORIES = system
MASTER_SITES = https://github.com/lcdproc/lcdproc/releases/download/v$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/libftdi lib/libg15render lib/libirman lib/ncursesw lib/freetype lib/libpng lib/libusb lib/libusb-compat system/g15daemon system/lirc xorg/libX11

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-debug \
	--enable-libusb \
	--enable-libusb-1-0 \
	--enable-libftdi \
	--enable-libX11 \
	--disable-libhid \
	--enable-libpng \
	--enable-freetype \
	--enable-ethlcd \
	--disable-doxygen \
	--disable-dot \
	--disable-html-dox \
	--disable-latex-dox \
	--enable-drivers="all" \
	--enable-testmenus \
	--enable-lcdproc-menus \
	--enable-stat-nfs \
	--enable-stat-smbfs \
	--enable-extra-charmaps \
	--with-included-getopt
include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
