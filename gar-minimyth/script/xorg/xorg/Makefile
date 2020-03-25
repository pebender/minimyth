GARNAME = xorg
GARVERSION =
CATEGORIES = xorg
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	xorg/font-alias \
	xorg/font-bh-ttf \
	xorg/font-cursor-misc \
	xorg/font-misc-misc \
	xorg/freeglut \
	xorg/glew \
	xorg/iceauth \
	xorg/libX11 \
	xorg/libXcomposite \
	xorg/libXdamage \
	xorg/libXext \
	xorg/libXfixes \
	xorg/libXft \
	xorg/libXinerama \
	xorg/libXmu \
	xorg/libXpm \
	xorg/libXrandr \
	xorg/libXrender \
	xorg/libXres \
	xorg/libXt \
	xorg/libXtst \
	xorg/Mesa \
	xorg/mkfontdir \
	xorg/mkfontscale \
	xorg/rgb \
	xorg/xcb-util-image \
	xorg/xcb-util-keysyms \
	xorg/xcb-util-renderutil \
	xorg/xcb-util-wm \
	xorg/xdpyinfo \
	xorg/xev \
	$(if $(filter-out $(GARBUILD), $(GARHOST)), \
		xorg/xf86-input-evdev \
		xorg/xf86-input-void \
		xorg/xf86-video-ati \
		$(if $(filter i386  ,$(GARCH_FAMILY)), xorg/xf86-video-geode) \
		xorg/xf86-video-nouveau \
		xorg/xf86-video-openchrome \
		xorg/xf86-video-savage \
		xorg/xf86-video-sis \
		xorg/xf86-video-vmware \
	) \
	xorg/xinit \
	xorg/xkbcomp \
	xorg/xkeyboard-config \
	xorg/xlsclients \
	xorg/xmodmap \
	xorg/xorg-server \
	xorg/xrandr \
	xorg/xset \
	xorg/xsetroot

GAR_EXTRA_CONF += xorg/xorg/package-api.mk
include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
