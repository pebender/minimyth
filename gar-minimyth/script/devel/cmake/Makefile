GARNAME = cmake
GARVERSION = $(CMAKE_VERSION)
CATEGORIES = devel
MASTER_SITES = https://github.com/Kitware/CMake/releases/download/v$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-no_openssl.patch
LICENSE = BSD_3_Clause

DESCRIPTION = 
define BLURB
endef

ifeq ($(GARHOST),$(GARBUILD))
DEPENDS = lang/c lang/cxx build-tool/make lib/openssl devel/ninja
else
BUILDDEPS = devel/cmake
endif

ifeq ($(GARHOST),$(GARBUILD))
CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile
endif

CONFIGURE_ARGS = \
	--verbose \
	--parallel=8 \
	--no-system-libs \
	--no-qt-gui \
	--openssl \
	--prefix="$(prefix)" \
	--datadir="$(subst $(prefix),,$(datadir)/CMake)" \
	--docdir="$(subst $(prefix),,$(docdir)/CMake)" \
	--mandir="$(subst $(prefix),,$(mandir))"

include ../../gar.mk
