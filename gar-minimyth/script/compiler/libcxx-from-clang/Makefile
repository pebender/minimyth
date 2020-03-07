GARNAME = libcxx-from-clang
GARVERSION = $(LLVM_VERSION)
CATEGORIES = compiler
LICENSE =

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	compiler-clang/compiler-clang

INSTALL_SCRIPTS = libcxx

GAR_EXTRA_CONF += compiler/compiler/toolchain.mk
GAR_EXTRA_CONF += compiler/compiler/package-api.mk
include ../../gar.mk

install-libcxx:
	@mkdir -pv $(DESTDIR)$(libdir)
	@$(foreach file,$(wildcard $(clang_DESTDIR)$(clang_libdir)/libunwind.so  ),cp -afv $(file) $(DESTDIR)$(libdir) ; )
	@$(foreach file,$(wildcard $(clang_DESTDIR)$(clang_libdir)/libunwind.so.*),cp -afv $(file) $(DESTDIR)$(libdir) ; )
	@$(foreach file,$(wildcard $(clang_DESTDIR)$(clang_libdir)/libc++abi.so  ),cp -afv $(file) $(DESTDIR)$(libdir) ; )
	@$(foreach file,$(wildcard $(clang_DESTDIR)$(clang_libdir)/libc++abi.so.*),cp -afv $(file) $(DESTDIR)$(libdir) ; )
	@$(foreach file,$(wildcard $(clang_DESTDIR)$(clang_libdir)/libc++.so  ),cp -afv $(file) $(DESTDIR)$(libdir) ; )
	@$(foreach file,$(wildcard $(clang_DESTDIR)$(clang_libdir)/libc++.so.*),cp -afv $(file) $(DESTDIR)$(libdir) ; )
	@$(MAKECOOKIE)
