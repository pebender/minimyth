GARNAME = xf86-video-openchrome
GARVERSION_TYPE = git
GARVERSION = $(strip $(if $(filter git,$(GARVERSION_TYPE)) , \
	20191223-ad74ff0 , \
	0.6.0 ))
CATEGORIES = xorg
MASTER_SITES = $(strip $(if $(filter git,$(GARVERSION_TYPE)) , \
        git://cgit.freedesktop.org/openchrome/$(GARNAME)/ , \
	https://www.x.org/releases/individual/driver/ ))
DISTFILES = $(DISTNAME).tar.bz2
xPATCHFILES = \
	$(DISTNAME)-xorg_server_h.patch \
	$(DISTNAME)-automake_1.13.patch
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c system/udev \
	xorg/libdrm \
	xorg/libpciaccess \
	xorg/util-macros \
	xorg/xorgproto \
	xorg/xorg-server
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--disable-debug \
	--disable-xv-debug \
	--disable-viaregtool

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
	@$(MAKECOOKIE)

post-install:
	@rm -fv $(DESTDIR)$(libdir)/xorg/modules/drivers/openchrome_drv.la
	@rm -fv $(DESTDIR)$(libdir)/libchromeXvMC.la
	@rm -fv $(DESTDIR)$(libdir)/libchromeXvMCPro.la
	@$(MAKECOOKIE)
