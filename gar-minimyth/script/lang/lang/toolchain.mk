build_DESTDIR = $(build_DESTDIR_swapped)
build_rootdir = $(build_rootdir_swapped)

main_CC = $(build_DESTDIR)$(build_bindir)/clang
main_CXX = $(build_DESTDIR)$(build_bindir)/clang++
main_CPP = $(build_DESTDIR)$(build_bindir)/clang-cpp
main_LD = $(build_DESTDIR)$(build_bindir)/ld.lld
main_OBJDUMP = $(build_DESTDIR)$(build_bindir)/llvm-objdump
main_OBJCOPY = $(build_DESTDIR)$(build_bindir)/llvm-objcopy
main_STRIP = $(build_DESTDIR)$(build_bindir)/llvm-strip
main_RANLIB = $(build_DESTDIR)$(build_bindir)/llvm-ranlib
main_READELF = $(build_DESTDIR)$(build_bindir)/llvm-readelf
main_NM = $(build_DESTDIR)$(build_bindir)/llvm-nm
main_AS = $(build_DESTDIR)$(build_bindir)/llvm-as
main_AR = $(build_DESTDIR)$(build_bindir)/llvm-ar

build_CC = $(build_DESTDIR)$(build_bindir)/clang
build_CXX = $(build_DESTDIR)$(build_bindir)/clang++
build_CPP = $(build_DESTDIR)$(build_bindir)/clang-cpp
build_LD = $(build_DESTDIR)$(build_bindir)/ld.lld
build_OBJDUMP = $(build_DESTDIR)$(build_bindir)/llvm-objdump
build_OBJCOPY = $(build_DESTDIR)$(build_bindir)/llvm-objcopy
build_STRIP = $(build_DESTDIR)$(build_bindir)/llvm-strip
build_RANLIB = $(build_DESTDIR)$(build_bindir)/llvm-ranlib
build_READELF = $(build_DESTDIR)$(build_bindir)/llvm-readelf
build_NM = $(build_DESTDIR)$(build_bindir)/llvm-nm
build_AS = $(build_DESTDIR)$(build_bindir)/llvm-as
build_AR = $(build_DESTDIR)$(build_bindir)/llvm-ar

main_FLAGS = \
	--gcc-toolchain=$(build_DESTDIR)$(build_prefix) \
	-target $(main_GARHOST) \
	--sysroot=$(main_DESTDIR)
main_CPPFLAGS += $(main_FLAGS)
main_CFLAGS += $(main_FLAGS)
main_CXXFLAGS += $(main_FLAGS)
main_LDFLAGS += $(main_FLAGS)

build_FLAGS = \
	--gcc-toolchain=$(build_DESTDIR)$(build_prefix) \
	-target $(build_GARHOST) \
	--sysroot=$(build_DESTDIR)
build_CPPFLAGS += $(build_FLAGS)
build_CFLAGS += $(build_FLAGS)
build_CXXFLAGS += $(build_FLAGS)
build_LDFLAGS += $(build_FLAGS)

