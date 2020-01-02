GARNAME = LibVNCServer
GARVERSION = 0.9.12
CATEGORIES = X11
MASTER_SITES = https://github.com/LibVNC/libvncserver/archive/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c xorg/xorg lib/libjpeg lib/libpng lib/openssl lib/zlib

WORKSRC = $(WORKDIR)/libvncserver-$(DISTNAME)
WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS = \
	-DCMAKE_INSTALL_PREFIX="$(prefix)" \
	-DCMAKE_FIND_ROOT_PATH="$(DESTDIR)$(prefix)" \
	-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="NEVER" \
	-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="ONLY" \
	-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="ONLY" \
	-DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE="ONLY" \
	-DCMAKE_C_COMPILER="$(build_DESTDIR)$(build_bindir)/$(CC)" \
	-DCMAKE_CXX_COMPILER="$(build_DESTDIR)$(build_bindir)/$(CXX)" \
	-DCMAKE_AR="$(build_DESTDIR)$(build_bindir)/$(AR)" \
	-DCMAKE_LINKER="$(build_DESTDIR)$(build_bindir)/$(LD)" \
	-DCMAKE_NM="$(build_DESTDIR)$(build_bindir)/$(NM)" \
	-DCMAKE_OBJCOPY="$(build_DESTDIR)$(build_bindir)/$(OBJCOPY)" \
	-DCMAKE_OBJDUMP="$(build_DESTDIR)$(build_bindir)/$(OBJDUMP)" \
	-DCMAKE_RANLIB="$(build_DESTDIR)$(build_bindir)/$(RANLIB)" \
	-DCMAKE_STRIP="$(build_DESTDIR)$(build_bindir)/$(STRIP)" \
	-DCMAKE_VERBOSE_MAKEFILE="1" \
	-DCMAKE_SYSTEM_PROCESSOR="$(GARCH_FAMILY)" \
	-DBUILD_SHARED_LIBS="1" \
	-DWITH_ZLIB="1" \
	-DWITH_LZO="0" \
	-DWITH_JPEG="1" \
	-DWITH_PNG="1" \
	-DWITH_SDL="0" \
	-DWITH_THREADS="0" \
	-DWITH_GNUTLS="0" \
	-DWITH_OPENSSL="1" \
	-DWITH_SYSTEMD="0" \
	-DWITH_GCRYPT="0" \
	-DWITH_FFMPEG="0" \
	-DWITH_TIGHTVNC_FILETRANSFER="1" \
	-DWITH_24BPP="1" \
	-DWITH_IPv6="0" \
	-DWITH_WEBSOCKETS="0" \
	-DWITH_SASL="0"
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	-DCMAKE_SYSTEM_NAME="Linux"
endif

include ../../gar.mk

configure-%/cmake: 
	@echo " ==> Running configure in $*"
	@rm -rf $*
	@mkdir -p $*
	@cd $* && $(CONFIGURE_ENV) cmake $(CONFIGURE_ARGS) ../$(patsubst %_build,%,$(notdir $*))
	@$(MAKECOOKIE)
