GARNAME = llvm
GARVERSION = $(LLVM_VERSION)
CATEGORIES = toolchain
SOURCEPKG = llvm/llvm
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.TXT
LICENSE = $(GARNAME)

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	native/native \
	cc-build/ccache \
	clang-build/clang-build \
	toolchain/libc-crt \
	toolchain/gcc-for-clang

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
	-DLLVM_HOST_TRIPLE="$(GARBUILD)" \
	-DLLVM_DEFAULT_TARGET_TRIPLE="$(GARHOST)" \
	-DLLVM_ENABLE_LIBCXX=ON \
	-DLLVM_USE_LINKER="lld" \
	-DLLVM_ENABLE_LTO=OFF \
	-DLLVM_ENABLE_FFI=OFF \
	-DLLVM_ENABLE_TERMINFO=OFF \
	-DLLVM_ENABLE_LIBXML2=OFF \
	-DLLVM_ENABLE_LIBEDIT=OFF \
	-DLLVM_ENABLE_LIBPFM=OFF \
	-DLLVM_ENABLE_THREADS=ON \
	-DLLVM_ENABLE_ZLIB=OFF \
 	-DCOMPILER_RT_BUILD_XRAY=OFF \
 	-DCOMPILER_RT_BUILD_LIBFUZZER=OFF \
	-DLLVM_INSTALL_TOOLCHAIN_ONLY=OFF \
	-DLLVM_INSTALL_BINUTILS_SYMLINKS=OFF \
	-DLLVM_ENABLE_PROJECTS="lld;clang;polly;libcxx;libcxxabi;libunwind;compiler-rt" \
	-DCLANG_DEFAULT_LINKER="lld" \
	-DCLANG_DEFAULT_CXX_STDLIB="libc++" \
	-DCLANG_DEFAULT_UNWINDLIB="libunwind" \
	-DCLANG_DEFAULT_RTLIB="compiler-rt" \
	-DLIBCXX_CXX_ABI="default" \
	-DLIBCXX_USE_COMPILER_RT=ON \
	-DLIBCXXABI_USE_COMPILER_RT=ON \
	-DLIBCXXABI_USE_LLVM_UNWINDER=ON \
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

build_DESTDIR = $(clang_build_DESTDIR)
build_rootdir = $(clang_build_rootdir)
DESTDIR = $(build_DESTDIR_swapped)
rootdir = $(build_rootdir_swapped)

GAR_EXTRA_CONF += devel/cmake/package-api.mk
GAR_EXTRA_CONF += llvm/llvm/package-api.mk
include ../../gar.mk

post-install: post-install-cc-links post-install-ccache-links

post-install-cc-links:
	@ln -sfv clang $(DESTDIR)$(bindir)/cc
	@ln -sfv clang++ $(DESTDIR)$(bindir)/c++
	@ln -sfv clang-cpp $(DESTDIR)$(bindir)/cpp
	@$(MAKECOOKIE)

post-install-ccache-links:
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/clang
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/clang++
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/cc
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/c++
	@$(MAKECOOKIE)
