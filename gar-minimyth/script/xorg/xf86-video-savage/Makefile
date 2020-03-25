GARNAME = xf86-video-savage
GARVERSION = 20190504-2ec88355
CATEGORIES = xorg
MASTER_SITES = git://cgit.freedesktop.org/xorg/driver/xf86-video-savage/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	xorg/libdrm \
	xorg/libpciaccess \
	xorg/util-macros \
	xorg/xorg-server \
	xorg/xorgproto \
	xorg/xorg-sgml-doctools
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--enable-dri \
	--disable-xaa

GAR_EXTRA_CONF += xorg/xorg/package-api.mk
include ../../gar.mk

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE) 

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@rm -f $(WORKSRC)/config.cache
	@$(MAKECOOKIE)

post-install:
	@rm -fv $(DESTDIR)$(libdir)/xorg/modules/drivers/savage_drv.la
	@$(MAKECOOKIE)
