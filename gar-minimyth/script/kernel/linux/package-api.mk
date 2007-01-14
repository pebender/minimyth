KERNEL_MAJOR_VERSION = 2
KERNEL_MINOR_VERSION = 6
KERNEL_TEENY_VERSION = 18
KERNEL_EXTRA_VERSION = .5

KERNEL_VERSION = $(KERNEL_MAJOR_VERSION).$(KERNEL_MINOR_VERSION).$(KERNEL_TEENY_VERSION)$(KERNEL_EXTRA_VERSION)
KERNEL_FULL_VERSION = $(KERNEL_VERSION)

KERNEL_MAKEFILE = $(DESTDIR)$(rootdir)/lib/modules/$(KERNEL_VERSION)*/source/Makefile

KERNEL_DIR           = $(rootdir)/boot
KERNEL_DIR           = $(rootdir)/boot
KERNEL_MODULESPREFIX = $(rootdir)/lib/modules
KERNEL_MODULESDIR    = $(KERNEL_MODULESPREFIX)/$(KERNEL_FULL_VERSION)
KERNEL_SOURCEDIR     = $(KERNEL_MODULESDIR)/source
KERNEL_BUILDDIR      = $(KERNEL_MODULESDIR)/build

KERNEL_MAKE_ARGS = \
	ARCH="$(GARCH_FAMILY)" \
	HOSTCC="$(build_CC)" \
	HOSTCXX="$(build_CXX)" \
	HOSTCFLAGS="$(build_CFLAGS)" \
	HOSTCXXFLAGS="$(build_CXXFLAGS)" \
	CROSS_COMPILE="$(compiler_prefix)"

KERNEL_MAKE_ENV = \
	KBUILD_VERBOSE="1"
