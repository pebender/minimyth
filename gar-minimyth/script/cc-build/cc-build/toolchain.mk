build_DESTDIR = $(cc_build_DESTDIR)
build_rootdir = $(cc_build_rootdir)
DESTDIR = $(build_DESTDIR)
rootdir = $(build_rootdir)

build_CC = $(ccache_DESTDIR)$(ccache_bindir)/cc
build_CXX = $(ccache_DESTDIR)$(ccache_bindir)/c++
build_LD = $(cc_build_DESTDIR)$(cc_build_bindir)/ld
build_OBJDUMP = $(cc_build_DESTDIR)$(cc_build_bindir)/objdump
build_OBJCOPY = $(cc_build_DESTDIR)$(cc_build_bindir)/objcopy
build_STRIP = $(cc_build_DESTDIR)$(cc_build_bindir)/strip
build_RANLIB = $(cc_build_DESTDIR)$(cc_build_bindir)/ranlib
build_READELF = $(cc_build_DESTDIR)$(cc_build_bindir)/readelf
build_NM = $(cc_build_DESTDIR)$(cc_build_bindir)/nm
build_AS = $(cc_build_DESTDIR)$(cc_build_bindir)/as
build_AR = $(cc_build_DESTDIR)$(cc_build_bindir)/ar
build_CPP = $(cc_build_DESTDIR)$(cc_build_bindir)/cpp

build_CPPFLAGS =
build_CFLAGS =
build_CXXFLAGS =
build_LDFLAGS =
