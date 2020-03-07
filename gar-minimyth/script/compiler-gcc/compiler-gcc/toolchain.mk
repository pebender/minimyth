compiler_dir = $(cc_DESTDIR)$(cc_bindir)
build_DESTDIR = $(gcc_DESTDIR)
build_rootdir = $(gcc_rootdir)
DESTDIR = $(gcc_DESTDIR)
rootdir = $(gcc_rootdir)

build_CC = $(ccache_DESTDIR)$(ccache_bindir)/cc
build_CXX = $(ccache_DESTDIR)$(ccache_bindir)/c++
build_LD = $(compiler_dir)/ld
build_OBJDUMP = $(compiler_dir)/objdump
build_OBJCOPY = $(compiler_dir)/objcopy
build_STRIP = $(compiler_dir)/strip
build_RANLIB = $(compiler_dir)/ranlib
build_READELF = $(compiler_dir)/readelf
build_NM = $(compiler_dir)/nm
build_AS = $(compiler_dir)/as
build_AR = $(compiler_dir)/ar
build_CPP = $(compiler_dir)/cpp

build_CPPFLAGS = \
	-idirafter /usr/include
build_LDFLAGS = \
	-Wl,-rpath-link="$(TARGET_LINKTIME_PATH):$(NATIVE_LINKTIME_PATH)" \
	-Wl,-rpath="$(TARGET_LINKTIME_PATH)" \
