LINUX_MAJOR_VERSION = 5
LINUX_MINOR_VERSION = 6
LINUX_TEENY_VERSION = 13
LINUX_EXTRA_VERSION =

LINUX_VERSION      = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),.$(LINUX_TEENY_VERSION))$(LINUX_EXTRA_VERSION)
LINUX_FULL_VERSION = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),.$(LINUX_TEENY_VERSION),.0)$(LINUX_EXTRA_VERSION)

LINUX_DIR           = $(rootdir)/boot
LINUX_DIR           = $(rootdir)/boot
LINUX_MODULESPREFIX = $(rootdir)/lib/modules
LINUX_MODULESDIR    = $(LINUX_MODULESPREFIX)/$(LINUX_FULL_VERSION)
LINUX_SOURCEDIR     = $(LINUX_MODULESDIR)/source
LINUX_BUILDDIR      = $(LINUX_MODULESDIR)/build

LINUX_MAKEFILE = $(DESTDIR)$(LINUX_SOURCEDIR)/Makefile

LINUX_MAKE_ARGS = \
	ARCH="$(GARCH_FAMILY)" \
	HOSTCFLAGS="$(build_CPPFLAGS) $(build_CFLAGS)" \
	HOSTCXXFLAGS="$(build_CPPFLAGS) $(build_CXXFLAGS)" \
	HOSTLDFLAGS="$(build_LDFLAGS)" \
	CROSS_COMPILE="$(GARHOST)-" \
	HOSTCC="$(build_CC)" \
	HOSTCXX="$(build_CXX)" \
	HOSTLD="$(build_LD)" \
	KBUILD_VERBOSE="1" \
	V="1"

LINUX_MAKE_ENV = \
	KBUILD_VERBOSE="1" \
	V="1"
