GARNAME = xwiimote
GARVERSION = 2
CATEGORIES = utils
MASTER_SITES = https://github.com/dvdhrm/xwiimote/releases/download/xwiimote-2/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/ncursesw system/udev

WORKSRC = $(WORKDIR)/$(DISTNAME)

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-debug

include ../../gar.mk

pre-configure:
	@mkdir -pv $(WORKSRC)/m4
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libxwiimote.la
	@$(MAKECOOKIE)
