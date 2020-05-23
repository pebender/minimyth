GARNAME = mpc
GARVERSION = $(MPC_VERSION)
CATEGORIES = lib
MASTER_SITES = https://ftp.gnu.org/gnu/mpc/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/gmp lib/mpfr

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--with-mpfr-include=$(DESTDIR)$(includedir) \
	--with-mpfr-lib=$(DESTDIR)$(libdir) \
	--with-gmp-include=$(DESTDIR)$(includedir) \
	--with-gmp-lib=$(DESTDIR)$(libdir) \
	--with-gnu-ld

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libmpc.la
	@$(MAKECOOKIE)
