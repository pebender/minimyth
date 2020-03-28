build_DESTDIR = $(build_DESTDIR_swapped)
build_rootdir = $(build_rootdir_swapped)

main_CC = clang
main_CXX = clang++
main_LD = ld.lld
main_OBJDUMP = llvm-objdump
main_OBJCOPY = llvm-objcopy
main_STRIP = llvm-strip
main_RANLIB = llvm-ranlib
main_READELF = llvm-readelf
main_NM = llvm-nm
main_AS = llvm-as
main_AR = llvm-ar
main_CPP = clang-cpp

build_CC = clang
build_CXX = clang++
build_LD = ld.lld
build_OBJDUMP = llvm-objdump
build_OBJCOPY = llvm-objcopy
build_STRIP = llvm-strip
build_RANLIB = llvm-ranlib
build_READELF = llvm-readelf
build_NM = llvm-nm
build_AS = llvm-as
build_AR = llvm-ar
build_CPP = clang-cpp

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

