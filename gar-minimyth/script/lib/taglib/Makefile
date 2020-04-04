GARNAME = taglib
GARVERSION = 1.11.1
CATEGORIES = lib
MASTER_SITES = https://taglib.org/releases/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME).patch.gar
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/cxx lib/zlib

ifeq ($(DESTIMG),build)
build_DESTDIR = $(build_DESTDIR_swapped)
build_rootdir = $(build_rootdir_swapped)
DESTIDR = $(build_DESTDIR_swapped)
rootdir = $(build_rootdir_swapped)
endif

CONFIGURE_SCRIPTS = $(WORKSRC)/cmake
BUILD_SCRIPTS = $(WORKSRC)/cmake
INSTALL_SCRIPTS = $(WORKSRC)/cmake

CONFIGURE_ARGS = \
	-DCMAKE_BUILD_TYPE=RELEASE \
	-DCMAKE_VERBOSE_MAKEFILE=ON \
	-DCMAKE_SYSROOT="$(DESTDIR)" \
	-DCMAKE_INSTALL_PREFIX="$(DESTDIR)$(prefix)" \
	-DCMAKE_C_COMPILER="$(CC)" \
	-DCMAKE_CXX_COMPILER="$(CXX)" \
	-DCMAKE_C_COMPILER_TARGET="$(GARHOST)" \
	-DCMAKE_CXX_COMPILER_TARGET="$(GARHOST)" \
	-DCMAKE_LINKER="$(LD)" \
	-DCMAKE_C_FLAGS="$(CFLAGS)" \
	-DCMAKE_CXX_FLAGS="$(CXXFLAGS)" \
	-DCMAKE_EXE_LINKER_FLAGS="$(LDFLAGS)" \
	-DCMAKE_SHARED_LINKER_FLAGS="$(LDFLAGS)" \
	-DCMAKE_AR="$(AR)" \
	-DCMAKE_NM="$(NM)" \
	-DCMAKE_OBJCOPY="$(OBJCOPY)" \
	-DCMAKE_OBJDUMP="$(OBJDUMP)" \
	-DCMAKE_RANLIB="$(RANLIB)" \
	-DCMAKE_STRIP="$(STRIP)" \
	-DBUILD_SHARED_LIBS=ON \
	-DBUILD_TESTS=OFF \
	-DBUILD_EXAMPLES=OFF \
	-DNO_ITUNES_HACKS=OFF \
	-DWITH_ASF=ON \
	-DWITH_MP4=ON

GAR_EXTRA_CONF += devel/cmake/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(bindir)/config/taglib-config
	@rm -f $(DESTDIR)$(bindir)/config/$(GARHOST)-taglib-config
	@mkdir -p $(DESTDIR)$(bindir)/config
	@mv $(DESTDIR)$(bindir)/taglib-config $(DESTDIR)$(bindir)/config/taglib-config
	@ln -s taglib-config $(DESTDIR)$(bindir)/config/$(GARHOST)-taglib-config
	@$(MAKECOOKIE)
