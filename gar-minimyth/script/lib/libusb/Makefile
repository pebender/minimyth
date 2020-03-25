GARNAME = libusb
GARVERSION = 1.0.23
CATEGORIES = lib
MASTER_SITES = https://github.com/libusb/libusb/archive/
DISTFILES = v$(GARVERSION).tar.gz
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c
ifneq ($(DESTIMG),build)
DEPENDS += system/udev
endif

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--enable-timerfd \
	--disable-log \
	--disable-debug-log \
	--enable-system-log \
	--disable-examples-build
ifeq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--disable-udev
else
CONFIGURE_ARGS += \
	--enable-udev
endif

include ../../gar.mk
 
pre-configure:
	@mkdir -pv $(WORKSRC)/m4
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libusb-1.0.la
	@$(MAKECOOKIE)
