GARNAME = nspr
GARVERSION = 4.24
CATEGORIES = lib
MASTER_SITES = https://ftp.mozilla.org/pub/mozilla.org/$(GARNAME)/releases/v$(GARVERSION)/src/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES  =
ifneq ($(DESTIMG),build)
PATCHFILES += $(DISTNAME)-cross.patch
endif
LICENSE = MPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c
BUILDDEPS  =
ifneq ($(DESTIMG),build)
BUILDDEPS += lib/nspr
endif

PATCHDIRLEVEL = 2

WORKSRC = $(WORKDIR)/$(DISTNAME)/$(GARNAME)

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile nsinstall

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --target=$(GARTARGET) \
	$(if $(filter x86_64,$(GARCH_FAMILY)),--enable-64bit)

xCONFIGURE_ENV = \
	ac_cv_path_AS="$(AS)" \
	ac_cv_path_AR="$(AR)" \
	ac_cv_path_LD="$(LD)" \
	ac_cv_path_STRIP="$(STRIP)"

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

install-nsinstall:
	@cp -f $(WORKSRC)/config/nsinstall $(DESTDIR)$(bindir)/nsinstall
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libnspr4.a
	@rm -f $(DESTDIR)$(libdir)/libplc4.a
	@rm -f $(DESTDIR)$(libdir)/libplds4.a
	@rm -f $(DESTDIR)$(bindir)/config/nspr-config
	@rm -f $(DESTDIR)$(bindir)/config/$(GARHOST)-nspr-config
	@mkdir -p $(DESTDIR)$(bindir)/config
	@mv $(DESTDIR)$(bindir)/nspr-config $(DESTDIR)$(bindir)/config/nspr-config
	@ln -s nspr-config $(DESTDIR)$(bindir)/config/$(GARHOST)-nspr-config
	@$(MAKECOOKIE)
