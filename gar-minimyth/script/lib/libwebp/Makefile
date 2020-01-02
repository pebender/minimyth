GARNAME = libwebp
GARVERSION = 1.0.3
CATEGORIES = lib
MASTER_SITES = https://chromium.googlesource.com/webm/libwebp/+archive/refs/tags/
DISTFILES = v$(GARVERSION).tar.gz
LICENSE =

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

EXTRACTDIR = $(WORKSRC)

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static

include ../../gar.mk

checksum-v$(GARVERSION).tar.gz:
	@$(MAKECOOKIE)

pre-extract:
	@mkdir -pv $(WORKSRC)
	@$(MAKECOOKIE)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libwebp.la
	@rm -f $(DESTDIR)$(libdir)/libwebpdemux.la
	@$(MAKECOOKIE)
