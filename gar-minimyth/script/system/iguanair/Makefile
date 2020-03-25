GARNAME = iguanaIR
GARVERSION = 1.1.0
CATEGORIES = system
MASTER_SITES = http://iguanaworks.net/downloads/
DISTFILES = $(DISTNAME).tar.bz2
xPATCHFILES = \
	$(DISTNAME)-udev.patch \
	$(DISTNAME)-dash.patch \
	$(DISTNAME)-cflags.patch \
	$(DISTNAME)-fwhole_program.patch
LICENSE = GPL2/LGPL2_1

build_DESTDIR = $(build_DESTDIR_swapped)
build_rootdir = $(build_rootdir_swapped)

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c build-tool/cmake lib/libusb-compat lib/libargp
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/cmake
BUILD_SCRIPTS = $(WORKSRC)/cmake
INSTALL_SCRIPTS = $(WORKSRC)/cmake

CONFIGURE_ARGS = \
	-DCMAKE_BUILD_TYPE=RELEASE \
	-DCMAKE_VERBOSE_MAKEFILE=ON \
	-DCMAKE_SYSROOT="$(DESTDIR)" \
	-DCMAKE_INSTALL_PREFIX="$(prefix)" \
	-DCMAKE_STAGING_PREFIX="$(DESTDIR)$(prefix)" \
	-DCMAKE_C_COMPILER="$(CC)" \
	-DCMAKE_C_COMPILER_TARGET="$(GARHOST)" \
	-DCMAKE_LINKER="$(LD)" \
	-DCMAKE_C_FLAGS="$(CFLAGS)" \
	-DCMAKE_EXE_LINKER_FLAGS="$(LDFLAGS)" \
	-DCMAKE_SHARED_LINKER_FLAGS="$(LDFLAGS)" \
	-DCMAKE_AR="$(AR)" \
	-DCMAKE_NM="$(NM)" \
	-DCMAKE_OBJCOPY="$(OBJCOPY)" \
	-DCMAKE_OBJDUMP="$(OBJDUMP)" \
	-DCMAKE_RANLIB="$(RANLIB)" \
	-DCMAKE_STRIP="$(STRIP)"

GAR_EXTRA_CONF += devel/cmake/package-api.mk
include ../../gar.mk
