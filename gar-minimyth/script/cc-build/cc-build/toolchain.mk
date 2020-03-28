build_DESTDIR = $(cc_build_DESTDIR)
build_rootdir = $(cc_build_rootdir)
DESTDIR = $(build_DESTDIR)
rootdir = $(build_rootdir)

build_CC = $(ccache_DESTDIR)$(ccache_bindir)/cc
build_CXX = $(ccache_DESTDIR)$(ccache_bindir)/c++
build_CPP = $(build_DESTDIR)$(build_bindir)/cpp
build_LD = $(build_DESTDIR)$(build_bindir)/ld
build_OBJDUMP = $(build_DESTDIR)$(build_bindir)/objdump
build_OBJCOPY = $(build_DESTDIR)$(build_bindir)/objcopy
build_STRIP = $(build_DESTDIR)$(build_bindir)/strip
build_RANLIB = $(build_DESTDIR)$(build_bindir)/ranlib
build_READELF = $(build_DESTDIR)$(build_bindir)/readelf
build_NM = $(build_DESTDIR)$(build_bindir)/nm
build_AS = $(build_DESTDIR)$(build_bindir)/as
build_AR = $(build_DESTDIR)$(build_bindir)/ar

build_CPPFLAGS =
build_CFLAGS =
build_CXXFLAGS =
build_LDFLAGS =
