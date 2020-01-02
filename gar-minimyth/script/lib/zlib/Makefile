GARNAME = zlib
GARVERSION = $(ZLIB_VERSION)
CATEGORIES = lib
MASTER_SITES = https://sourceforge.net/projects/libpng/files/zlib/$(GARVERSION)/
DISTFILES  = $(DISTNAME).tar.xz
DISTFILES += license
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKDIR)/license

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	--prefix=$(prefix) \
	--eprefix=$(exec_prefix) \
     	--libdir=$(libdir) \
	--includedir=$(includedir) \
	--shared

GAR_EXTRA_CONF += lib/zlib/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libz.a
	@$(MAKECOOKIE)
