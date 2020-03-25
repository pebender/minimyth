GARNAME = libpciaccess
GARVERSION = 0.16
CATEGORIES = xorg
MASTER_SITES = https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/archive/libpciaccess-$(GARVERSION)/
DISTFILES = $(GARNAME)-$(DISTNAME).tar.bz2
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/autotools lib/zlib \
	xorg/util-macros

WORKSRC = $(WORKDIR)/$(GARNAME)-$(DISTNAME)

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--with-pciids-path=$(datadir) \
	--with-zlib

GAR_EXTRA_CONF += xorg/xorg/package-api.mk
include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@$(MAKECOOKIE)
