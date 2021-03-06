main_CC = $(build_DESTDIR)$(build_bindir)/ccache.d/$(main_GARHOST)-gcc
main_CXX = $(build_DESTDIR)$(build_bindir)/ccache.d/$(main_GARHOST)-g++
main_CPP = $(build_DESTDIR)$(build_bindir)/wrapper.d/$(main_GARHOST)-cpp
main_LD = $(build_DESTDIR)$(build_bindir)/wrapper.d/$(main_GARHOST)-ld.bfd
main_OBJDUMP = $(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-objdump
main_OBJCOPY = $(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-objcopy
main_STRIP = $(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-strip
main_RANLIB = $(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-ranlib
main_READELF = $(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-readelf
main_NM = $(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-nm
main_AS = $(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-as
main_AR = $(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-ar

build_CC = $(build_DESTDIR)$(build_bindir)/ccache.d/$(build_GARHOST)-clang
build_CXX = $(build_DESTDIR)$(build_bindir)/ccache.d/$(build_GARHOST)-clang++
build_CPP = $(build_DESTDIR)$(build_bindir)/wrapper.d/$(build_GARHOST)-clang-cpp
build_LD = $(build_DESTDIR)$(build_bindir)/wrapper.d/$(build_GARHOST)-ld.lld
build_OBJDUMP = $(build_DESTDIR)$(build_bindir)/llvm-objdump
build_OBJCOPY = $(build_DESTDIR)$(build_bindir)/llvm-objcopy
build_STRIP = $(build_DESTDIR)$(build_bindir)/llvm-strip
build_RANLIB = $(build_DESTDIR)$(build_bindir)/llvm-ranlib
build_READELF = $(build_DESTDIR)$(build_bindir)/llvm-readelf
build_NM = $(build_DESTDIR)$(build_bindir)/llvm-nm
build_AS = $(build_DESTDIR)$(build_bindir)/llvm-as
build_AR = $(build_DESTDIR)$(build_bindir)/llvm-ar
