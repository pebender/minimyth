GARNAME = glu
GARVERSION = 9.0.1
CATEGORIES = xorg
MASTER_SITES  = https://mesa.freedesktop.org/archive/glu/
DISTFILES = $(DISTNAME).tar.xz
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx \
	xorg/Mesa

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-debug \
	--disable-osmesa

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libGLU.la
	@$(MAKECOOKIE)
