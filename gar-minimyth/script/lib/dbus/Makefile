GARNAME = dbus
GARVERSION = 1.13.12
CATEGORIES = lib
MASTER_SITES = https://dbus.freedesktop.org/releases/dbus/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c build-tool/make lib/expat xorg/libX11 xorg/libXt
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes="$(DESTDIR)$(includedir)" \
	--x-libraries="$(DESTDIR)$(libdir)" \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-verbose-mode \
	--disable-asserts \
	--enable-checks \
	--disable-xml-docs \
	--disable-doxygen-docs \
	--disable-ducktype-docs  \
	--enable-abstract-sockets \
	--disable-selinux \
	--with-x

CONFIGURE_ENV = \
	dbus_cv_va_val_copy="no"

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libdbus-1.la
	@$(MAKECOOKIE)
