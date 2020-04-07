GARNAME = qtdeclarative-everywhere-src
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

post-install:
	@rf -fv $(DESTDIR)$(qt5libdir)/libQt5PacketProtocol.la
	@rf -fv $(DESTDIR)$(qt5libdir)/libQt5Qml.la
	@rf -fv $(DESTDIR)$(qt5libdir)/libQt5QmlDebug.la
	@rf -fv $(DESTDIR)$(qt5libdir)/libQt5QmlDevTools.la
	@rf -fv $(DESTDIR)$(qt5libdir)/libQt5QmlModels.la
	@rf -fv $(DESTDIR)$(qt5libdir)/libQt5QmlWorkerScript.la
	@rf -fv $(DESTDIR)$(qt5libdir)/libQt5Quick.la
	@rf -fv $(DESTDIR)$(qt5libdir)/libQt5QuickParticles.la
	@rf -fv $(DESTDIR)$(qt5libdir)/libQt5QuickShapes.la
	@rf -fv $(DESTDIR)$(qt5libdir)/libQt5QuickTest.la
	@rf -fv $(DESTDIR)$(qt5libdir)/libQt5QuickWidgets.la
	@$(MAKECOOKIE)
