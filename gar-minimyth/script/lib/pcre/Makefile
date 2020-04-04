GARNAME = pcre
GARVERSION = 8.43
CATEGORIES = lib
MASTER_SITES = https://ftp.pcre.org/pub/pcre/
DISTFILES = $(DISTNAME).tar.bz2
#PATCHFILES  = $(DISTNAME).patch.gar
ifneq ($(DESTIMG),build)
#PATCHFILES += $(DISTNAME)-cross.patch
endif
LICENSE = BSD_3_Clause

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lang/cxx
ifneq ($(DESTIMG),build)
BUILDDEPS = lib/pcre
endif

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile
ifeq ($(DESTIMG),build)
INSTALL_SCRIPTS   += cross
endif

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--enable-utf8 \
	--enable-unicode-properties

include ../../gar.mk

pre-configure:
	@mkdir -p $(WORKSRC)/m4
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

install-cross:
	@if test -e $(WORKSRC)/dftables ; then cp -f $(WORKSRC)/dftables $(DESTDIR)$(bindir)/pcre-dftables ; fi
	@$(MAKECOOKIE)

post-install:
	@rm -fv $(DESTDIR)$(libdir)/libpcre.la
	@rm -fv $(DESTDIR)$(libdir)/libpcrecpp.la
	@rm -fv $(DESTDIR)$(libdir)/libpcreposix.la
	@rm -fv $(DESTDIR)$(bindir)/config/pcre-config
	@rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-pcre-config
	@mkdir -pv $(DESTDIR)$(bindir)/config
	@mv $(DESTDIR)$(bindir)/pcre-config $(DESTDIR)$(bindir)/config/pcre-config
	@ln -sfv pcre-config $(DESTDIR)$(bindir)/config/$(GARHOST)-pcre-config
	@$(MAKECOOKIE)
