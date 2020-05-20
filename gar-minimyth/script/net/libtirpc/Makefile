GARNAME = libtirpc
GARVERSION = 1.2.6
CATEGORIES = net
MASTER_SITES = https://sourceforge.net/projects/libtirpc/files/libtirpc/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = BSD_3_Clause

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c devel/sys_queue_h

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-authdes \
	--disable-gssapi \
	--disable-ipv6 \
	--enable-symvers \
	--enable-shared \
	--disable-static

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@$(MAKECOOKIE)
