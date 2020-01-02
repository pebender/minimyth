GARNAME = dbus-glib
GARVERSION = 0.104
CATEGORIES = lib
MASTER_SITES = https://dbus.freedesktop.org/releases/dbus-glib/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS    = lang/c lib/expat lib/dbus lib/glib
BUILDDEPS  = lib/dbus
ifneq ($(DESTIMG),build)
BUILDDEPS += lib/dbus-glib
endif

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-tests \
	--disable-ansi \
	--disable-verbose-mode \
	--disable-asserts \
	--enable-checks \
	--disable-gcov \
	--disable-bash-completion \
	--enable-shared \
	--disable-static \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-gtk-doc-pdf
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--with-dbus-binding-tool=$(build_DESTDIR)$(build_bindir)/dbus-binding-tool
endif

include ../../gar.mk

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libdbus-glib-1.la
	@$(MAKECOOKIE)
