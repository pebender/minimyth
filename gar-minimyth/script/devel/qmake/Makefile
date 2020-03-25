GARNAME = qtbase-everywhere-src
GARVERSION = $(QT5_VERSION)
CATEGORIES = devel
SOURCEPKG = qt/qtbase
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

ifeq ($(DESTIMG),build)
DEPENDS    = lang/c lang/cxx build-tool/make xorg/libdrm xorg/libxcb X11/libxkbcommon
BUILDDEPS  = perl/perl devel/bison devel/flex
else
DEPENDS    =
BUILDDEPS  = devel/qmake
endif

CONFIGURE_SCRIPTS = platform-mkspec
ifeq ($(DESTIMG),build)
CONFIGURE_SCRIPTS = platform-mkspec $(WORKSRC)/configure
INSTALL_SCRIPTS = qmake mkspecs default-mkspec
endif

CONFIGURE_ARGS = \
	-L $(DESTDIR)$(libdir) \
	-I $(DESTDIR)$(includedir) \
	-verbose \
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
	-shared \
	-no-strip \
	-platform minimyth-build \
	-no-rpath \
	-no-pch \
	-no-compile-examples \
	-no-gui \
	-no-widgets \
	-no-dbus \
	-nomake tools \
	-nomake examples \
	-accessibility \
	-qt-doubleconversion \
	-no-glib \
	-no-eventfd \
	-no-inotify \
	-no-iconv \
	-no-icu \
	-no-pcre \
	-qt-zlib \
	-no-journald \
	-no-syslog \
	-no-slog2 \
	-no-ssl \
	-no-openssl \
	-no-sctp \
	-no-libproxy \
	-no-system-proxies \
	-no-cups \
	-no-fontconfig \
	-no-freetype \
	-no-harfbuzz \
	-no-gtk \
	-no-opengl \
	-no-opengles3 \
	-no-egl \
	-no-xcb-xlib \
	-no-directfb \
	-no-eglfs \
	-no-gbm \
	-no-kms \
	-no-linuxfb \
	-qt-xcb \
	-no-libudev \
	-no-evdev \
	-no-libinput \
	-no-mtdev \
	-no-tslib \
	-no-xcb-xinput \
	-xkbcommon \
	-no-gif \
	-no-ico \
	-no-libpng \
	-no-libjpeg \
	-no-sql-mysql \
	-no-sql-sqlite

GAR_EXTRA_CONF += qt/qtbase/package-api.mk
include ../../gar.mk

# qt 5.14.0 fails to compile with gcc 9.2.0's link time optimization enabled.
#CFLAGS   := $(filter-out -flto, $(CFLAGS))
#CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))

#LDFLAGS  :=

MKSPECS_BUILD_DIR   = $(WORKSRC)/mkspecs
MKSPECS_INSTALL_DIR = $(build_DESTDIR)$(build_qt5libdir)/mkspecs

