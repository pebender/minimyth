GARNAME = xwiimote
GARVERSION = 2
CATEGORIES = utils
MASTER_SITES = https://github.com/dvdhrm/xwiimote/
DISTFILES = $(DISTNAME).tar.gz
xPATCHFILES = \
	$(DISTNAME)-am_prog_ar.patch
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/ncursesw system/udev

WORKSRC = $(WORKDIR)/$(GARNAME)-$(DISTNAME)

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
