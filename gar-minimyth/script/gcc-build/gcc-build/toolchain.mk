build_DESTDIR = $(gcc_build_DESTDIR)
build_rootdir = $(gcc_build_rootdir)
DESTDIR = $(build_DESTDIR)
rootdir = $(build_rootdir)

build_CC = $(ccache_DESTDIR)$(ccache_bindir)/gcc
build_CXX = $(ccache_DESTDIR)$(ccache_bindir)/g++
build_LD = $(gcc_build_DESTDIR)$(gcc_build_bindir)/ld.bfd
build_OBJDUMP = $(gcc_build_DESTDIR)$(gcc_build_bindir)/objdump
build_OBJCOPY = $(gcc_build_DESTDIR)$(gcc_build_bindir)/objcopy
build_STRIP = $(gcc_build_DESTDIR)$(gcc_build_bindir)/strip
build_RANLIB = $(gcc_build_DESTDIR)$(gcc_build_bindir)/ranlib
build_READELF = $(gcc_build_DESTDIR)$(gcc_build_bindir)/readelf
build_NM = $(gcc_build_DESTDIR)$(gcc_build_bindir)/nm
build_AS = $(gcc_build_DESTDIR)$(gcc_build_bindir)/as
build_AR = $(gcc_build_DESTDIR)$(gcc_build_bindir)/ar
build_CPP = $(gcc_build_DESTDIR)$(gcc_build_bindir)/cpp
