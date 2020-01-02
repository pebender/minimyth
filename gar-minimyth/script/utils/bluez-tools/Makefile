GARNAME = bluez-tools
GARVERSION = 0.2.0~20140808
CATEGORIES = system
MASTER_SITES = http://ftp.debian.org/debian/pool/main/b/$(GARNAME)/
DISTFILES = $(GARNAME)_$(GARVERSION).orig.tar.gz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/dbus-glib lib/glib lib/readline

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-obex

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)
