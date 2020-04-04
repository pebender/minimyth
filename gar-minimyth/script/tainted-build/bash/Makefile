GARNAME = bash
GARVERSION = $(BASH_VERSION)
SOURCEPKG = utils/bash
CATEGORIES = tainted-build
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	tainted-build/libc-crt
BUILDDEPS = \
	native/native \
	tainted-build/cc \
	tainted-build/ccache

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile ls

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-nls \
	--enable-rpath

CONFIGURE_ENV = \
	bash_cv_termcap_lib="gnutermcap"

GAR_EXTRA_CONF += tainted-build/tainted-build/toolchain.mk
GAR_EXTRA_CONF += utils/bash/package-api.mk
include ../../gar.mk

CC := $(build_DESTDIR)$(build_bindir)/ccache.d/cc
CXX := $(build_DESTDIR)$(build_bindir)/ccache.d/c++
CPP := $(build_DESTDIR)$(build_bindir)/cpp
LD := $(build_DESTDIR)$(build_bindir)/ld

CPPFLAGS :=
CFLAGS :=
CXXFLAGS :=
LDFLAGS :=

install-ls:
	@ln -sfv bash $(DESTDIR)$(bindir)/sh
	@$(MAKECOOKIE)
