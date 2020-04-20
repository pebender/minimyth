LINUX_MAJOR_VERSION = 5
LINUX_MINOR_VERSION = 6
LINUX_TEENY_VERSION = 5
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
	$(if $(filter i386,$(GARCH_FAMILY)), \
		HOSTCC="$(build_DESTDIR)$(build_bindir)/ccache.d/$(build_GARHOST)-gcc" \
		HOSTCXX="$(build_DESTDIR)$(build_bindir)/ccache.d/$(build_GARHOST)-g++" \
		CC="$(build_DESTDIR)$(build_bindir)/ccache.d/$(main_GARHOST)-gcc" \
		CPP="$(build_DESTDIR)$(build_bindir)/wrapper.d/$(main_GARHOST)-cpp" \
		LD="$(build_DESTDIR)$(build_bindir)/wrapper.d/$(main_GARHOST)-ld.bfd" \
		AS="$(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-as" \
		AR="$(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-ar" \
		NM="$(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-nm" \
		STRIP="$(build_DESTDIR)$(gcc_build_bindir)/$(main_GARHOST)-strip" \
		RANLIB="$(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-ranlib" \
		OBJCOPY="$(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-objcopy" \
		OBJDUMP="$(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-objdump" \
		OBJSIZE="size" \
	, \
		HOSTCC="$(build_CC)" \
		HOSTCXX="$(build_CXX)" \
		CC="$(CC)" \
		CPP="$(CPP)" \
		LD="$(LD)" \
		AS="$(AS)" \
		AR="$(AR)" \
		NM="$(NM)" \
		STRIP="$(STRIP)" \
		RANLIB="$(RANLIB)" \
		OBJCOPY="$(OBJCOPY)" \
		OBJDUMP="$(OBJDUMP)" \
		OBJSIZE="size" \
	)

LINUX_MAKE_ENV = \
	KBUILD_VERBOSE="1"
