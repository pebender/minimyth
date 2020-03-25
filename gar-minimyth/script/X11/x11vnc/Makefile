GARNAME = x11vnc
GARVERSION = 0.9.16
CATEGORIES = X11
MASTER_SITES = https://github.com/LibVNC/x11vnc/archive/
http://downloads.sourceforge.net/project/libvncserver/$(GARNAME)/$(GARVERSION)/
DISTFILES = $(GARVERSION).tar.gz
PATCHFILES = \
	$(DISTNAME)-automake_1.13.patch \
	$(DISTNAME)-config_h.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/avahi lib/libjpeg lib/zlib X11/libvncserver xorg/libX11 xorg/libXcomposite xorg/libXcursor xorg/libXdamage xorg/libXext xorg/libXfixes xorg/libXinerama xorg/libXrandr xorg/libXtst
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--x-includes=$(DESTDIR)$(includedir) \
	--x-libraries=$(DESTDIR)$(libdir) \
	--with-crypto \
	--with-ssl \
	--with-crypt \
	--with-x \
	--with-xkeyboard \
	--with-xinerama \
	--with-xrandr \
	--with-xfixes \
	--without-xdamage \
	--with-xcomposite \
	--without-xtrap \
	--with-xrecord \
	--without-fbpm \
	--with-dpms \
	--without-v4l \
	--without-fbdev \
	--with-uinput \
	--without-macosx-native \
	--without-colormultipointer \
	--with-avahi

CONFIGURE_ENV = \
	ac_cv_func_fork_works=yes \
	ac_cv_func_lstat_dereferences_slashed_symlink=yes \
	ac_cv_func_memcmp_working=yes \
	ac_cv_func_stat_empty_string_bug=no

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@#$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
