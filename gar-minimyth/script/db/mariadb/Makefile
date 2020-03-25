GARNAME = mariadb
GARVERSION = 10.4.12
CATEGORIES = db
MASTER_SITES = https://downloads.mariadb.org/interstitial/$(DISTNAME)/source/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-my_global_h.patch
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx build-tool/cmake lib/ncursesw lib/openssl lib/readline lib/zlib
BUILDDEPS = utils/procps
ifneq ($(DESTIMG),build)
BUILDDEPS += db/mariadb
endif

CONFIGURE_SCRIPTS  = $(WORKSRC)/cmake
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
	-DWITHOUT_SERVER=ON \
	-DDISABLE_LIBMYSQLCLIENT_SYMBOL_VERSIONING=ON
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	-DCMAKE_SYSTEM_NAME="Linux" \
	-DSTACK_DIRECTION="-1" \
	-DIMPORT_EXECUTABLES="$(PWD)/build.d/$(DISTNAME)_build/import_executables.cmake"
endif

GAR_EXTRA_CONF += devel/cmake/package-api.mk
GAR_EXTRA_CONF += devel/glibc/package-api.mk
include ../../gar.mk

PWD := $(shell pwd)

post-install:
	@$(call GLIBC_ADD_LIB_PATH, $(libdir)/mysql)
	@rm -f $(DESTDIR)$(libdir)/mysql/libmysqlclient.a
	@rm -f $(DESTDIR)$(libdir)/mysql/libmysqlclient_r.a
	@rm -f $(DESTDIR)$(libdir)/mysql/libmysqlservices.a
	@rm -f $(DESTDIR)$(bindir)/config/mysql_config
	@rm -f $(DESTDIR)$(bindir)/config/$(GARHOST)-mysql_config
	@mkdir -p $(DESTDIR)$(bindir)/config
	@mv $(DESTDIR)$(bindir)/mysql_config $(DESTDIR)$(bindir)/config/mysql_config
	@ln -s mysql_config $(DESTDIR)$(bindir)/config/$(GARHOST)-mysql_config
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
	@rm -rf $(build_DESTDIR)$(build_bindir)/mysql*
	@rm -rf $(build_DESTDIR)$(build_datadir)/mysql
	@rm -rf $(build_DESTDIR)$(build_includedir)/mysql
	@rm -rf $(build_DESTDIR)$(build_libdir)/mysql
	@rm -rf $(build_DESTDIR)$(build_mandir)/man1/mysql*
	@rm -rf $(DESTDIR)$(bindir)/mysql*
	@rm -rf $(DESTDIR)$(datadir)/mysql
	@rm -rf $(DESTDIR)$(includedir)/mysql
	@rm -rf $(DESTDIR)$(libdir)/mysql
	@rm -rf $(DESTDIR)$(mandir)/man1/mysql*
