GARNAME = mesa-demos
GARVERSION = 8.4.0
CATEGORIES = xorg
MASTER_SITES  = https://mesa.freedesktop.org/archive/demos/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	xorg/glew \
	xorg/glu \
	xorg/freeglut \
	xorg/Mesa

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

# --disable-rbug doesn't work but leaving it out disables it.
CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--enable-egl \
	--disable-gles1 \
	--disable-gles2 \
	--disable-vg \
	--disable-osmesa \
	--enable-libdrm \
	--enable-x11 \
	--disable-wayland \
	--enable-gbm \
	--enable-freetype2 \
	--with-mesa-source=$(DESTDIR)$(sourcedir)/Mesa

GAR_EXTRA_CONF += xorg/xorg/package-api.mk
include ../../gar.mk
