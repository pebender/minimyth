GARNAME = libcxx
GARVERSION = $(LLVM_VERSION)
CATEGORIES = toolchain-main-musl
SOURCEPKG = toolchain/llvm
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.TXT

DESCRIPTION = 
define BLURB
endef

ifneq ($(DESTIMG),build)
DEPENDS = \
	toolchain-main-musl/musl \
	toolchain-main-musl/libunwind \
	toolchain-main-musl/libcxxabi
endif

ifneq ($(DESTIMG),build)
CONFIGURE_SCRIPTS = $(WORKSRC)/cmake
BUILD_SCRIPTS = $(WORKSRC)/cmake
INSTALL_SCRIPTS = $(WORKSRC)/cmake libcxx_so
endif

CONFIGURE_ARGS = $(LLVM_CONFIGURE_ARGS) \
	-DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY \
	-DLIBCXX_ENABLE_EXPERIMENTAL_LIBRARY=OFF \
	-DLIBCXX_CXX_ABI="libcxxabi" \
	-DLIBCXX_CXX_ABI_INCLUDE_PATHS="$(PWD)/../libcxxabi/$(WORKDIR)/llvm-project-$(LLVM_VERSION)/libcxxabi/include" \
	-DLIBCXX_USE_COMPILER_RT=ON \
	-DLIBCXXABI_USE_LLVM_UNWINDER=ON \
	-DLIBCXX_INCLUDE_BENCHMARKS=OFF
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	-DxLIBCXX_HAS_MUSL_LIBC=ON
endif

GAR_EXTRA_CONF += toolchain-main-musl/toolchain-main-musl/toolchain-clang.mk
GAR_EXTRA_CONF += devel/cmake/package-api.mk
GAR_EXTRA_CONF += toolchain/llvm/package-api.mk
include ../../gar.mk

PWD := `pwd`

install-libcxx_so:
	@rm -fv $(DESTDIR)$(libdir)/libc++.so
	@install -v --mode=644 $(WORKSRC)_build/lib/libc++.so $(DESTDIR)$(libdir)
	@$(MAKECOOKIE)
