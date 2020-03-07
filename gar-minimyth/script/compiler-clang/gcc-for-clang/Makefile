GARNAME = gcc-for-clang
GARVERSION = $(GCC_VERSION)
CATEGORIES = compiler-clang
LICENSE = 

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	compiler-gcc/compiler-gcc

INSTALL_SCRIPTS = compiler

GAR_EXTRA_CONF += compiler-clang/compiler-clang/toolchain.mk
GAR_EXTRA_CONF += compiler-gcc/gcc/package-api.mk
include ../../gar.mk

install-compiler:
	@mkdir -pv $(DESTDIR)$(libdir)/gcc/$(GARBUILD)/$(GCC_MAJOR_VERSION).$(GCC_MINOR_VERSION).$(GCC_TEENY_VERSION)
	@cd $(DESTDIR)$(libdir)/gcc/$(GARBUILD)/$(GCC_MAJOR_VERSION).$(GCC_MINOR_VERSION).$(GCC_TEENY_VERSION) && \
		cp -afv $(gcc_DESTDIR)$(gcc_libdir)/gcc/$(GARBUILD)/$(GCC_MAJOR_VERSION).$(GCC_MINOR_VERSION).$(GCC_TEENY_VERSION)/crt*.o .
	@$(MAKECOOKIE)
