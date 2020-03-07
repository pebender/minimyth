compiler_dir = $(clang_DESTDIR)$(clang_bindir)
build_DESTDIR = $(toolchain_DESTDIR)
build_rootdir = $(toolchain_rootdir)
DESTDIR = $(toolchain_DESTDIR)
rootdir = $(toolchain_rootdir)

build_CC = $(ccache_DESTDIR)$(ccache_bindir)/clang
build_CXX = $(ccache_DESTDIR)$(ccache_bindir)/clang++
build_LD = $(compiler_dir)/ld.lld
build_OBJDUMP = $(compiler_dir)/llvm-objdump
build_OBJCOPY = $(compiler_dir)/llvm-objcopy
build_STRIP = $(compiler_dir)/llvm-strip
build_RANLIB = $(compiler_dir)/llvm-ranlib
build_READELF = $(compiler_dir)/llvm-readelf
build_NM = $(compiler_dir)/llvm-nm
build_AS = $(compiler_dir)/llvm-as
build_AR = $(compiler_dir)/llvm-ar
build_CPP = $(compiler_dir)/clang-cpp

build_CPPFLAGS = \
	-idirafter /usr/include
