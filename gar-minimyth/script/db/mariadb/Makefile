GARNAME = mariadb
GARVERSION = 10.4.13
CATEGORIES = db
MASTER_SITES = https://downloads.mariadb.org/interstitial/$(DISTNAME)/source/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-mysql_config.patch.gar $(DISTNAME)-my_global_h.patch $(DISTNAME)-musl.patch
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx build-tool/cmake lib/libaio lib/ncursesw lib/openssl lib/pcre2 lib/readline lib/zlib
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
	-DCAT_EXECUTABLE="$(build_DESTDIR)$(build_bindir)/cat" \
	-DTAR_EXECUTABLE="$(build_DESTDIR)$(build_bindir)/tar" \
	-DUNAME_EXECUTABLE="$(build_DESTDIR)$(build_bindir)/uname" \
	-DPLUGIN_MROONGA=NO \
	-DPLUGIN_ROCKSDB=NO \

bogus = \
	-DWITHOUT_SERVER=ON \
	-DSECURITY_HARDENED=OFF \
	-DCONNECT_WITH_MYSQL=ON \
	-DCONNECT_WITH_LIBXML2=system \
	-DCONNECT_WITH_ODBC=NO \
	-DCONNECT_WITH_JDBC=NO \
	-DPLUGIN_ARCHIVE=NO \
	-DPLUGIN_ARIA=NO \
	-DPLUGIN_BLACKHOLE=NO \
	-DPLUGIN_CASSANDRA=NO \
	-DPLUGIN_CSV=NO \
	-DPLUGIN_MYISAM=NO \
	-DPLUGIN_OQGRAPH=NO \
	-DPLUGIN_PARTITION=NO \
	-DPLUGIN_ROCKSDB=NO \
	-DPLUGIN_SPHINX=NO \
	-DPLUGIN_TOKUDB=NO \
	-DPLUGIN_AUTH_GSSAPI=NO \
	-DPLUGIN_AUTH_GSSAPI_CLIENT=OFF \
	-DPLUGIN_CRACKLIB_PASSWORD_CHECK=OFF \
	-DWITH_ASAN=OFF \
	-DWITH_EMBEDDED_SERVER=OFF \
	-DWITH_EXTRA_CHARSETS=complex \
	-DWITH_INNODB_BZIP2=OFF \
	-DWITH_INNODB_LZ4=OFF \
	-DWITH_INNODB_LZMA=ON \
	-DWITH_INNODB_LZO=OFF \
	-DWITH_INNODB_SNAPPY=OFF \
	-DWITH_ROCKSDB_BZIP2=OFF \
	-DWITH_ROCKSDB_JEMALLOC=OFF \
	-DWITH_ROCKSDB_LZ4=OFF \
	-DWITH_ROCKSDB_ZSTD=OFF \
	-DWITH_ROCKSDB_SNAPPY=OFF \
	-DWITH_JEMALLOC=OFF \
	-DWITH_LIBARCHIVE=system \
	-DWITH_LIBNUMA=OFF \
	-DWITH_LIBWRAP=OFF \
	-DWITH_LIBWSEP=OFF \
	-DWITH_MARIABACKUP=OFF \
	-DWITH_PCRE=system \
	-DWITH_READLINE=NO \
	-DWITH_SYSTEMD=no \
	-DWITH_SSL=system \
	-DWITH_VALGRIND=OFF \
	-DWITH_ZLIB=system \
	-DSECURITY_HARDENED=OFF \
	-DSKIP_TESTS=ON \
	-DWITH_JEMALLOC=NO \
	-DWITHOUT_TOKUDB=ON
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	-DCMAKE_SYSTEM_NAME="Linux" \
	-DSTACK_DIRECTION="-1" \
	-DIMPORT_EXECUTABLES="$(PWD)/work/build.d/$(DISTNAME)_build/import_executables.cmake"
endif

GAR_EXTRA_CONF += devel/cmake/package-api.mk
include ../../gar.mk

PWD := $(shell pwd)

post-install:
	@$(call GLIBC_ADD_LIB_PATH, $(libdir)/mysql)
	@rm -f $(DESTDIR)$(libdir)/mysql/libmysqlclient.a
	@rm -f $(DESTDIR)$(libdir)/mysql/libmysqlclient_r.a
	@rm -f $(DESTDIR)$(libdir)/mysql/libmysqlservices.a
	@rm -f $(DESTDIR)$(bindir)/config.d/mysql_config
	@rm -f $(DESTDIR)$(bindir)/config.d/$(GARHOST)-mysql_config
	@mkdir -p $(DESTDIR)$(bindir)/config.d
	@mv $(DESTDIR)$(bindir)/mysql_config $(DESTDIR)$(bindir)/config.d/mysql_config
	@ln -s mysql_config $(DESTDIR)$(bindir)/config.d/$(GARHOST)-mysql_config
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
