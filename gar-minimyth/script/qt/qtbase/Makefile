GARNAME = qtbase-everywhere-src
GARVERSION = 5.14.0
CATEGORIES = qt
MASTER_SITES = https://download.qt.io/archive/qt/5.14/$(GARVERSION)/submodules/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES = \
	$(DISTNAME).patch.gar
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c lang/cxx db/mariadb lib/alsa-lib lib/dbus lib/glib lib/freetype lib/fontconfig lib/libjpeg lib/libmng lib/mtdev lib/pcre2 lib/libpng lib/libtiff lib/openssl lib/zlib X11/libxkbcommon xorg/xorg
BUILDDEPS  = devel/bison devel/flex
ifneq ($(DESTIMG),build)
DEPENDS   += lib/libinput system/udev
BUILDDEPS += qt/qtbase
endif

PWD := $(shell pwd)

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	-L $(DESTDIR)$(libdir) \
	-I $(DESTDIR)$(includedir) \
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
	-platform $(PLATFORM_GARBUILD_BASE_NAME) \
	-no-rpath \
	-no-pch \
	-sysroot $(DESTDIR) \
	-gcc-sysroot \
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
	$(if $(filter build, $(DESTIMG)),-no-libudev,-libudev) \
	-evdev \
	-no-imf \
	$(if $(filter build, $(DESTIMG)),-no-libinput,-libinput) \
	-mtdev \
	-no-tslib \
	-xcb-xinput \
	-xkbcommon \
	-gif \
	-ico \
	-system-libpng \
	-system-libjpeg \
	-sql-mysql \
	-mysql_config "$(DESTDIR)$(bindir)-config/mysql_config" \
	-sql-sqlite \
	-qt-sqlite
ifeq ($(DESTIMG),build)
xBUILD_ENV = \
	LD_LIBRARY_PATH="$(PWD)/$(WORKSRC)/lib:$(LD_LIBRARY_PATH)"
else
CONFIGURE_ARGS += \
	-xplatform $(PLATFORM_GARHOST_BASE_NAME) \
	-hostprefix $(build_DESTDIR)$(build_qt5prefix) \
	-hostbindir $(build_DESTDIR)$(build_qt5bindir) \
	-hostlibdir $(build_DESTDIR)$(build_qt5libdir) \
	-hostdatadir $(build_DESTDIR)$(build_qt5prefix) \
	-device-option CROSS_COMPILE=$(compiler_prefix)
endif

GAR_EXTRA_CONF += devel/gcc/package-api.mk devel/glibc/package-api.mk
include ../../gar.mk

# qt 5.12.6 fails to compile with gcc 9.2.0's link time optimization enabled.
CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))

LDFLAGS  :=

PLATFORM_GARBUILD_BASE_NAME = $(strip \
	$(if $(filter i386,$(build_GARCH_FAMILY)),linux-g++-32,) \
	$(if $(filter x86_64,$(build_GARCH_FAMILY)),linux-g++-64,))
PLATFORM_GARHOST_BASE_NAME = $(strip \
	$(if $(filter i386,$(GARCH_FAMILY)),linux-g++-32,) \
	$(if $(filter x86_64,$(GARCH_FAMILY)),linux-g++-64,))
PLATFORM_GARBUILD_NAME      = $(PLATFORM_GARBUILD_BASE_NAME)-garbuild
PLATFORM_GARHOST_NAME       = $(PLATFORM_GARHOST_BASE_NAME)-garhost
PLATFORM_DEFAULT_NAME       = default
PLATFORM_GARBUILD_BASE_PATH = $(WORKSRC)/mkspecs/$(PLATFORM_GARBUILD_BASE_NAME)
PLATFORM_GARHOST_BASE_PATH  = $(WORKSRC)/mkspecs/$(PLATFORM_GARHOST_BASE_NAME)
PLATFORM_GARBUILD_PATH      = $(WORKSRC)/mkspecs/$(PLATFORM_GARBUILD_NAME)
PLATFORM_GARHOST_PATH       = $(WORKSRC)/mkspecs/$(PLATFORM_GARHOST_NAME)
PLATFORM_DEFAULT_PATH       = $(build_DESTDIR)$(build_qt5prefix)/mkspecs/$(PLATFORM_DEFAULT_NAME)

