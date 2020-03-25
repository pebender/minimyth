GARNAME = musl
GARVERSION = $(MUSL_VERSION)
CATEGORIES = lang
SOURCEPKG = lang/musl
LICENSE = MIT

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c build-tool/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = --build=$(GARBUILD) --host=$(GARHOST) \
	--prefix=$(prefix) \
	--exec-prefix=$(exec_prefix) \
	--bindir=$(bindir) \
	--libdir=$(libdir) \
	--includedir=$(includedir) \
	--syslibdir=$(elibdir) \
	--disable-shared \
	--enable-static \
	CC="$(CC)" \
	CFLAGS="$(CFLAGS)" \
	CROSS_COMPILE="$(GARHOST)-"

GAR_EXTRA_CONF += clang-target/clang-target/toolchain.mk
GAR_EXTRA_CONF += lang/musl/package-api.mk
include ../../gar.mk
