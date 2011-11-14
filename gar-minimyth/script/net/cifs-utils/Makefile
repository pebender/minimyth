GARNAME = cifs-utils
GARVERSION = 5.1
CATEGORIES = net
MASTER_SITES = ftp://ftp.samba.org/pub/linux-cifs/cifs-utils/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libcap-ng

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-cifsupcall \
	--disable-cifscreds \
	--disable-cifsidmap \
	--disable-cifsacl \
	--with-libcap-ng \
	--with-libcap

CONFIGURE_ENV = \
	ac_cv_func_malloc_0_nonnull=yes \
	ac_cv_func_realloc_0_nonnull=yes

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)