GARNAME = llvm
GARVERSION = $(LLVM_VERSION)
CATEGORIES = toolchain-build
SOURCEPKG = toolchain/llvm
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.TXT
LICENSE = $(GARNAME)

DESCRIPTION = 
define BLURB
endef

DEPENDS= \
	toolchain-build/libc-crt \
	toolchain-build/libffi \
	toolchain-build/ncursesw \
	toolchain-build/zlib \
	toolchain-build/gcc
BUILDDEPS = \
	native/native \
	tainted-build/tainted-build

CONFIGURE_SCRIPTS = $(WORKSRC)/cmake
BUILD_SCRIPTS = $(WORKSRC)/cmake
INSTALL_SCRIPTS = $(WORKSRC)/cmake config-$(DESTIMG) links-$(DESTIMG)

CONFIGURE_ARGS = $(LLVM_CONFIGURE_ARGS) \
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
	-DLLVM_ENABLE_ZLIB=ON \
	-DLLVM_INSTALL_TOOLCHAIN_ONLY=OFF \
	-DLLVM_INSTALL_BINUTILS_SYMLINKS=OFF \
	-DLLVM_ENABLE_RTTI=ON \
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
	-DCOMPILER_RT_BUILD_SANITIZERS=ON \
	-DCOMPILER_RT_BUILD_XRAY=ON \
	-DCOMPILER_RT_BUILD_LIBFUZZER=ON

GAR_EXTRA_CONF += toolchain-build/toolchain-build/toolchain.mk
GAR_EXTRA_CONF += devel/cmake/package-api.mk
GAR_EXTRA_CONF += toolchain/llvm/package-api.mk
include ../../gar.mk

post-install: post-install-cc-links post-install-ccache-links

post-install-cc-links:
	@ln -sfv clang $(DESTDIR)$(bindir)/cc
	@ln -sfv clang++ $(DESTDIR)$(bindir)/c++
	@ln -sfv clang-cpp $(DESTDIR)$(bindir)/cpp
	@$(MAKECOOKIE)

post-install-ccache-links:
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/clang
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/clang++
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/cc
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/c++
	@$(MAKECOOKIE)
