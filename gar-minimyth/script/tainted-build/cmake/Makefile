GARNAME = cmake
GARVERSION = $(CMAKE_VERSION)
CATEGORIES = tainted-build
SOURCEPKG = devel/cmake
LICENSE = BSD_3_Clause

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	tainted-build/libc-crt \
	tainted-build/ncursesw
BUILDDEPS = \
	native/native \
	tainted-build/gcc-wrappers \
	tainted-build/bash \
	tainted-build/coreutils \
	tainted-build/make \
	tainted-build/ninja

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

GAR_EXTRA_CONF += tainted-build/tainted-build/toolchain.mk
GAR_EXTRA_CONF += devel/cmake/package-api.mk
include ../../gar.mk
