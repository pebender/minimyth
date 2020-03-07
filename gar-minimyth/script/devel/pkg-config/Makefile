GARNAME = pkg-config
GARVERSION = $(PKGCONFIG_VERSION)
CATEGORIES = devel
MASTER_SITES = https://pkgconfig.freedesktop.org/releases/
DISTFILES = $(DISTNAME).tar.gz 
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

ifeq ($(GARHOST),$(GARBUILD))
DEPENDS = lang/c build-tool/make
else
BUILDDEPS = devel/pkg-config
endif

ifeq ($(GARHOST),$(GARBUILD))
CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile
endif

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--with-pc-path="$(DESTDIR)$(rootdir)" \
	--disable-host-tool \
	--with-internal-glib

GAR_EXTRA_CONF += devel/pkg-config/package-api.mk
include ../../gar.mk
