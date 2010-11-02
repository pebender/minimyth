GARNAME = xscreensaver
GARVERSION = 5.12
CATEGORIES = X11
MASTER_SITES = http://www.jwz.org/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-intltool_disable.patch $(DISTNAME)-po_disable.patch $(DISTNAME).patch.gar
LICENSE = MIT

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c xorg/xorg lib/libjpeg lib/zlib
BUILDDEPS = gtk/glib utils/bc

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

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
INSTALL_ARGS   = \
	install_prefix=$(DESTDIR)

include ../../gar.mk

# Fails to compile (x86_64) when compiled with at least some of GCC's -ftree-loop-distribution option.
CFLAGS   := $(filter-out -ftree-loop-distribution, $(CFLAGS))
CXXFLAGS := $(filter-out -ftree-loop-distribution, $(CXXFLAGS))

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(MAKECOOKIE)