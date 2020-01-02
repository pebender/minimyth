GARNAME = qtwebkit-opensource-src
GARVERSION = 5.9.0
CATEGORIES = qt
MASTER_SITES = https://download.qt.io/community_releases/5.9/$(GARVERSION)-final/
DISTFILES = $(DISTNAME).tar.xz
xPATCHFILES = \
	$(DISTNAME)-icu_59.patch
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lang/cxx lib/libwebp lib/icu qt/qt5
BUILDDEPS = 

CONFIGURE_SCRIPTS = $(WORKSRC)/qmake
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

include ../../gar.mk

configure-%/qmake: 
	@echo " ==> Running qmake in $*"
	@cd $* && $(CONFIGURE_ENV) $(build_DESTDIR)$(build_qt5bindir)/qmake $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)
