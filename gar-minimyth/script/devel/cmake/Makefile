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

ifeq ($(DESTIMG),build)
DEPENDS = lang/c lang/cxx build-tool/make lib/openssl devel/ninja
else
BUILDDEPS = devel/cmake
endif

ifeq ($(DESTIMG),build)
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
	--prefix="$(DESTDIR)$(prefix)" \
	--datadir="$(subst $(prefix),,$(datadir)/CMake)" \
	--docdir="$(subst $(prefix),,$(docdir)/CMake)" \
	--mandir="$(subst $(prefix),,$(mandir))"

BUILD_ARGS = DESTDIR=
INSTALL_ARGS = DESTDIR=
CONFIGURE_ENV = DESTDIR=
BUILD_ENV = DESTDIR=
INSTALL_ENV = DESTDIR=

GAR_EXTRA_CONF += devel/cmake/package-api.mk
include ../../gar.mk
