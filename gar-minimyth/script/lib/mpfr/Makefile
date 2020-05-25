GARNAME = mpfr
GARVERSION = 4.0.2
CATEGORIES = lib
MASTER_SITES = https://ftp.gnu.org/gnu/mpfr/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL3/LGPL3

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
	--with-gmp-include=$(DESTDIR)$(includedir) \
	--with-gmp-lib=$(DESTDIR)$(libdir) \
	--with-gnu-ld

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libmpfr.la
	@$(MAKECOOKIE)
