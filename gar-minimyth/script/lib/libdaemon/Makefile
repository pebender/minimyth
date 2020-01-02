GARNAME = libdaemon
GARVERSION = 0.14
CATEGORIES = net
MASTER_SITES = http://0pointer.de/lennart/projects/libdaemon/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = LGPL2_1

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-lynx

CONFIGURE_ENV = \
	ac_cv_func_fork_works=yes \
	ac_cv_func_setpgrp_void=yes

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libdaemon.la
	@$(MAKECOOKIE)
