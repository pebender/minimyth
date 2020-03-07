GARNAME = clang
GARVERSION = $(LLVM_VERSION)
CATEGORIES = compiler
MASTER_SITES = https://www.llvm.org/releases/$(GARVERSION)/
MASTER_SITES += https://github.com/llvm/llvm-project/releases/download/llvmorg-$(GARVERSION)/
DISTFILES = clang-$(GARVERSION).src.tar.xz
DISTFILES += llvm-$(GARVERSION).src.tar.xz
DISTFILES += compiler-rt-$(GARVERSION).src.tar.xz
DISTFILES += libcxx-$(GARVERSION).src.tar.xz
DISTFILES += libcxxabi-$(GARVERSION).src.tar.xz
DISTFILES += libunwind-$(GARVERSION).src.tar.xz
DISTFILES += polly-$(GARVERSION).src.tar.xz
DISTFILES += lld-$(GARVERSION).src.tar.xz
PATCHFILES = $(DISTNAME)-compiler_rt_libm.patch
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.TXT

DESCRIPTION = 
define BLURB
endef

WORKSRC = $(WORKDIR)/llvm-$(LLVM_VERSION).src

CMAKE_USE_SYSROOT = ON

DEPENDS = \
	compiler/libffi \
	compiler/zlib \
	compiler/ncursesw
BUILDDEPS = \
	native/native \
	ccache/ccache \
	compiler-clang/compiler-clang

CONFIGURE_SCRIPTS = $(WORKSRC)/cmake
BUILD_SCRIPTS = $(WORKSRC)/cmake
INSTALL_SCRIPTS = $(WORKSRC)/cmake config

CONFIGURE_ARGS  = \
	-DCMAKE_BUILD_TYPE=RELEASE \
	-DPYTHON_EXECUTABLE="$(clang_DESTDIR)/$(clang_bindir)/python" \
	-DLLVM_CCACHE_BUILD=ON \
	-DLLVM_TARGETS_TO_BUILD="all" \
	-DLLVM_HOST_TRIPLE="$(GARBUILD)" \
	-DLLVM_DEFAULT_TARGET_TRIPLE="$(GARHOST)" \
	-DLLVM_ENABLE_LIBCXX=ON \
	-DLLVM_USE_LINKER="lld" \
	-DLLVM_ENABLE_LTO="thin" \
	-DLLVM_INSTALL_TOOLCHAIN_ONLY=OFF \
	-DLLVM_INSTALL_BINUTILS_SYMLINKS=ON \
	-DCLANG_DEFAULT_LINKER="lld" \
	-DCLANG_DEFAULT_CXX_STDLIB="libc++" \
	-DCLANG_DEFAULT_UNWINDLIB="libunwind" \
	-DCLANG_DEFAULT_RTLIB="compiler-rt" \
	-DLIBCXX_CXX_ABI="default" \
	-DLIBCXX_CXX_ABI_INCLUDE_PATHS="$(GARDIR)/$(WORKSRC)/projects/libcxxabi/include" \
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
	-DCOMPILER_RT_BUILD_XRAY=OFF \
	-DCOMPILER_RT_BUILD_LIBFUZZER=OFF

GAR_EXTRA_CONF += compiler/compiler/toolchain.mk
GAR_EXTRA_CONF += compiler/compiler/package-api.mk
GAR_EXTRA_CONF += devel/cmake/package-api.mk
include ../../gar.mk

post-extract:
	@mv -fv $(WORKDIR)/clang-$(GARVERSION).src $(WORKSRC)/projects/clang
	@mv -fv $(WORKDIR)/compiler-rt-$(GARVERSION).src $(WORKSRC)/projects/compiler-rt
	@mv -fv $(WORKDIR)/libcxx-$(GARVERSION).src $(WORKSRC)/projects/libcxx
	@mv -fv $(WORKDIR)/libcxxabi-$(GARVERSION).src $(WORKSRC)/projects/libcxxabi
	@mv -fv $(WORKDIR)/libunwind-$(GARVERSION).src $(WORKSRC)/projects/libunwind
	@mv -fv $(WORKDIR)/polly-$(GARVERSION).src $(WORKSRC)/projects/polly
	@mv -fv $(WORKDIR)/lld-$(GARVERSION).src $(WORKSRC)/projects/lld
	@$(MAKECOOKIE)

install-config:
	@rm -fv $(DESTDIR)$(bindir)/config/llvm-config
	@rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-llvm-config
	@mkdir -pv $(DESTDIR)$(bindir)/config
	@$(if $(filter $(GARBUILD),$(GARHOST)), \
		cp -afv $(WORKSRC)_build/bin/llvm-config                    $(DESTDIR)$(bindir)/config/llvm-config, \
		cp -afv $(WORKSRC)_build/BuildTools/Release/bin/llvm-config $(DESTDIR)$(bindir)/config/llvm-config  )
	@ln -sfv llvm-config $(DESTDIR)$(bindir)/config/$(GARHOST)-llvm-config
	@rm -fv $(DESTDIR)$(bindir)/cc
	@ln -sfv clang $(DESTDIR)$(bindir)/cc
	@rm -fv $(DESTDIR)$(bindir)/c++
	@ln -sfv clang++ $(DESTDIR)$(bindir)/c++
	@$(MAKECOOKIE)
