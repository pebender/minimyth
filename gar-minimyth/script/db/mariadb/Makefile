GARNAME = mariadb
GARVERSION = 10.0.38
CATEGORIES = db
MASTER_SITES = https://downloads.mariadb.org/interstitial/$(DISTNAME)/source/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c lang/cxx lib/ncursesw lib/openssl lib/readline lib/zlib
BUILDDEPS  = utils/procps
ifneq ($(DESTIMG),build)
BUILDDEPS += db/mariadb
endif

PWD := $(shell pwd)

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
	-DCMAKE_INSTALL_PREFIX="$(DESTDIR)" \
	-DCMAKE_STAGING_PREFIX="$(DESTDIR)" \
	-DCMAKE_VERBOSE_MAKEFILE="ON" \
	-DINSTALL_BINDIR="$(bindir)" \
	-DINSTALL_DOCDIR="$(docdir)/mysql" \
	-DINSTALL_DOCREADMEDIR="$(docdir)/mysql" \
	-DINSTALL_INCLUDEDIR="$(includedir)/mysql" \
	-DINSTALL_INFODIR="$(infodir)" \
	-DINSTALL_LIBDIR="$(libdir)/mysql" \
	-DINSTALL_MANDIR="$(mandir)" \
	-DINSTALL_MYSQLDATADIR="$(prefix)/data/mysql" \
	-DINSTALL_MYSQLSHAREDIR="$(sharedstatedir)/mysql" \
	-DINSTALL_MYSQLTESTDIR="" \
	-DINSTALL_PLUGINDIR="$(libdir)/mysql/plugin" \
	-DINSTALL_SBINDIR="$(sbindir)" \
	-DINSTALL_SCRIPTDIR="$(libdir)/mysql" \
	-DINSTALL_SHAREDIR="$(sharedstatedir)/mysql" \
	-DINSTALL_SUPPORTFILESDIR="$(prefix)/support-files" \
	-DINSTALL_SYSCONFDIR="$(sysconfdir)" \
	-DINSTALL_UNIX_ADDRDIR="$(localstatedir)/lib/mysql/mysql.sock" \
	-DWITHOUT_SERVER="ON" \
	-DDISABLE_LIBMYSQLCLIENT_SYMBOL_VERSIONING="ON"
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	-DCMAKE_SYSTEM_NAME="Linux" \
	-DSTACK_DIRECTION="-1" \
	-DIMPORT_EXECUTABLES="$(IMPORT_EXECUTABLES)"
endif

GAR_EXTRA_CONF += devel/glibc/package-api.mk
include ../../gar.mk

IMPORT_EXECUTABLES := "$(PWD)/$(WORKROOTDIR)/build.d/$(DISTNAME)_build/import_executables.cmake"

configure-%/cmake: 
	@echo " ==> Running configure in $*"
	@rm -rf $*
	@mkdir -p $*
	@cd $* && $(CONFIGURE_ENV) cmake $(CONFIGURE_ARGS) ../$(DISTNAME)
	@$(MAKECOOKIE)

post-install:
	@$(call GLIBC_ADD_LIB_PATH, $(libdir)/mysql)
	@rm -f $(DESTDIR)$(libdir)/mysql/libmysqlclient.a
	@rm -f $(DESTDIR)$(libdir)/mysql/libmysqlclient_r.a
	@rm -f $(DESTDIR)$(libdir)/mysql/libmysqlservices.a
	@rm -f $(DESTDIR)$(bindir)-config/mysql_config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)mysql_config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/mysql_config $(DESTDIR)$(bindir)-config/mysql_config
	@$(if $(compiler_prefix), ln -s mysql_config $(DESTDIR)$(bindir)-config/$(compiler_prefix)mysql_config)
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
