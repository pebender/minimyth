GARNAME = libjpeg-turbo
GARVERSION = 2.0.3
CATEGORIES = lib
MASTER_SITES = https://sourceforge.net/projects/$(GARNAME)/files/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = jpeg
jpeg_LICENSE_TEXT = $(WORKSRC)/LICENSE.md
DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS = \
	-DCMAKE_INSTALL_PREFIX="$(prefix)" \
	-DCMAKE_INSTALL_LIBDIR:PATH="$(patsubst $(prefix)/%,%,$(libdir))" \
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
	-DCMAKE_SYSTEM_PROCESSOR="$(GARCH_FAMILY)"
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	-DCMAKE_SYSTEM_NAME="Linux"
endif

include ../../gar.mk

# glibc 2.30 fails to compile with gcc 9.2.0's link time optimization enabled.
#CFLAGS   := $(filter-out -flto, $(CFLAGS))   -fno-lto
#CXXFLAGS := $(filter-out -flto, $(CXXFLAGS)) -fno-lto
#LDFLAGS  := $(filter-out -flto, $(LDFLAGS))  -fno-lto

configure-%/cmake: 
	@echo " ==> Running configure in $*"
	@rm -rf $*
	@mkdir -p $*
	@cd $* && $(CONFIGURE_ENV) cmake $(CONFIGURE_ARGS) ../$(patsubst %_build,%,$(notdir $*))
	@$(MAKECOOKIE)

post-install:
	@rm -fv $(DESTDIR)$(libdir)/libjpeg.a
	@rm -fv $(DESTDIR)$(libdir)/libturbojpeg.a
	@$(MAKECOOKIE)
