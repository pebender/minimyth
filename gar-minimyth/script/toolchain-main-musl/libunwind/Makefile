GARNAME = libunwind
GARVERSION = $(LLVM_VERSION)
CATEGORIES = toolchain-main-musl
SOURCEPKG = toolchain/llvm
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.TXT

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	toolchain-main-musl/glibc \
	toolchain-main-musl/compiler-rt-builtins

ifndef ($(DESTIMG),build)
CONFIGURE_SCRIPTS = $(WORKSRC)/cmake
BUILD_SCRIPTS = $(WORKSRC)/cmake
INSTALL_SCRIPTS = $(WORKSRC)/cmake
endif

CONFIGURE_ARGS = $(LLVM_CONFIGURE_ARGS) \
	-DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY \
	-DLLVM_CONFIG_PATH="$(build_DESTDIR)/$(build_bindir)/config/llvm-config" \
	-DLIBUNWIND_INSTALL_PREFIX="$(DESTDIR)$(prefix)/" \
	-DLIBUNWIND_SYSROOT="$(DESTDIR)" \
	-DLIBUNWIND_ENABLE_THREADS=ON \
	-DLIBUNWIND_USE_COMPILER_RT=ON \
	-DLIBUNWIND_TARGET_TRIPLE=$(GARHOST)

GAR_EXTRA_CONF += toolchain-main-musl/toolchain-main-musl/toolchain-clang.mk
GAR_EXTRA_CONF += devel/cmake/package-api.mk
GAR_EXTRA_CONF += toolchain/llvm/package-api.mk
include ../../gar.mk
