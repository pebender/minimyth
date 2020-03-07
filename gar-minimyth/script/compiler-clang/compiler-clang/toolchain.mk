compiler_dir = $(gcc_DESTDIR)$(gcc_bindir)
build_DESTDIR = $(clang_DESTDIR)
build_rootdir = $(clang_rootdir)
DESTDIR = $(clang_DESTDIR)
rootdir = $(clang_rootdir)

build_CC = $(ccache_DESTDIR)$(ccache_bindir)/gcc
build_CXX = $(ccache_DESTDIR)$(ccache_bindir)/g++
build_LD = $(compiler_dir)/ld.bfd
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
