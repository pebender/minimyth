GARNAME = freeglut
GARVERSION = 3.2.1
CATEGORIES = xorg
MASTER_SITES = https://sourceforge.net/projects/freeglut/files/freeglut/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	xorg/libX11 \
	xorg/libXext \
	xorg/libXi \
	xorg/libXxf86vm \
	xorg/glu \
	xorg/Mesa

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS  = $(WORKBLD)/cmake
BUILD_SCRIPTS      = $(WORKBLD)/Makefile
INSTALL_SCRIPTS    = $(WORKBLD)/Makefile

CONFIGURE_ARGS  = \
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
	-DCMAKE_INSTALL_PREFIX="$(prefix)" \
	-DCMAKE_STAGING_PREFIX="$(DESTDIR)$(prefix)" \
	-DCMAKE_INSTALL_LIBDIR="lib" \
	-DCMAKE_VERBOSE_MAKEFILE="ON" \
	\
	-DFREEGLUT_BUILD_SHARED_LIBS="ON" \
	-DFREEGLUT_BUILD_STATIC_LIBS="OFF"
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	-DCMAKE_SYSTEM_NAME="Linux"
endif
INSTALL_ARGS    = \
	DESTDIR=""

include ../../gar.mk

configure-%/cmake: 
	@echo " ==> Running configure in $*"
	@rm -rf $*
	@mkdir -p $*
	@cd $* && $(CONFIGURE_ENV) cmake $(CONFIGURE_ARGS) ../$(DISTNAME)
	@$(MAKECOOKIE)
