GARNAME = lzip
GARVERSION = 1.21
CATEGORIES = utils
MASTER_SITES = http://download.savannah.gnu.org/releases/lzip/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/cxx

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	--prefix="$(prefix)" \
	--exec-prefix="$(exec_prefix)" \
	--bindir="$(bindir)" \
	--datarootdir="$(datadir)" \
	--infodir="$(infodir)" \
	--mandir="$(mandir)" \
	CXX="$(CXX)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CXXFLAGS="$(CXXFLAGS)" \
	LDFLAGS="$(LDFLAGS)" \
	SHELL="$(SHELL)"
BUILD_ARGS     = \
	SHELL="$(SHELL)"
INSTALL_ARGS   = \
	SHELL="$(SHELL)"

include ../../gar.mk
