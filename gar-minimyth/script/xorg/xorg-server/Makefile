GARNAME = xorg-server
GARVERSION = 1.20.6
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/xserver/
DISTFILES = $(DISTNAME).tar.bz2
xPATCHFILES = \
	$(DISTNAME)-perl.patch.gar \
	$(DISTNAME)-pkg_config.patch \
	$(DISTNAME)-detect_radeon.patch
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS  = lang/c lib/openssl \
	xorg/font-util \
	xorg/libdrm \
	xorg/libX11 \
	xorg/libXau \
	xorg/libXfont2 \
	xorg/libXi \
	xorg/libXtst \
	xorg/libpciaccess \
	xorg/libxkbfile \
	xorg/libepoxy \
	xorg/libxshmfence \
	xorg/Mesa \
	xorg/pixman \
	xorg/util-macros \
	xorg/xorgproto \
	xorg/xtrans

ifneq ($(DESTIMG),build)
DEPENDS += system/udev
endif
BUILDDEPS = \
	xorg/xorg-sgml-doctools

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-docs \
	--disable-devel-docs \
	--disable-unit-tests \
	--disable-static \
	--enable-shared \
	--disable-debug \
	--disable-listen-tcp \
	--enable-listen-unix \
	--disable-listen-local \
	--enable-visibility \
	--enable-composite \
	--enable-mitshm \
	--enable-xres \
	--enable-record \
	--enable-xv \
	--enable-xvmc \
	--enable-dga \
	--enable-screensaver \
	--disable-xdmcp \
	--disable-xdm-auth-1 \
	--enable-glx \
	--enable-dri \
	--enable-dri2 \
	--enable-dri3 \
	--enable-present \
	--enable-xinerama \
	--enable-xf86vidmode \
	--enable-xace \
	--disable-xselinux \
	--disable-xcsecurity \
	--enable-dbe \
	--disable-xf86bigfont \
	--enable-dpms \
	$(if $(filter build, $(DESTIMG)), --disable-config-udev, --enable-config-udev) \
	$(if $(filter build, $(DESTIMG)), --disable-config-udev-kms, --enable-config-udev-kms) \
	--disable-config-hal \
	--disable-config-wscons \
	--enable-xfree86-utils \
	--enable-vgahw \
	--enable-vbe \
	--enable-int10-module \
	--disable-windowswm \
	--disable-windowsdri \
	--enable-libdrm \
	--enable-clientids \
	--enable-pciaccess \
	--enable-linux-acpi \
	--enable-linux-apm \
	--disable-systemd-logind \
	--disable-suid-wrapper \
	--enable-xorg \
	--disable-dmx \
	--disable-xvfb \
	--disable-xnest \
	--disable-xquartz \
	--disable-xwayland \
	--disable-xwayland-eglstream \
	--disable-standalone-xpbproxy \
	--disable-xwin \
	--enable-glamor \
	--disable-kdrive \
	--disable-xephyr \
	--disable-libunwind \
	--enable-xshmfence \
	--disable-install-setuid \
	--enable-unix-transport \
	--disable-tcp-transport \
	--disable-ipv6 \
	--disable-local-transport \
	--disable-secure-rpc \
	--enable-input-thread \
	--enable-xtrans-send-fds \
	--without-doxygen \
	--without-xmlto \
	--without-fop \
	--without-xsltproc \
	--with-default-font-path="$(datadir)/fonts/X11/TTF,$(datadir)/fonts/X11/misc" \
	--with-xkb-path="$(datadir)/X11/xkb" \
	--with-xkb-output="$(datadir)/X11/xkb/compiled" \
	--with-serverconfig-path="$(libdir)/xserver" \
	--without-xmlto \
	--without-fop \
	--with-sha1=libcrypto

CONFIGURE_ENV = \
	XORG_SGML_PATH="$(DESTDIR)$(includedir)/xorg"

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/drivers/modesetting_drv.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/extensions/libglx.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libexa.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libfb.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libfbdevhw.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libglamoregl.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libint10.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libshadow.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libshadowfb.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libvbe.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libvgahw.la
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/libwfb.la
	@$(MAKECOOKIE)
