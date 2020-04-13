GARNAME = visualboyadvance-m
GARVERSION = 20200412-9e03af8
CATEGORIES = emulators
MASTER_SITES = git://github.com/visualboyadvance-m/visualboyadvance-m.git/
#https://github.com/visualboyadvance-m/visualboyadvance-m/archive/
DISTFILES = $(DISTNAME).tar.bz2
#PATCHFILES = \
	$(DISTNAME)-libpng_1.5.patch \
	$(DISTNAME)-zlib_1.2.6.patch \
	$(DISTNAME)-configure.patch \
	$(DISTNAME)-strrchr.patch \
	$(DISTNAME)-x86_64.patch \
	$(DISTNAME)-cheats_cpp.patch \
	$(DISTNAME)-debugger.patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx build-tool/cmake lib/libpng lib/SDL lib/zlib xorg/xorg
BUILDDEPS = devel/nasm

CONFIGURE_SCRIPTS = $(WORKSRC)/cmake
BUILD_SCRIPTS = $(WORKSRC)/cmake
INSTALL_SCRIPTS = $(WORKSRC)/cmake

CONFIGURE_ARGS  = \
	-DCMAKE_BUILD_TYPE=RELEASE \
	-DCMAKE_VERBOSE_MAKEFILE=ON \
	-DCMAKE_SYSROOT="$(DESTDIR)" \
	-DCMAKE_INSTALL_PREFIX="$(prefix)" \
	-DCMAKE_STAGING_PREFIX="$(DESTDIR)$(prefix)" \
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
	\
	-DENABLE_SDL=ON \
	-DENABLE_WX=OFF
ifneq ($(DESTIMG),build)
LLVM_CONFIGURE_ARGS += \
	-DCMAKE_CROSSCOMPILING=ON \
	-DCMAKE_SYSTEM_NAME="Linux"
endif

GAR_EXTRA_CONF += devel/cmake/package-api.mk
include ../../gar.mk

git//%/$(DISTNAME).tar.bz2:
	$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)
