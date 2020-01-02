GARNAME = usbutils
GARVERSION = 012
CATEGORIES = utils
MASTER_SITES = https://www.kernel.org/pub/linux/utils/usb/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c data/usb.ids lib/libusb system/udev

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
