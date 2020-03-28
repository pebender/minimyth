GARNAME = libstdcxx-from-gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = clang-build
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION =
define BLURB
endef

BUILDDEPS = \
	native/native \
	cc-build/ccache \
	gcc-build/gcc-build

INSTALL_SCRIPTS = custom

build_DESTDIR = $(gcc_build_DESTDIR)
build_rootdir = $(gcc_build_rootdir)
DESTDIR = $(clang_build_DESTDIR)
rootdir = $(clang_build_rootdir)

GAR_EXTRA_CONF += gcc-build/gcc/package-api.mk
include ../../gar.mk

install-custom:
	@mkdir -pv $(DESTDIR)$(elibdir)
	@install -v --mode=0755 $(build_DESTDIR)$(build_elibdir)/libgcc_s.so.* $(DESTDIR)$(elibdir)
	@mkdir -pv $(DESTDIR)$(libdir)
	@install -v --mode=0755 $(build_DESTDIR)$(build_libdir)/libstdc++.so.* $(DESTDIR)$(elibdir)
	@$(MAKECOOKIE)
