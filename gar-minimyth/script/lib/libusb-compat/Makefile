GARNAME = libusb-compat-0.1
GARVERSION = 0.1.7
CATEGORIES = lib
MASTER_SITES = https://github.com/libusb/libusb-compat-0.1/archive/
DISTFILES = v$(GARVERSION).tar.gz
PATCHFILES = \
	$(DISTNAME).patch.gar
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libusb

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-log \
	--disable-debug-log \
	--disable-examples-build

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(MAKECOOKIE)

post-install:
	@rm -fv $(DESTDIR)$(libdir)/libusb.la
	@rm -fv $(DESTDIR)$(bindir)/config/libusb-config
	@rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-libusb-config
	@mkdir -pv $(DESTDIR)$(bindir)/config
	@mv -v $(DESTDIR)$(bindir)/libusb-config $(DESTDIR)$(bindir)/config/libusb-config
	@ln -sfv libusb-config $(DESTDIR)$(bindir)/config/$(GARHOST)-libusb-config
	@$(MAKECOOKIE)
