GARNAME = bash
GARVERSION = $(BASH_VERSION)
SOURCEPKG = utils/bash
CATEGORIES = toolchain-dirty
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	toolchain-dirty/libc-crt
BUILDDEPS = \
	native/native \
	toolchain-dirty/ccache \
	toolchain-dirty/clang-wrappers

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile ls

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-nls \
	--enable-rpath

CONFIGURE_ENV = \
	bash_cv_termcap_lib="gnutermcap"

GAR_EXTRA_CONF += toolchain-dirty/toolchain-dirty/toolchain.mk
GAR_EXTRA_CONF += utils/bash/package-api.mk
include ../../gar.mk

install-ls:
	@ln -sfv bash $(DESTDIR)$(bindir)/sh
	@$(MAKECOOKIE)