UPDATE_PLATFORM   = sed -i 's%^\($(strip $(2))[ \t]*$(strip $(3))=[ \t]*\).*%\1$(strip $(4))%g' $(strip $(1))/qmake.conf 
# We should not need to provide QMAKE_INCDIR or QMAKE_LIBDIR since they are compiled into the compiler and linker.
# However, the QT configure program does not find the supported libraries without them.
# We add --preserve=timestamps to QMAKE_COPY so that files installed using qmake generated make files keep their
# original dates. This keeps the dates of the MythTV themes with their original dates so that themecahes are not
# needlessly regenerated when MiniMyth is updated.
# include(../common/gcc-base-unix.conf)
# include(../common/g++-unix.conf)
CREATE_PLATFORM   = \
	rm -rf $(strip $(2)) ; \
	cp -r $(strip $(1)) $(strip $(2)) ; \
	echo "QMAKE_CFLAGS_RELEASE = $($(strip $(3))CFLAGS)"                                  >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/qmake.conf                   | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/linux.conf         | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/gcc-base-unix.conf | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/gcc-base.conf      | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/sanitize.conf      | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/g++-unix.conf      | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/g++-base.conf      | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/unix.conf          | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	echo 'load(qt_config)'                                                                >> $(strip $(2))/qmake.conf~ ; \
	rm -f $(strip $(2))/qmake.conf ; \
	mv -f $(strip $(2))/qmake.conf~ $(strip $(2))/qmake.conf ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_COPY          , , cp -f --preserve=timestamps) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_YACC          , , bison -y) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_COMPILER      , , $($(strip $(3))CC)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_CC            , , $($(strip $(3))CC)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_CXX           , , $($(strip $(3))CXX)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LINK          , , $($(strip $(3))CXX)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LINK_SHLIB    , , $($(strip $(3))CXX)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_AR            , , $($(strip $(3))AR) cqs) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_AR_LTCG       , , $($(strip $(3))AR) cqs) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_NM            , , $($(strip $(3))NM) -P) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_NM_LTCG       , , $($(strip $(3))NM) -P) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_RANLIB        , , $($(strip $(3))RANLIB)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_OBJCOPY       , , $($(strip $(3))OBJCOPY)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_STRIP         , , $($(strip $(3))STRIP)) ; \
	$(call UPDATE_PLATFORM, $(1), QMAKE_CFLAGS        , , $($(strip $(3))CFLAGS)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LFLAGS        , , $($(strip $(3))LDFLAGS)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_INCDIR        , , $($(strip $(3))DESTDIR)$($(strip $(3))includedir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LIBDIR        , , $($(strip $(4))DESTDIR)$($(strip $(3))libdir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_INCDIR_X11    , , $($(strip $(4))DESTDIR)$($(strip $(3))includedir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LIBDIR_X11    , , $($(strip $(4))DESTDIR)$($(strip $(3))libdir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_INCDIR_OPENGL , , $($(strip $(4))DESTDIR)$($(strip $(3))includedir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LIBDIR_OPENGL , , $($(strip $(4))DESTDIR)$($(strip $(3))libdir)) ; \

pre-configure:
	$(call CREATE_PLATFORM, $(PLATFORM_GARBUILD_BASE_PATH), $(PLATFORM_GARBUILD_PATH), build_)
	$(call CREATE_PLATFORM, $(PLATFORM_GARHOST_BASE_PATH) , $(PLATFORM_GARHOST_PATH) ,       )
	@$(MAKECOOKIE)

x-configure-%/configure:
	@cd $* && $(CONFIGURE_ENV) /configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

pre-install:
	@rm -rf $(DESTDIR)$(qt5prefix)
	@$(MAKECOOKIE)

post-install:
	@rm -fv $(DESTDIR)$(qt5libdir)/*.la
	@rm -fv $(PLATFORM_DEFAULT_PATH)
	@ln -sfv $(PLATFORM_GARBUILD_NAME) $(PLATFORM_DEFAULT_PATH)
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