GARNAME = qtbase-everywhere-src
GARVERSION = $(QT5_VERSION)
CATEGORIES = qt
MASTER_SITES  = https://download.qt.io/archive/qt/$(word 1,$(subst ., ,$(GARVERSION))).$(word 2,$(subst ., ,$(GARVERSION)))/$(GARVERSION)/submodules/
MASTER_SITES += https://download.qt.io/development_releases/qt/$(word 1,$(subst ., ,$(GARVERSION))).$(word 2,$(subst ., ,$(GARVERSION)))/$(GARVERSION)/submodules/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES = \
	$(DISTNAME)-input_event.patch \
	$(DISTNAME)-qt_socklen_t.patch \
	$(DISTNAME).patch.gar
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx build-tool/qmake db/mariadb lib/alsa-lib lib/dbus lib/glib lib/freetype lib/fontconfig lib/libjpeg lib/libmng lib/mtdev lib/pcre2 lib/libpng lib/libtiff lib/openssl lib/zlib X11/libxkbcommon xorg/xorg
BUILDDEPS  = devel/bison devel/flex
ifneq ($(DESTIMG),build)
DEPENDS += lib/libinput system/udev
endif

PWD := $(shell pwd)

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	-verbose \
	-recheck-all \
	-prefix $(qt5prefix) \
	-bindir $(qt5bindir) \
	-headerdir $(qt5includedir) \
	-libdir $(qt5libdir) \
	-archdatadir $(qt5prefix) \
	-plugindir $(qt5prefix)/plugins \
	-libexecdir $(qt5elibdir) \
	-importdir $(qt5prefix)/imports \
	-datadir $(qt5prefix) \
	-docdir $(qt5prefix)/doc \
	-translationdir $(qt5prefix)/translations \
	-sysconfdir $(qt5prefix)/etc/xdg \
	-examplesdir $(qt5prefix)/examples \
	-opensource \
	-confirm-license \
	-release \
	-no-strip \
	-platform minimyth-build \
	-no-reduce-relocations \
	-no-rpath \
	-no-pch \
	-sysroot $(DESTDIR) \
	-no-compile-examples \
	-dbus-linked \
	-accessibility \
	-qt-doubleconversion \
	-glib \
	-eventfd \
	-inotify \
	-system-pcre \
	-system-zlib \
	-syslog \
	-ssl \
	-openssl-linked \
	-system-proxies \
	-no-cups \
	-fontconfig \
	-system-freetype \
	-no-harfbuzz \
	-no-gtk \
	-no-lgmon \
	-opengl desktop \
        -no-openvg \
        -no-opengles3 \
	-no-egl \
	-qpa xcb \
	-xcb-xlib \
	-no-eglfs \
	-gbm \
	-kms \
	-linuxfb \
	-system-xcb \
	$(if $(filter $(GARBUILD),$(GARHOST)),-no-libudev,-libudev) \
	-evdev \
	-no-imf \
	$(if $(filter $(GARBUILD),$(GARHOST)),-no-libinput,-libinput) \
	-mtdev \
	-no-tslib \
	-no-xcb-xinput \
	-xkbcommon \
	-gif \
	-ico \
	-system-libpng \
	-system-libjpeg \
	-sql-mysql \
	-mysql_config "$(DESTDIR)$(bindir)/config.d/mysql_config" \
	-sql-sqlite \
	-qt-sqlite
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	-xplatform minimyth-main \
	-hostprefix $(build_DESTDIR)$(build_qt5prefix) \
	-hostbindir $(build_DESTDIR)$(build_qt5bindir) \
	-hostlibdir $(build_DESTDIR)$(build_qt5libdir) \
	-hostdatadir $(build_DESTDIR)$(build_qt5prefix) \
	-device-option CROSS_COMPILE=$(GARHOST)-
endif

GAR_EXTRA_CONF += devel/gcc/package-api.mk devel/glibc/package-api.mk
include ../../gar.mk

pre-configure:
	@cp -rfv $(build_DESTDIR)$(build_qt5prefix)/mkspecs/minimyth-build $(WORKSRC)/mkspecs/minimyth-build
	@cp -rfv $(build_DESTDIR)$(build_qt5prefix)/mkspecs/minimyth-$(DESTIMG) $(WORKSRC)/mkspecs/minimyth-$(DESTIMG)
	@$(MAKECOOKIE)

post-install:
	@rm -fv $(DESTDIR)$(qt5libdir)/*.la
	@$(call GLIBC_ADD_LIB_PATH, $(qt5libdir))
	@files=`ls -1 $(DESTDIR)$(qt5libdir)/pkgconfig/*.pc` ; \
	 for file in $${files} ; do \
		sed -e 's%^prefix=$(DESTDIR)$(qt5prefix)$$%prefix=$(qt5prefix)%g' -i $${file} ; \
		sed -e 's%-I$(DESTDIR)$(includedir)%-I$(includedir)%g'            -i $${file} ; \
		sed -e 's%-L$(DESTDIR)$(libdir)%-L$(libdir)%g'                    -i $${file} ; \
		sed -e 's%-I$(DESTDIR)$(qt5includedir)%-I$(qt5includedir)%g'      -i $${file} ; \
		sed -e 's%-L$(DESTDIR)$(qt5libdir)%-L$(qt5libdir)%g'              -i $${file} ; \
		sed -e 's%-I$(DESTDIR)$(qt5prefix)%-I$(qt5prefix)%g'              -i $${file} ; \
		sed -e 's%-L$(DESTDIR)$(qt5prefix)%-L$(qt5prefix)%g'              -i $${file} ; \
	 done
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5AccessibilitySupport.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5Bootstrap.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5BootstrapDBus.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5Concurrent.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5Core.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5DBus.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5DeviceDiscoverySupport.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5EdidSupport.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5EventDispatcherSupport.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5FbSupport.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5FontDatabaseSupport.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5GlxSupport.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5Gui.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5InputSupport.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5KmsSupport.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5Network.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5OpenGLExtensions.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5OpenGL.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5PlatformCompositorSupport.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5PrintSupport.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5ServiceSupport.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5Sql.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5Test.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5ThemeSupport.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5Widgets.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5XcbQpa.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5XkbCommonSupport.la
	@rm -fv $(DESTDIR)$(qt5libdir)/libQt5Xml.la
	@rm -fv $(DESTDIR)$(qt5libdir)/Qt5Zlib.la
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
	@rm -rf $(DESTDIR)$(qt5prefix)
