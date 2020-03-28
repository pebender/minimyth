GARNAME = llvm
GARVERSION = $(LLVM_VERSION)
CATEGORIES = llvm
MASTER_SITES = https://www.llvm.org/releases/$(GARVERSION)/
MASTER_SITES += https://github.com/llvm/llvm-project/releases/download/llvmorg-$(GARVERSION)/
DISTFILES += llvm-$(GARVERSION).src.tar.xz
DISTFILES += lldb-$(GARVERSION).src.tar.xz
DISTFILES += lld-$(GARVERSION).src.tar.xz
DISTFILES += clang-$(GARVERSION).src.tar.xz
DISTFILES += compiler-rt-$(GARVERSION).src.tar.xz
DISTFILES += libcxx-$(GARVERSION).src.tar.xz
DISTFILES += libcxxabi-$(GARVERSION).src.tar.xz
DISTFILES += libunwind-$(GARVERSION).src.tar.xz
DISTFILES += polly-$(GARVERSION).src.tar.xz
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.TXT

DESCRIPTION = 
define BLURB
endef

ifeq ($(DESTIMG),build)
build_DESTDIR = $(build_DESTDIR_swapped)
build_rootdir = $(build_rootdir_swapped)
DESTIDR = $(build_DESTDIR_swapped)
rootdir = $(build_rootdir_swapped)
endif

DEPENDS = lang/c lang/cxx build-tool/cmake \
	lib/libffi \
	lib/zlib \
	lib/ncursesw

WORKSRC = $(WORKDIR)/llvm

CONFIGURE_SCRIPTS = $(WORKSRC)/cmake
BUILD_SCRIPTS = $(WORKSRC)/cmake
INSTALL_SCRIPTS = $(WORKSRC)/cmake config links

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
	-DPYTHON_EXECUTABLE="$(build_DESTDIR)$(build_bindir)/python" \
	-DLLVM_CCACHE_BUILD=ON \
	-DLLVM_TARGETS_TO_BUILD="all" \
	-DLLVM_HOST_TRIPLE="$(GARHOST)" \
	-DLLVM_DEFAULT_TARGET_TRIPLE="$(GARHOST)" \
	-DLLVM_ENABLE_LIBCXX=ON \
	-DLLVM_USE_LINKER="lld" \
	-DLLVM_ENABLE_LTO="thin" \
	-DLLVM_INSTALL_TOOLCHAIN_ONLY=OFF \
	-DLLVM_INSTALL_BINUTILS_SYMLINKS=ON \
	-DLLVM_ENABLE_PROJECTS="libcxx;libcxxabi;libunwind;compiler-rt" \
	-DLIBCXX_CXX_ABI="default" \
	-DLIBCXX_USE_COMPILER_RT=ON \
	-DLIBCXXABI_USE_COMPILER_RT=ON \
	-DLIBCXXABI_USE_LLVM_UNWINDER=ON \
	-DLIBCXXABI_LIBCXX_INCLUDES="$(DESTDIR)$(includedir)/c++/v1" \
	-DLIBCXXABI_LIBUNWIND_INCLUDES="$(DESTDIR)$(includedir)" \
	-DLIBUNWIND_USE_COMPILER_RT=ON \
	-DCOMPILER_RT_USE_LIBCXX=ON \
	-DCOMPILER_RT_USE_LIBC=ON \
	-DCOMPILER_RT_USE_BUILTINS_LIBRARY=ON \
	-DCOMPILER_RT_EXCLUDE_ATOMIC_BUILTIN=OFF \
	-DCOMPILER_RT_HAS_ATOMIC_KEYWORD=ON \
	-DCOMPILER_RT_BUILD_BUILTINS=ON \
	-DCOMPILER_RT_BUILD_CRT=ON \
	-DCOMPILER_RT_BUILD_SANITIZERS=OFF \
	-DCOMPILER_RT_BUILD_XRAY=OFF \
	-DCOMPILER_RT_BUILD_LIBFUZZER=OFF
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	-DCMAKE_CROSSCOMPILING=ON \
	-DCMAKE_SYSTEM_NAME="Linux" \
	-DLIBCXX_HAS_MUSL_LIBC=ON \
	-DLIBCXXABI_HAS_CXA_THREAD_ATEXIT_IMPL=OFF
endif

GAR_EXTRA_CONF += llvm/llvm/toolchain.mk
GAR_EXTRA_CONF += devel/cmake/package-api.mk
include ../../gar.mk

CPPFLAGS += -nostdinc++
CFLAGS += -nostdinc++
CXXFLAGS += -nostdinc++

post-extract:
	@mv -fv $(WORKDIR)/llvm-$(GARVERSION).src $(WORKDIR)/llvm
	@mv -fv $(WORKDIR)/lldb-$(GARVERSION).src $(WORKDIR)/lldb
	@mv -fv $(WORKDIR)/lld-$(GARVERSION).src $(WORKDIR)/lld
	@mv -fv $(WORKDIR)/clang-$(GARVERSION).src $(WORKDIR)/clang
	@mv -fv $(WORKDIR)/polly-$(GARVERSION).src $(WORKDIR)/polly
	@mv -fv $(WORKDIR)/libcxx-$(GARVERSION).src $(WORKDIR)/libcxx
	@mv -fv $(WORKDIR)/libcxxabi-$(GARVERSION).src $(WORKDIR)/libcxxabi
	@mv -fv $(WORKDIR)/libunwind-$(GARVERSION).src $(WORKDIR)/libunwind
	@mv -fv $(WORKDIR)/compiler-rt-$(GARVERSION).src $(WORKDIR)/compiler-rt
	@$(MAKECOOKIE)
