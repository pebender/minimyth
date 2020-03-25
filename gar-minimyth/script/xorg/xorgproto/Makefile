GARNAME = xorgproto
GARVERSION = 2019.2
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/proto/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME)-pkg_config_libdir.patch
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING-*

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-specs \
	--disable-legacy \
	--without-xmlto \
	--without-fop \
	--without-xsltproc

GAR_EXTRA_CONF += xorg/xorg/package-api.mk
include ../../gar.mk
