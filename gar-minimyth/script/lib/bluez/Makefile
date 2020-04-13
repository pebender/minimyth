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
	--disable-optimization \
	--disable-debug \
	--enable-threads \
	--disable-backtrace \
	--enable-library \
	--disable-test \
	--enable-nfc \
	--enable-sap \
	--enable-a2dp \
	--enable-avrcp \
	--enable-network \
	--enable-hid \
	--enable-hog \
	--enable-health \
	--enable-tools \
	--enable-monitor \
	--enable-udev \
	--disable-cups \
	--disable-mesh \
	--disable-midi \
	--disable-obex \
	--enable-btpclient \
	--disable-external-ell \
	--enable-client \
	--disable-systemd \
	--enable-datafiles \
	--disable-manpages \
	--disable-testing \
	--disable-experimental \
	--enable-deprecated \
	--enable-sixaxis \
	--enable-logger \
	--disable-android

include ../../gar.mk

post-install:
	@rm -fv $(DESTDIR)$(libdir)/libbluetooth.la
	@$(MAKECOOKIE)
