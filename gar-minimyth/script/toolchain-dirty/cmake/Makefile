GARNAME = cmake
GARVERSION = $(CMAKE_VERSION)
CATEGORIES = toolchain-dirty
SOURCEPKG = devel/cmake
LICENSE = BSD_3_Clause

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	toolchain-dirty/libc-crt \
	toolchain-dirty/ncursesw
BUILDDEPS = \
	native/native \
	toolchain-dirty/ccache \
	toolchain-dirty/clang-wrappers \
	toolchain-dirty/bash \
	toolchain-dirty/coreutils \
	toolchain-dirty/make \
	toolchain-dirty/ninja

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

GAR_EXTRA_CONF += toolchain-dirty/toolchain-dirty/toolchain.mk
GAR_EXTRA_CONF += devel/cmake/package-api.mk
include ../../gar.mk
