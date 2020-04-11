GARNAME = xscreensaver
GARVERSION = 5.44
CATEGORIES = X11
MASTER_SITES = https://www.jwz.org/xscreensaver/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = \
	$(DISTNAME)-po_disable.patch \
	$(DISTNAME).patch.gar
LICENSE = MIT

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/libjpeg lib/libpng lib/zlib xorg/libICE xorg/libX11 xorg/libXext xorg/libXi xorg/libXinerama xorg/libXrandr xorg/libXrender xorg/libXxf86vm xorg/Mesa
BUILDDEPS = lib/glib utils/bc

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes=$(DESTDIR)$(includedir) \
	--x-libraries=$(DESTDIR)$(libdir) \
	--disable-locking \
	--with-x \
	--with-hackdir=$(libexecdir)/xscreensaver \
	--with-configdir=$(datadir)/xscreensaver/config \
	--with-x-app-defaults=$(datadir)/X11/app-defaults \
	--without-gtk \
	--without-motif \
	--with-gl \
	--without-gle \
	--without-pixbuf \
	--with-xpm \
	--with-jpeg
INSTALL_ARGS = \
	install_prefix=$(DESTDIR)

include ../../gar.mk
