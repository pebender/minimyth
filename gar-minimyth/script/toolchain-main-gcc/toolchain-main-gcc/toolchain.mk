build_DESTDIR = $(build_DESTDIR_swapped)
build_rootdir = $(build_rootdir_swapped)

build_CC = $(build_DESTDIR)$(build_bindir)/ccache.d/$(build_GARHOST)-gcc
build_CXX = $(build_DESTDIR)$(build_bindir)/ccache.d/$(build_GARHOST)-g++
build_CPP = $(build_DESTDIR)$(build_bindir)/wrapper.d/$(build_GARHOST)-cpp
build_LD = $(build_DESTDIR)$(build_bindir)/wrapper.d/$(build_GARHOST)-ld.bfd
build_OBJDUMP = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-objdump
build_OBJCOPY = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-objcopy
build_STRIP = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-strip
build_RANLIB = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-ranlib
build_READELF = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-readelf
build_NM = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-nm
build_AS = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-as
build_AR = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-ar

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