UPDATE_PLATFORM = sed -e 's%^\($(strip $(1))[ \t]*$(strip $(2))=[ \t]*\).*%\1$(strip $(3))%g' -i $(MKSPECS_BUILD_DIR)/minimyth-$(DESTIMG)/qmake.conf~
# We should not need to provide QMAKE_INCDIR or QMAKE_LIBDIR since they are compiled into the compiler and linker.
# However, the QT configure program does not find the supported libraries without them.
# We add --preserve=timestamps to QMAKE_COPY so that files installed using qmake generated make files keep their
# original dates. This keeps the dates of the MythTV themes with their original dates so that themecahes are not
# needlessly regenerated when MiniMyth is updated.
configure-platform-mkspec:
	mkdir -pv $(MKSPECS_BUILD_DIR)
	rm -rfv $(MKSPECS_BUILD_DIR)/minimyth-$(DESTIMG)
	$(if $(filter i386,$(GARCH_FAMILY)),cd $(MKSPECS_BUILD_DIR) && cp -rfv linux-g++-32 minimyth-$(DESTIMG),)
	$(if $(filter x86_64,$(GARCH_FAMILY)),cd $(MKSPECS_BUILD_DIR) && cp -rfv linux-g++-64 minimyth-$(DESTIMG),)
	cd $(MKSPECS_BUILD_DIR)/minimyth-$(DESTIMG) && echo "QMAKE_CFLAGS_RELEASE = $(CFLAGS)"                                 >> qmake.conf~
	cd $(MKSPECS_BUILD_DIR)/minimyth-$(DESTIMG) && cat qmake.conf                   | grep -v '^include' | grep -v '^load' >> qmake.conf~
	cd $(MKSPECS_BUILD_DIR)/minimyth-$(DESTIMG) && cat ../common/linux.conf         | grep -v '^include' | grep -v '^load' >> qmake.conf~
	cd $(MKSPECS_BUILD_DIR)/minimyth-$(DESTIMG) && cat ../common/gcc-base-unix.conf | grep -v '^include' | grep -v '^load' >> qmake.conf~
	cd $(MKSPECS_BUILD_DIR)/minimyth-$(DESTIMG) && cat ../common/gcc-base.conf      | grep -v '^include' | grep -v '^load' >> qmake.conf~
	cd $(MKSPECS_BUILD_DIR)/minimyth-$(DESTIMG) && cat ../common/sanitize.conf      | grep -v '^include' | grep -v '^load' >> qmake.conf~
	cd $(MKSPECS_BUILD_DIR)/minimyth-$(DESTIMG) && cat ../common/g++-unix.conf      | grep -v '^include' | grep -v '^load' >> qmake.conf~
	cd $(MKSPECS_BUILD_DIR)/minimyth-$(DESTIMG) && cat ../common/g++-base.conf      | grep -v '^include' | grep -v '^load' >> qmake.conf~
	cd $(MKSPECS_BUILD_DIR)/minimyth-$(DESTIMG) && cat ../common/unix.conf          | grep -v '^include' | grep -v '^load' >> qmake.conf~
	cd $(MKSPECS_BUILD_DIR)/minimyth-$(DESTIMG) && echo 'load(qt_config)'                                                  >> qmake.conf~
	$(call UPDATE_PLATFORM, QMAKE_COPY           , , cp -f --preserve=timestamps)
	$(call UPDATE_PLATFORM, QMAKE_YACC           , , bison -y)
	$(call UPDATE_PLATFORM, QMAKE_COMPILER       , , $(CC))
	$(call UPDATE_PLATFORM, QMAKE_CC             , , $(CC))
	$(call UPDATE_PLATFORM, QMAKE_CXX            , , $(CXX))
	$(call UPDATE_PLATFORM, QMAKE_LINK           , , $(CXX))
	$(call UPDATE_PLATFORM, QMAKE_LINK_SHLIB     , , $(CXX))
	$(call UPDATE_PLATFORM, QMAKE_CFLAGS_RELEASE ,+,)
	$(call UPDATE_PLATFORM, QMAKE_CFLAGS_RELEASE ,-,)
	$(call UPDATE_PLATFORM, QMAKE_AR             , , $(AR) cqs)
	$(call UPDATE_PLATFORM, QMAKE_AR_LTCG        , , $(AR) cqs)
	$(call UPDATE_PLATFORM, QMAKE_NM             , , $(NM) -P)
	$(call UPDATE_PLATFORM, QMAKE_NM_LTCG        , , $(NM) -P)
	$(call UPDATE_PLATFORM, QMAKE_RANLIB         , , $(RANLIB))
	$(call UPDATE_PLATFORM, QMAKE_OBJCOPY        , , $(OBJCOPY))
	$(call UPDATE_PLATFORM, QMAKE_STRIP          , , $(STRIP))
	$(call UPDATE_PLATFORM, QMAKE_CFLAGS         , , $(CFLAGS))
	$(call UPDATE_PLATFORM, QMAKE_LFLAGS         , , $(LDFLAGS))
	$(call UPDATE_PLATFORM, QMAKE_INCDIR         , , $(DESTDIR)$(includedir))
	$(call UPDATE_PLATFORM, QMAKE_LIBDIR         , , $(DESTDIR)$(libdir))
	$(call UPDATE_PLATFORM, QMAKE_INCDIR_X11     , , $(DESTDIR)$(includedir))
	$(call UPDATE_PLATFORM, QMAKE_LIBDIR_X11     , , $(DESTDIR)$(libdir))
	$(call UPDATE_PLATFORM, QMAKE_INCDIR_OPENGL  , , $(DESTDIR)$(includedir))
	$(call UPDATE_PLATFORM, QMAKE_LIBDIR_OPENGL  , , $(DESTDIR)$(libdir))
	rm -fv $(MKSPECS_BUILD_DIR)/minimyth-$(DESTIMG)/qmake.conf
	mv -fv $(MKSPECS_BUILD_DIR)/minimyth-$(DESTIMG)/qmake.conf~ $(MKSPECS_BUILD_DIR)/minimyth-$(DESTIMG)/qmake.conf
	@$(MAKECOOKIE)

$(WORKSRC)/configure: configure-platform-spec

install-qmake:
	@mkdir -pv $(MKSPECS_INSTALL_DIR)
	@rm -rfv $(MKSPECS_INSTALL_DIR)/minimyth-$(DESTIMG)
	@cp -afv $(MKSPECS_BUILD_DIR)/minimyth-$(DESTIMG) $(MKSPECS_INSTALL_DIR)/
	@$(MAKECOOKIE)

install-mkspecs:
	@echo " ==> Running make in $(WORKSRC)"
	$(BUILD_ENV) $(INSTALL_ENV) $(MAKE) $(PARALLELMFLAGS) $(foreach TTT,$(BUILD_OVERRIDE_DIRS),$(TTT)="$($(TTT))") -C $(WORKSRC) $(BUILD_ARGS) $(INSTALL_ARGS) install_mkspecs
	@$(MAKECOOKIE)

install-platform-mkspec:
	@rm -rfv $(MKSPECS_INSTALL_DIR)/minimyth-$(DESTIMG)
	@mkdir -pv $(MKSPECS_INSTALL_DIR)
	@cp -afv $(MKSPECS_BUILD_DIR)/minimyth-$(DESTIMG) $(MKSPECS_INSTALL_DIR)
	@$(MAKECOOKIE)

install-default-mkspec:
	@rm -fv $(MKSPECS_INSTALL_DIR)/default
	@ln -sfv minimyth-$(DESTIMG) $(MKSPECS_INSTALL_DIR)/default
	@$(MAKECOOKIE)
