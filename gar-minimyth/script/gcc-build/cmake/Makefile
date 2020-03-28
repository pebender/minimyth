GARNAME = cmake
GARVERSION = $(CMAKE_VERSION)
CATEGORIES = gcc-build
SOURCEPKG = devel/cmake
LICENSE = BSD_3_Clause

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	native/native \
	cc-build/ccache \
	gcc-build/gcc \
	gcc-build/gcc-wrappers \
	gcc-build/bash \
	gcc-build/coreutils \
	gcc-build/make \
	gcc-build/ninja \
	gcc-build/ncursesw

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	--verbose \
	--parallel=6 \
	--no-system-libs \
	--no-qt-gui \
	--no-openssl \
	--prefix="$(prefix)" \
	--datadir="$(subst $(prefix),,$(datadir)/CMake)" \
	--docdir="$(subst $(prefix),,$(docdir)/CMake)" \
	--mandir="$(subst $(prefix),,$(mandir))"

GAR_EXTRA_CONF += gcc-build/gcc-build/toolchain.mk
GAR_EXTRA_CONF += devel/cmake/package-api.mk
include ../../gar.mk
