GARNAME = libevent
GARVERSION = 2.1.11-stable
CATEGORIES = lib
MASTER_SITES = https://github.com/libevent/libevent/releases/download/release-$(GARVERSION)/
DISTFILES  = $(DISTNAME).tar.gz
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/make lib/openssl

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static

include ../../gar.mk

post-install: post-install-lib-wrappers

post-install-lib-wrappers::
	@rm -fv $(DESTDIR)$(libdir)/libevent.la
	@rm -fv $(DESTDIR)$(libdir)/libevent_core.la
	@rm -fv $(DESTDIR)$(libdir)/libevent_extra.la
	@rm -fv $(DESTDIR)$(libdir)/libevent_pthreads.la
	@rm -fv $(DESTDIR)$(libdir)/libevent_openssl.la
	@$(MAKECOOKIE)
