GARNAME = qtbase-everywhere-src
GARVERSION = $(QT5_VERSION)
CATEGORIES = qt
MASTER_SITES = https://download.qt.io/archive/qt/5.14/$(GARVERSION)/submodules/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES = \
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
	-xcb-xinput \
	-xkbcommon \
	-gif \
	-ico \
	-system-libpng \
	-system-libjpeg \
	-sql-mysql \
	-mysql_config "$(DESTDIR)$(bindir)/config/mysql_config" \
	-sql-sqlite \
	-qt-sqlite
ifeq ($(DESTIMG),build)
xBUILD_ENV = \
	LD_LIBRARY_PATH="$(PWD)/$(WORKSRC)/lib:$(LD_LIBRARY_PATH)"
else
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

# qt 5.12.6 fails to compile with gcc 9.2.0's link time optimization enabled.
#CFLAGS   := $(filter-out -flto, $(CFLAGS))
#CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))

#LDFLAGS  :=

pre-configure:
	@cp -rfv $(build_DESTDIR)$(build_qt5prefix)/mkspecs/minimyth-build $(WORKSRC)/mkspecs/minimyth-build
	@cp -rfv $(build_DESTDIR)$(build_qt5prefix)/mkspecs/minimyth-$(DESTIMG) $(WORKSRC)/mkspecs/minimyth-$(DESTIMG)
	@$(MAKECOOKIE)

x-pre-install:
	@rm -rfv $(WORKSRC)/mkspecs/minimyth-build
	@rm -rfv $(WORKSRC)/mkspecs/minimyth-$(DESTIMG)
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
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
	@rm -rf $(DESTDIR)$(qt5prefix)
