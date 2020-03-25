GARNAME = libxml2
GARVERSION = 2.9.10
CATEGORIES = lib
MASTER_SITES = ftp://xmlsoft.org/libxml2/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = MIT/MIT_Modified

DESCRIPTION = 
define BLURB
endef

DEPENDS  = lang/c lib/icu lib/zlib utils/xz
ifeq ($(DESTIMG),build)
DEPENDS += python/python
endif

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--with-icu \
	--with-zlib \
	--with-lzma
ifeq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--with-python
else
CONFIGURE_ARGS += \
	--without-python
endif

ifeq ($(DESTIMG),build)
GAR_EXTRA_CONF += python/python/package-api.mk
endif
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libxml2.la
	@rm -f $(DESTDIR)$(PYTHON_libdir)/site-packages/libxml2mod.la
	@sed -i 's%-L$${libdir}%-L$(DESTDIR)$${libdir}%g'         $(DESTDIR)$(bindir)/xml2-config
	@sed -i 's%-I$${includedir}%-I$(DESTDIR)$${includedir}%g' $(DESTDIR)$(bindir)/xml2-config
	@sed -i 's%-L${libdir}%-L$(DESTDIR)${libdir}%g'           $(DESTDIR)$(libdir)/xml2Conf.sh
	@sed -i 's%-I${includedir}%-I$(DESTDIR)${includedir}%g'   $(DESTDIR)$(libdir)/xml2Conf.sh
	@rm -f $(DESTDIR)$(bindir)/config/xml2-config
	@rm -f $(DESTDIR)$(bindir)/config/$(GARHOST)-xml2-config
	@mkdir -p $(DESTDIR)$(bindir)/config
	@mv $(DESTDIR)$(bindir)/xml2-config $(DESTDIR)$(bindir)/config/xml2-config
	@ln -s xml2-config $(DESTDIR)$(bindir)/config/$(GARHOST)-xml2-config
	@$(MAKECOOKIE)
