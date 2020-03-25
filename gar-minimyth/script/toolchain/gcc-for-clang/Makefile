GARNAME = gcc-for-clang
GARVERSION = $(GCC_VERSION)
CATEGORIES = toolchain
LICENSE = 

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	clang-build/clang-build

INSTALL_SCRIPTS = compiler

GAR_EXTRA_CONF += toolchain/toolchain/toolchain.mk
GAR_EXTRA_CONF += gcc-build/gcc/package-api.mk
include ../../gar.mk

install-compiler:
	@mkdir -pv $(DESTDIR)$(libdir)/gcc/$(GARBUILD)/$(GCC_MAJOR_VERSION).$(GCC_MINOR_VERSION).$(GCC_TEENY_VERSION)
	@install -v --mode=644 $(clang_build_DESTDIR)$(clang_build_libdir)/gcc/$(GARBUILD)/$(GCC_MAJOR_VERSION).$(GCC_MINOR_VERSION).$(GCC_TEENY_VERSION)/crt*.o $(DESTDIR)$(libdir)/gcc/$(GARBUILD)/$(GCC_MAJOR_VERSION).$(GCC_MINOR_VERSION).$(GCC_TEENY_VERSION)
	@$(MAKECOOKIE)
