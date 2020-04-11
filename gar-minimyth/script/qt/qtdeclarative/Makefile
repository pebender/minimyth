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
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5PacketProtocol.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5Qml.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5QmlDebug.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5QmlDevTools.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5QmlModels.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5QmlWorkerScript.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5Quick.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5QuickParticles.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5QuickShapes.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5QuickTest.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5QuickWidgets.la
	@$(MAKECOOKIE)
