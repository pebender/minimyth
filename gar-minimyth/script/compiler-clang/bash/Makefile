GARNAME = bash
GARVERSION = $(BASH_VERSION)
CATEGORIES = compiler-clang
SOURCEPKG = utils/bash
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	native/native \
	ccache/ccache \
	compiler-gcc/compiler-gcc

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile ls

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-nls \
	--enable-rpath

CONFIGURE_ENV = \
	bash_cv_termcap_lib="gnutermcap"

GAR_EXTRA_CONF += compiler-clang/compiler-clang/toolchain.mk
GAR_EXTRA_CONF += utils/bash/package-api.mk
include ../../gar.mk

install-ls:
	@ln -sfv bash $(DESTDIR)$(bindir)/sh
	@$(MAKECOOKIE)
