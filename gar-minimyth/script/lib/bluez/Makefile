GARNAME = bluez
GARVERSION = 5.54
CATEGORIES = lib
MASTER_SITES = https://www.kernel.org/pub/linux/bluetooth/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c build-tool/make lib/glib lib/alsa-lib lib/dbus lib/readline
BUILDDEPS =
ifneq ($(DESTIMG),build)
DEPENDS  += lib/libusb-compat system/udev
endif

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--enable-library \
	--disable-obex \
	--disable-systemd
ifeq ($(DESTIMG),build)
xCONFIGURE_ARGS += \
	--disable-usb \
	--disable-hid2hci
else
xCONFIGURE_ARGS += \
	--enable-usb \
	--enable-hid2hci
endif

include ../../gar.mk
