GARNAME = qtwebkit
GARVERSION = 5.212.0-alpha4
CATEGORIES = qt
MASTER_SITES = https://github.com/qtwebkit/qtwebkit/releases/download/$(DISTNAME)/
DISTFILES = $(DISTNAME).tar.xz \
	qt_lib_webkit.pri \
	qt_lib_webkit_private.pri \
	qt_lib_webkitwidgets.pri \
	qt_lib_webkitwidgets_private.pri
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx build-tool/qmake lib/libwebp lib/icu qt/qtbase qt/qtdeclarative qt/qtwebchannel
BUILDDEPS = devel/ruby

CONFIGURE_SCRIPTS = $(WORKSRC)/cmake
BUILD_SCRIPTS = $(WORKSRC)/cmake
INSTALL_SCRIPTS = $(WORKSRC)/cmake pri

CONFIGURE_ARGS = \
	-DQt5_DIR="$(DESTDIR)$(qt5libdir)/cmake/Qt5" \
	-DCMAKE_BUILD_TYPE=RELEASE \
	-DCMAKE_VERBOSE_MAKEFILE=ON \
	-DCMAKE_SYSROOT="$(DESTDIR)" \
	-DCMAKE_INSTALL_PREFIX="$(qt5prefix)" \
	-DCMAKE_STAGING_PREFIX="$(DESTDIR)$(qt5prefix)" \
	-DCMAKE_INSTALL_LIBDIR="lib" \
	-DCMAKE_C_COMPILER="$(CC)" \
	-DCMAKE_CXX_COMPILER="$(CXX)" \
	-DCMAKE_ASM_COMPILER="$(CC)" \
	-DCMAKE_C_COMPILER_TARGET="$(GARHOST)" \
	-DCMAKE_CXX_COMPILER_TARGET="$(GARHOST)" \
	-DCMAKE_ASM_COMPILER_TARGET="$(GARHOST)" \
	-DCMAKE_LINKER="$(LD)" \
	-DCMAKE_C_FLAGS="$(CFLAGS)" \
	-DCMAKE_CXX_FLAGS="$(CXXFLAGS)" \
	-DCMAKE_EXE_LINKER_FLAGS="$(LDFLAGS)" \
	-DCMAKE_SHARED_LINKER_FLAGS="$(LDFLAGS)" \
	-DCMAKE_AR="$(AR)" \
	-DCMAKE_AS="$(AS)" \
	-DCMAKE_NM="$(NM)" \
	-DCMAKE_OBJCOPY="$(OBJCOPY)" \
	-DCMAKE_OBJDUMP="$(OBJDUMP)" \
	-DCMAKE_RANLIB="$(RANLIB)" \
	-DCMAKE_STRIP="$(STRIP)" \
	-DCMAKE_SYSTEM_PROCESSOR="$(GARCH_FAMILY)" \
	-DCMAKE_CROSSCOMPILING=ON \
	-DCMAKE_SYSTEM_NAME="Linux" \
	-DPYTHON_EXECUTABLE="$(build_DESTDIR)$(build_bindir)/python" \
	-DPORT="Qt" \
	-DENABLE_DEVICE_ORIENTATION=OFF \
	-DENABLE_GEOLOCATION=OFF \
	-DUSE_GSTREAMER=OFF \
	-DUSE_LIBHYPHEN=OFF

GAR_EXTRA_CONF += devel/cmake/package-api.mk
GAR_EXTRA_CONF += qt/qtbase/package-api.mk
include ../../gar.mk

install-pri:
	@mkdir -pv $(DESTDIR)$(qt5prefix)/mkspecs
	@install -v --mode=0644 $(DOWNLOADDIR)/qt_lib_webkit.pri $(DESTDIR)$(qt5prefix)/mkspecs/modules/qt_lib_webkit.pri
	@install -v --mode=0644 $(DOWNLOADDIR)/qt_lib_webkit_private.pri $(DESTDIR)$(qt5prefix)/mkspecs/modules/qt_lib_webkit_private.pri
	@install -v --mode=0644 $(DOWNLOADDIR)/qt_lib_webkitwidgets.pri $(DESTDIR)$(qt5prefix)/mkspecs/modules/qt_lib_webkitwidgets.pri
	@install -v --mode=0644 $(DOWNLOADDIR)/qt_lib_webkitwidgets_private.pri $(DESTDIR)$(qt5prefix)/mkspecs/modules/qt_lib_webkitwidgets_private.pri
	@mkdir -pv $(build_DESTDIR)$(build_qt5prefix)/mkspecs
	@install -v --mode=0644 $(DOWNLOADDIR)/qt_lib_webkit.pri $(build_DESTDIR)$(build_qt5prefix)/mkspecs/modules/qt_lib_webkit.pri
	@install -v --mode=0644 $(DOWNLOADDIR)/qt_lib_webkit_private.pri $(build_DESTDIR)$(build_qt5prefix)/mkspecs/qt_lib_webkit_private.pri
	@install -v --mode=0644 $(DOWNLOADDIR)/qt_lib_webkitwidgets.pri $(build_DESTDIR)$(build_qt5prefix)/mkspecs/modules/qt_lib_webkitwidgets.pri
	@install -v --mode=0644 $(DOWNLOADDIR)/qt_lib_webkitwidgets_private.pri $(build_DESTDIR)$(build_qt5prefix)/mkspecs/modules/qt_lib_webkitwidgets_private.pri
	@$(MAKECOOKIE)
