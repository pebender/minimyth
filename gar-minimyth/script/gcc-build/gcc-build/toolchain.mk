build_DESTDIR = $(gcc_build_DESTDIR)
build_rootdir = $(gcc_build_rootdir)
DESTDIR = $(build_DESTDIR)
rootdir = $(build_rootdir)

build_CC = $(ccache_DESTDIR)$(ccache_bindir)/$(build_GARHOST)-gcc
build_CXX = $(ccache_DESTDIR)$(ccache_bindir)/$(build_GARHOST)-g++
build_CPP = $(build_DESTDIR)$(build_bindir)/wrapper/$(build_GARHOST)-cpp
build_LD = $(build_DESTDIR)$(build_bindir)/wrapper/$(build_GARHOST)-ld.bfd
build_OBJDUMP = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-objdump
build_OBJCOPY = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-objcopy
build_STRIP = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-strip
build_RANLIB = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-ranlib
build_READELF = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-readelf
build_NM = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-nm
build_AS = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-as
build_AR = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-ar
