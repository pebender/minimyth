GARNAME = llvm
GARVERSION = $(LLVM_VERSION)
CATEGORIES = toolchain-dirty
SOURCEPKG = toolchain/llvm
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.TXT

DESCRIPTION = 
define BLURB
endef

DEPENDS =
BUILDDEPS = \
	native/native \
	toolchain-dirty/ccache

WORKSRC = $(WORKDIR)/llvm-project-$(GARVERSION)/$(GARNAME)
WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKSRC)/cmake
BUILD_SCRIPTS = $(WORKSRC)/cmake
INSTALL_SCRIPTS = $(WORKSRC)/cmake config-$(DESTIMG) links-$(DESTIMG) ld

CONFIGURE_ARGS = $(LLVM_CONFIGURE_ARGS) \
	-DPYTHON_EXECUTABLE="$(native_DESTDIR)$(native_bindir)/python3" \
	-DLLVM_CCACHE_BUILD=ON \
	-DLLVM_TARGETS_TO_BUILD="all" \
	-DLLVM_HOST_TRIPLE="$(GARBUILD)" \
	-DLLVM_DEFAULT_TARGET_TRIPLE="$(GARHOST)" \
	-DLLVM_ENABLE_LIBCXX=OFF \
	-DLLVM_ENABLE_LTO=OFF \
	-DLLVM_ENABLE_FFI=OFF \
	-DLLVM_ENABLE_TERMINFO=OFF \
	-DLLVM_ENABLE_LIBXML2=OFF \
	-DLLVM_ENABLE_LIBEDIT=OFF \
	-DLLVM_ENABLE_LIBPFM=OFF \
	-DLLVM_ENABLE_THREADS=ON \
	-DLLVM_ENABLE_ZLIB=OFF \
	-DLLVM_INSTALL_TOOLCHAIN_ONLY=OFF \
	-DLLVM_INSTALL_BINUTILS_SYMLINKS=ON \
	-DLLVM_ENABLE_RTTI=ON \
	-DLLVM_ENABLE_PROJECTS="llvm;lld;clang;polly;libcxx;libcxxabi;libunwind;compiler-rt" \
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

GAR_EXTRA_CONF += toolchain/llvm/package-api.mk
GAR_EXTRA_CONF += toolchain-dirty/toolchain-dirty/toolchain.mk
include ../../gar.mk

CC := $(build_DESTDIR)$(build_bindir)/ccache.d/cc
CXX := $(build_DESTDIR)$(build_bindir)/ccache.d/c++
CPP := $(build_DESTDIR)$(build_bindir)/cpp
LD := $(build_DESTDIR)$(build_bindir)/ld
OBJDUMP := $(build_DESTDIR)$(build_bindir)/objdump
OBJCOPY := $(build_DESTDIR)$(build_bindir)/objcopy
STRIP := $(build_DESTDIR)$(build_bindir)/strip
RANLIB := $(build_DESTDIR)$(build_bindir)/ranlib
READELF := $(build_DESTDIR)$(build_bindir)/readelf
NM := $(build_DESTDIR)$(build_bindir)/nm
AS := $(build_DESTDIR)$(build_bindir)/as
AR := $(build_DESTDIR)$(build_bindir)/ar

CPPFLAGS := -idirafter /usr/include
CFLAGS := -idirafter /usr/include
CXXFLAGS := -idirafter /usr/include
LDFLAGS :=

configure-%/cmake: 
	@echo " ==> Running configure in $*"
	@rm -rfv $*_build
	@mkdir -pv $*_build
	@cd $(WORKSRC)_build && $(CONFIGURE_ENV) cmake $(CONFIGURE_ARGS) ./$(call DIRSTODOTS,$(WORKSRC)_build)/$(WORKSRC)
	@$(MAKECOOKIE)

build-%/cmake:
	@echo " ==> Running build in $*_build"
	@$(BUILD_ENV) DESTDIR= cmake --build $*_build
	@$(MAKECOOKIE)

install-%/cmake: 
	@echo " ==> Running install in $*_build"
	@$(INSTALL_ENV) DESTDIR= cmake --build $*_build --target install
	@$(MAKECOOKIE)

install-ld:
	@ln -sfv ld.lld $(DESTDIR)$(bindir)/ld
	@$(MAKECOOKIE)
