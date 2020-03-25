GARNAME = procps
GARVERSION = v3.3.16
CATEGORIES = utils
MASTER_SITES = https://gitlab.com/procps-ng/procps/-/archive/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2/LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c build-tool/autotools lib/ncursesw

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--config-cache \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-nls \
	--disable-rpath

CONFIGURE_ENV += \
	ac_cv_func_malloc_0_nonnull=yes \
	ac_cv_func_realloc_0_nonnull=yes

include ../../gar.mk

pre-configure:
	@cd $(WORKSRC) ; ./autogen.sh
	@$(MAKECOOKIE)

post-install:
	@rm -fv $(DESTDIR)$(libdir)/libprocps.la
	@$(MAKECOOKIE)
