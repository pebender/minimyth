GARNAME = qtwebchannel-everywhere-src
GARVERSION = $(QT5_VERSION)
CATEGORIES = qt
MASTER_SITES = https://download.qt.io/archive/qt/5.14/$(GARVERSION)/submodules/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx build-tool/qmake qt/qtbase

CONFIGURE_SCRIPTS = $(WORKSRC)/qmake
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

GAR_EXTRA_CONF += qt/qtbase/package-api.mk
include ../../gar.mk

configure-%/qmake: 
	@echo " ==> Running qmake in $*"
	@cd $* && $(CONFIGURE_ENV) $(build_DESTDIR)$(build_qt5bindir)/qmake $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)
