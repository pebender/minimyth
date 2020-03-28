build_DESTDIR = $(build_DESTDIR_swapped)
build_rootdir = $(build_rootdir_swapped)

main_DESTDIR = $(gcc_target_DESTDIR)
main_rootdir = $(gcc_target_rootdir)

build_CC = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(build_GARHOST)-gcc
build_CXX = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(build_GARHOST)-g++
build_LD = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(build_GARHOST)-ld.bfd
build_OBJDUMP = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(build_GARHOST)-objdump
build_OBJCOPY = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(build_GARHOST)-objcopy
build_STRIP = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(build_GARHOST)-strip
build_RANLIB = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(build_GARHOST)-ranlib
build_READELF = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(build_GARHOST)-readelf
build_NM = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(build_GARHOST)-nm
build_AS = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(build_GARHOST)-as
build_AR = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(build_GARHOST)-ar
build_CPP = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(build_GARHOST)-cpp

main_CC = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(main_GARHOST)-gcc
main_CXX = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(main_GARHOST)-g++
main_LD = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(main_GARHOST)-ld.bfd
main_OBJDUMP = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(main_GARHOST)-objdump
main_OBJCOPY = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(main_GARHOST)-objcopy
main_STRIP = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(main_GARHOST)-strip
main_RANLIB = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(main_GARHOST)-ranlib
main_READELF = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(main_GARHOST)-readelf
main_NM = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(main_GARHOST)-nm
main_AS = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(main_GARHOST)-as
main_AR = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(main_GARHOST)-ar
main_CPP = $(gcc_build_DESTDIR)$(gcc_build_bindir)/$(main_GARHOST)-cpp
