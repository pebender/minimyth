LINUX_MAJOR_VERSION = 5
LINUX_MINOR_VERSION = 5
LINUX_TEENY_VERSION = 10
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
	HOSTCC="$(build_CC)" \
	HOSTCXX="$(build_CXX)" \
	HOSTCFLAGS="$(build_CPPFLAGS) $(build_CFLAGS)" \
	HOSTCXXFLAGS="$(build_CPPFLAGS) $(build_CXXFLAGS)" \
	HOSTLDFLAGS="$(build_LDFLAGS)" \
	CROSS_COMPILE="$(GARHOST)-" \
	AS="$(AS)" \
	LD="$(LD)" \
	CC="$(CC)" \
	CPP="$(CC) -E" \
	AR="$(AR)" \
	NM="$(NM)" \
	STRIP="$(STRIP)" \
	RANLIB="$(RANLIB)" \
	OBJCOPY="$(OBJCOPY)" \
	OBJDUMP="$(OBJDUMP)" \
	OBJSIZE="$(SIZE)"

LINUX_MAKE_ENV = \
	KBUILD_VERBOSE="1"

build_AS = "$(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-as"
build_LD = "$(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-ld.bfd"
build_AR = "$(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-ar"
build_NM = "$(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-nm"
build_STRIP = "$(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-strip"
build_RANLIB = "$(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-ranlib"
build_OBJCOPY = "$(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-objcopy"
build_OBJDUMP = "$(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-objdump"

main_AS = "$(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-as"
main_LD = "$(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-ld.bfd"
main_AR = "$(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-ar"
main_NM = "$(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-nm"
main_STRIP = "$(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-strip"
main_RANLIB = "$(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-ranlib"
main_OBJCOPY = "$(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-objcopy"
main_OBJDUMP = "$(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-objdump"
