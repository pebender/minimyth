GARNAME = libstdcxx-from-gcc
GARVERSION = $(LLVM_VERSION)
CATEGORIES = toolchain
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.TXT
LICENSE = $(GARNAME)

DESCRIPTION =
define BLURB
endef

BUILDDEPS = \
	native/native \
	cc-build/ccache \
	clang-build/clang-build

INSTALL_SCRIPTS = custom

build_DESTDIR = $(gcc_build_DESTDIR)
build_rootdir = $(gcc_build_rootdir)
DESTDIR = $(clang_build_DESTDIR)
rootdir = $(clang_build_rootdir)

GAR_EXTRA_CONF += llvm/llvm/package-api.mk
include ../../gar.mk

install-custom:
	@mkdir -pv $(DESTDIR)$(libdir)
	@install -v --mode=0755 $(build_DESTDIR)$(build_libdir)/libc++.so.* $(DESTDIR)$(libdir)
	@install -v --mode=0755 $(build_DESTDIR)$(build_libdir)/libc++abi.so.* $(DESTDIR)$(libdir)
	@install -v --mode=0755 $(build_DESTDIR)$(build_libdir)/libunwind.so.* $(DESTDIR)$(libdir)
	@$(MAKECOOKIE)
