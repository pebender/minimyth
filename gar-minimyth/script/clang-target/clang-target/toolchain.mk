build_DESTDIR = $(clang_build_DESTDIR)
build_rootdir = $(clang_build_rootdir)
main_DESTDIR = $(gcc_target_DESTDIR)
main_rootdir = $(gcc_target_rootdir)

build_CC = $(ccache_DESTDIR)$(ccache_bindir)/$(build_GARHOST)-clang
build_CXX = $(ccache_DESTDIR)$(ccache_bindir)/$(build_GARHOST)-clang++
build_CPP = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-clang-cpp
build_LD = $(ccache_DESTDIR)$(ccache_bindir)/$(build_GARHOST)-lld
build_OBJDUMP = $(build_DESTDIR)$(build_bindir)/llvm-objdump
build_OBJCOPY = $(build_DESTDIR)$(build_bindir)/llvm-objcopy
build_STRIP = $(build_DESTDIR)$(build_bindir)/llvm-strip
build_RANLIB = $(build_DESTDIR)$(build_bindir)/llvm-ranlib
build_READELF = $(build_DESTDIR)$(build_bindir)/llvm-readelf
build_NM = $(build_DESTDIR)$(build_bindir)/llvm-nm
build_AS = $(build_DESTDIR)$(build_bindir)/llvm-as
build_AR = $(build_DESTDIR)$(build_bindir)/llvm-ar

main_CC = $(ccache_DESTDIR)$(ccache_bindir)/$(main_GARHOST)-clang
main_CXX = $(ccache_DESTDIR)$(ccache_bindir)/$(main_GARHOST)-clang++
main_CPP = $(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-clang-cpp
main_LD = $(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-lld
main_OBJDUMP = $(build_DESTDIR)$(build_bindir)/llvm-objdump
main_OBJCOPY = $(build_DESTDIR)$(build_bindir)/llvm-objcopy
main_STRIP = $(build_DESTDIR)$(build_bindir)/llvm-strip
main_RANLIB = $(build_DESTDIR)$(build_bindir)/llvm-ranlib
main_READELF = $(build_DESTDIR)$(build_bindir)/llvm-readelf
main_NM = $(build_DESTDIR)$(build_bindir)/llvm-nm
main_AS = $(build_DESTDIR)$(build_bindir)/llvm-as
main_AR = $(build_DESTDIR)$(build_bindir)/llvm-ar

build_CPPFLAGS = \
	-idirafter /usr/include

main_CPPFLAGS =
