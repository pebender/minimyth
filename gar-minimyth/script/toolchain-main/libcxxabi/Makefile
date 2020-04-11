GARNAME = libcxxabi
GARVERSION = $(LLVM_VERSION)
CATEGORIES = toolchain-main
SOURCEPKG = toolchain/llvm
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.TXT

DESCRIPTION = 
define BLURB
endef

ifneq ($(DESTIMG),build)
DEPENDS = \
	toolchain-main/glibc \
	toolchain-main/libunwind \
	toolchain-main/libcxx-without-cxxabi
BUILDDEPS = \
	toolchain-build/toolchain-build
endif

ifneq ($(DESTIMG),build)
CONFIGURE_SCRIPTS = $(WORKSRC)/cmake
BUILD_SCRIPTS = $(WORKSRC)/cmake
INSTALL_SCRIPTS = $(WORKSRC)/cmake
endif

CONFIGURE_ARGS = $(LLVM_CONFIGURE_ARGS) \
	-DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY \
	-DLIBCXXABI_USE_COMPILER_RT=ON \
	-DLIBCXXABI_USE_LLVM_UNWINDER=ON \
	-DLIBCXXABI_LIBCXX_INCLUDES="$(DESTDIR)$(includedir)/c++/v1" \
	-DLIBCXXABI_LIBUNWIND_INCLUDES="$(DESTDIR)$(includedir)" \
	-DLIBCXXABI_HAS_CXA_THREAD_ATEXIT_IMPL=OFF

GAR_EXTRA_CONF += toolchain-main/toolchain-main/toolchain-clang.mk
GAR_EXTRA_CONF += devel/cmake/package-api.mk
GAR_EXTRA_CONF += toolchain/llvm/package-api.mk
include ../../gar.mk

CFLAGS += -fPIC
CXXFLAGS += -fPIC
LDFLAGS += -fPIC
