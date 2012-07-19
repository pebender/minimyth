GARNAME = cmake
GARVERSION = 2.8.8
CATEGORIES = devel
MASTER_SITES = http://www.cmake.org/files/v2.8/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = BSD_3_Clause

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	--verbose \
	--parallel=1 \
	--no-system-libs \
	--no-system-curl \
	--no-system-expat \
	--no-system-zlib \
	--no-system-bzip2 \
	--no-system-libarchive \
	--no-qt-gui \
	--prefix="$(prefix)" \
	--datadir="$(datadir)/CMake" \
	--docdir="$(docdir)/CMake" \
	--mandir="$(mandir)"

include ../../gar.mk