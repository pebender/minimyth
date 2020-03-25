build_DESTDIR = $(build_DESTDIR_swapped)
build_rootdir = $(build_rootdir_swapped)

main_CC = $(ccache_DESTDIR)$(ccache_bindir)/clang
main_CXX = $(ccache_DESTDIR)$(ccache_bindir)/clang++
main_LD = $(build_DESTDIR)$(build_bindir)/ld.lld
main_OBJDUMP = $(build_DESTDIR)$(build_bindir)/objdump
main_OBJCOPY = $(build_DESTDIR)$(build_bindir)/objcopy
main_STRIP = $(build_DESTDIR)$(build_bindir)/strip
main_RANLIB = $(build_DESTDIR)$(build_bindir)/ranlib
main_READELF = $(build_DESTDIR)$(build_bindir)/readelf
main_NM = $(build_DESTDIR)$(build_bindir)/nm
main_AS = $(build_DESTDIR)$(build_bindir)/as
main_AR = $(build_DESTDIR)$(build_bindir)/ar
main_CPP = $(build_DESTDIR)$(build_bindir)/clang-cpp

build_CC = $(ccache_DESTDIR)$(ccache_bindir)/clang
build_CXX = $(ccache_DESTDIR)$(ccache_bindir)/clang++
build_LD = $(build_DESTDIR)$(build_bindir)/ld.lld
build_OBJDUMP = $(build_DESTDIR)$(build_bindir)/objdump
build_OBJCOPY = $(build_DESTDIR)$(build_bindir)/objcopy
build_STRIP = $(build_DESTDIR)$(build_bindir)/strip
build_RANLIB = $(build_DESTDIR)$(build_bindir)/ranlib
build_READELF = $(build_DESTDIR)$(build_bindir)/readelf
build_NM = $(build_DESTDIR)$(build_bindir)/nm
build_AS = $(build_DESTDIR)$(build_bindir)/as
build_AR = $(build_DESTDIR)$(build_bindir)/ar
build_CPP = $(build_DESTDIR)$(build_bindir)/clang-cpp

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

