GARNAME = xosd
GARVERSION = 2.2.14
CATEGORIES = X11
MASTER_SITES = https://sourceforge.net/projects/libxosd/files/libxosd/xosd-$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-destdir.patch $(DISTNAME)-dash.patch $(DISTNAME)-libxosd_m4.patch $(DISTNAME)-defaults.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c xorg/libX11 xorg/libXext xorg/libXinerama xorg/libXt

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes=$(DESTDIR)$(includedir) \
	--x-libraries=$(DESTDIR)$(libdir) \
	--enable-shared \
	--disable-static \
	--disable-gtktest \
	--enable-xinerama \
	--disable-gdk_pixbuftest \
	--disable-new-plugin \
	--disable-beep_media_player_plugin \
	--disable-old-plugin \
	--with-x

CONFIGURE_ENV = \
	GTK_CONFIG="no"

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

pre-configure:
	@cp -fv $(build_DESTDIR)$(build_datadir)/libtool/config/config.guess $(WORKSRC)/config.guess
	@cp -fv $(build_DESTDIR)$(build_datadir)/libtool/config/config.sub   $(WORKSRC)/config.sub
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -fv $(DESTDIR)$(libdir)/libxosd.la
	@rm -fv $(DESTDIR)$(bindir)/config.d/xosd-config
	@rm -fv $(DESTDIR)$(bindir)/config.d/$(GARHOST)-xosd-config
	@mkdir -pv $(DESTDIR)$(bindir)/config.d
	@mv -fv $(DESTDIR)$(bindir)/xosd-config $(DESTDIR)$(bindir)/config.d/xosd-config
	@ln -sfv xosd-config $(DESTDIR)$(bindir)/config.d/$(GARHOST)-xosd-config
	@$(MAKECOOKIE)
