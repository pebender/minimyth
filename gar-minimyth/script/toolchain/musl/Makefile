GARNAME = musl
GARVERSION = $(MUSL_VERSION)
CATEGORIES = toolchain
MASTER_SITES = https://www.musl-libc.org/releases/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-symlink.patch
LICENSE = MIT

DESCRIPTION =
define BLURB
endef

ifndef ($(DESTIMG),build)
DEPENDS =
BUILDDEPS =
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
	--enable-shared \
	--enable-static \
	CC="$(CC)" \
	CFLAGS="$(CFLAGS)" \
	CROSS_COMPILE="$(GARHOST)-" \
	LIBCC="$(DESTDIR)$(libdir)/libc.a"

GAR_EXTRA_CONF += toolchain/llvm/package-api.mk
include ../../gar.mk

# libc requires explicit linking with libclang_rt.builtins for math builtins.
LDFLAGS_AS_NEEDED = -Wl,--as-needed
LDFLAGS := $(filter-out $(LDFLAGS_AS_NEEDED), $(LDFLAGS))
LDFLAGS += $(if $(filter i386,$(GARCH_FAMILY)),-L$(build_DESTDIR)$(build_libdir)/clang/$(LLVM_VERSION)/lib/linux -lclang_rt.builtins-i386)
LDFLAGS += $(if $(filter x86_64,$(GARCH_FAMILY)),-L$(build_DESTDIR)$(build_libdir)/clang/$(LLVM_VERSION)/lib/linux -lclang_rt.builtins-x86_64)
