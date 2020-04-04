GARNAME = libevdev
GARVERSION = 1.9.0
CATEGORIES = xorg
MASTER_SITES = https://www.freedesktop.org/software/libevdev/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared

GAR_EXTRA_CONF += xorg/xorg/package-api.mk
include ../../gar.mk

CPPFLAGS += -Wno-unused-command-line-argument
CFLAGS += -Wno-unused-command-line-argument

post-install:
	@rm -fv $(DESTDIR)$(libdir)/$(GARNAME).la
	@$(MAKECOOKIE)
