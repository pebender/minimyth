GARNAME = intel-vaapi-driver
GARVERSION = 2.4.0
CATEGORIES = X11
MASTER_SITES = https://github.com/intel/$(GARNAME)/releases/download/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx xorg/libdrm X11/libva

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-x11 \
	--disable-wayland \
	--disable-hybrid-codec \
	--disable-tests \
	--disable-static \
	--enable-shared

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/dri/i965_drv_video.la
	@$(MAKECOOKIE)
