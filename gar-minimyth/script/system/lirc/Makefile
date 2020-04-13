GARNAME = lirc
GARVERSION = 0.10.1
CATEGORIES = system
MASTER_SITES = https://sourceforge.net/projects/lirc/files/LIRC/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-disable_python35.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c kernel/linux lib/alsa-lib lib/libftdi lib/libirman lib/libusb-compat python/python xorg/libX11

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes="$(DESTDIR)$(includedir)" \
	--x-libraries="$(DESTDIR)$(libdir)" \
	--enable-shared \
	--disable-static \
	--enable-uinput \
	--enable-devinput \
	--with-x
BUILD_ARGS     = $(LINUX_MAKE_ARGS)
INSTALL_ARGS   = $(LINUX_MAKE_ARGS)

CONFIGURE_ENV = $(LINUX_MAKE_ENV) \
	DEVINPUT_HEADER="$(DESTDIR)$(includedir)/linux/input-event-codes.h"
BUILD_ENV     = $(LINUX_MAKE_ENV) \
	HAVE_WORKING_POLL="1"
INSTALL_ENV   = $(LINUX_MAKE_ENV)

GAR_EXTRA_CONF += kernel/linux/package-api.mk
include ../../gar.mk

#PARALLELMFLAGS := -j1

# lirc 0.10.1 fails to compile with llvm 10.0.0 link time optimization enabled.
CFLAGS   := $(CFLAGS) -fno-lto
CXXFLAGS := $(CXXFLAGS) -fno-lto
LDFLAGS  := $(LDFLAGS) -fno-lto

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -fv $(DESTDIR)$(libdir)/liblirc.la
	@rm -fv $(DESTDIR)$(libdir)/liblirc_client.la
	@rm -fv $(DESTDIR)$(libdir)/liblirc_driver.la
	@rm -fv $(DESTDIR)$(libdir)/libirrecord.la
	@rm -rf $(DESTDIR)$(libdir)/lirc/plugins/*.la
	@rm -fv $(DESTDIR)$(libdir)/python3.8/site-packages/lirc/_client.*
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
	@rm -rfv $(DESTDIR)$(libdir)/liblirc.*
	@rm -rfv $(DESTDIR)$(libdir)/liblirc_client.*
	@rm -rfv $(DESTDIR)$(libdir)/liblirc_driver.*
	@rm -rfv $(DESTDIR)$(libdir)/libirrecord.*
	@rm -rfv $(DESTDIR)$(libdir)/lirc/
	@rm -rfv $(DESTDIR)$(libdir)/python3.8/site-packages/lirc/_client.*
	@rm -rfv $(DESTDIR)$(sbindir)/lirc-lsplugins
	@rm -rfv $(DESTDIR)$(sbindir)/lircd
	@rm -rfv $(DESTDIR)$(sbindir)/lircd-setup
	@rm -rfv $(DESTDIR)$(sbindir)/lircd-uinput
	@rm -rfv $(DESTDIR)$(sbindir)/lircmd
	@rm -rfv $(DESTDIR)$(includedir)/lirc
	@rm -rfv $(DESTDIR)$(includedir)/lirc_*
	@rm -rfv $(DESTDIR)$(mandir)/man1/lircrcd.1
	@rm -rfv $(DESTDIR)$(mandir)/man8/lircd.8
	@rm -rfv $(DESTDIR)$(mandir)/man8/lircmd.8
