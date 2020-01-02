GARNAME = coreutils
GARVERSION = $(COREUTILS_VERSION)
CATEGORIES = devel-tainted
SOURCEPKG = utils/coreutils
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

GAR_EXTRA_CONF += utils/coreutils/package-api.mk
include ../../gar.mk

CPPFLAGS :=
CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=

pre-configure:
	@$(call RUN_GETTEXTIZE)
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
