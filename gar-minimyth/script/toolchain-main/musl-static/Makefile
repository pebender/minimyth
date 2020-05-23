GARNAME = musl
GARVERSION = $(MUSL_VERSION)
CATEGORIES = toolchain-main
SOURCEPKG = toolchain/musl
LICENSE = MIT

DESCRIPTION =
define BLURB
endef

ifndef ($(DESTIMG),build)
DEPENDS = lang/c build-tool/make \
	toolchain-main/linux-headers
endif

ifndef ($(DESTIMG),build)
CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile
endif

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

GAR_EXTRA_CONF += toolchain-main/toolchain-main/toolchain.mk
GAR_EXTRA_CONF += toolchain/musl/package-api.mk
include ../../gar.mk
