GARNAME = gcc-for-clang
GARVERSION = $(GCC_VERSION)
CATEGORIES = clang-build
LICENSE = 

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	gcc-build/gcc-build

INSTALL_SCRIPTS = compiler

GAR_EXTRA_CONF += clang-build/clang-build/toolchain.mk
GAR_EXTRA_CONF += gcc-build/gcc/package-api.mk
include ../../gar.mk

install-compiler:
	@mkdir -pv $(DESTDIR)$(libdir)/gcc/$(GARBUILD)/$(GCC_MAJOR_VERSION).$(GCC_MINOR_VERSION).$(GCC_TEENY_VERSION)
	@install -v --mode=644 $(gcc_build_DESTDIR)$(gcc_build_libdir)/gcc/$(GARBUILD)/$(GCC_MAJOR_VERSION).$(GCC_MINOR_VERSION).$(GCC_TEENY_VERSION)/crt*.o $(DESTDIR)$(libdir)/gcc/$(GARBUILD)/$(GCC_MAJOR_VERSION).$(GCC_MINOR_VERSION).$(GCC_TEENY_VERSION)
	@$(MAKECOOKIE)
