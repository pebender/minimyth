GARNAME = libcxx
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
	toolchain-main/libunwind
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
	-DLIBCXX_ENABLE_EXPERIMENTAL_LIBRARY=OFF \
	-DLIBCXX_CXX_ABI="none" \
	-DLIBCXX_USE_COMPILER_RT=ON \
	-DLIBCXX_INCLUDE_BENCHMARKS=OFF
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	-DxLIBCXX_HAS_MUSL_LIBC=ON
endif

build_CPPFLAGS = \
	-idirafter /usr/include
main_CPPFLAGS =

GAR_EXTRA_CONF += toolchain-main/toolchain-main/toolchain-clang.mk
GAR_EXTRA_CONF += devel/cmake/package-api.mk
GAR_EXTRA_CONF += toolchain/llvm/package-api.mk
include ../../gar.mk
