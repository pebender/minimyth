GARNAME = avahi
GARVERSION = 0.8
CATEGORIES = lib
MASTER_SITES = https://avahi.org/download/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = LGPL2_1

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c build-tool/make lib/dbus lib/expat lib/libdaemon
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-nls \
	--disable-glib \
	--disable-gobject \
	--disable-introspection \
	--disable-libevent \
	--disable-qt3 \
	--disable-qt4 \
	--disable-qt5 \
	--disable-gtk \
	--disable-gtk3 \
	--enable-dbus \
	--disable-dbm \
	--disable-gdbm \
	--enable-libdaemon \
	--disable-python \
	--disable-pygtk \
	--disable-python-dbus \
	--disable-mono \
	--disable-monodoc \
	--disable-autoipd \
	--disable-doxygen-doc \
	--disable-doxygen-dot \
	--disable-doxygen-man \
	--disable-doxygen-rtf \
	--disable-doxygen-xml \
	--disable-doxygen-chm \
	--disable-doxygen-chi \
	--disable-doxygen-html \
	--disable-doxygen-ps \
	--disable-doxygen-pdf \
	--disable-core-docs \
	--disable-manpages \
	--disable-xmltoman \
	--disable-tests \
	--enable-compat-libdns_sd \
	--disable-compat-howl \
	--with-distro='none'

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libavahi-common.la
	@rm -f $(DESTDIR)$(libdir)/libavahi-core.la
	@rm -f $(DESTDIR)$(libdir)/libavahi-client.la
	@rm -f $(DESTDIR)$(libdir)/libdns_sd.la
	@$(MAKECOOKIE)
