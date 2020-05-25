GARNAME = isl
GARVERSION = 0.22.1
CATEGORIES = lib
MASTER_SITES = http://isl.gforge.inria.fr/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/gmp

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--with-gmp=system \
	--with-gmp-prefix=$(DESTDIR)$(prefix)

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libisl.la
	@$(MAKECOOKIE)
