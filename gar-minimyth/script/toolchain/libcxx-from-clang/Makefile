GARNAME = libcxx-from-clang
GARVERSION = $(LLVM_VERSION)
CATEGORIES = toolchain
LICENSE =

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	clang-build/clang-build

INSTALL_SCRIPTS = libcxx

GAR_EXTRA_CONF += toolchain/toolchain/toolchain.mk
GAR_EXTRA_CONF += llvm/llvm/package-api.mk
include ../../gar.mk

install-libcxx:
	@mkdir -pv $(DESTDIR)$(libdir)
	@$(foreach file,$(wildcard $(clang_build_DESTDIR)$(clang_build_libdir)/libunwind.so  ),cp -afv $(file) $(DESTDIR)$(libdir) ; )
	@$(foreach file,$(wildcard $(clang_build_DESTDIR)$(clang_build_libdir)/libunwind.so.*),cp -afv $(file) $(DESTDIR)$(libdir) ; )
	@$(foreach file,$(wildcard $(clang_build_DESTDIR)$(clang_build_libdir)/libc++abi.so  ),cp -afv $(file) $(DESTDIR)$(libdir) ; )
	@$(foreach file,$(wildcard $(clang_build_DESTDIR)$(clang_build_libdir)/libc++abi.so.*),cp -afv $(file) $(DESTDIR)$(libdir) ; )
	@$(foreach file,$(wildcard $(clang_build_DESTDIR)$(clang_build_libdir)/libc++.so  ),cp -afv $(file) $(DESTDIR)$(libdir) ; )
	@$(foreach file,$(wildcard $(clang_build_DESTDIR)$(clang_build_libdir)/libc++.so.*),cp -afv $(file) $(DESTDIR)$(libdir) ; )
	@$(MAKECOOKIE)
