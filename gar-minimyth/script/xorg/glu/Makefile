GARNAME = glu
GARVERSION = 9.0.1
CATEGORIES = xorg
MASTER_SITES  = https://mesa.freedesktop.org/archive/glu/
DISTFILES = $(DISTNAME).tar.xz
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx build-tool/make \
	xorg/Mesa

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-debug \
	--disable-osmesa

GAR_EXTRA_CONF += xorg/xorg/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libGLU.la
	@$(MAKECOOKIE)
