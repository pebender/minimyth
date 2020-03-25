build_DESTDIR = $(clang_build_DESTDIR)
build_rootdir = $(clang_build_rootdir)
main_DESTDIR = $(gcc_target_DESTDIR)
main_rootdir = $(gcc_target_rootdir)

build_CC = $(ccache_DESTDIR)$(ccache_bindir)/$(build_GARHOS)-clang
build_CXX = $(ccache_DESTDIR)$(ccache_bindir)/$(build_GARHOS)-clang++
build_LD = $(clang_build_DESTDIR)$(clang_build_bindir)/$(build_GARHOS)-lld
build_OBJDUMP = $(clang_build_DESTDIR)$(clang_build_bindir)/$(build_GARHOS)-objdump
build_OBJCOPY = $(clang_build_DESTDIR)$(clang_build_bindir)/$(build_GARHOS)-objcopy
build_STRIP = $(clang_build_DESTDIR)$(clang_build_bindir)/$(build_GARHOS)-strip
build_RANLIB = $(clang_build_DESTDIR)$(clang_build_bindir)/$(build_GARHOS)-ranlib
build_READELF = $(clang_build_DESTDIR)$(clang_build_bindir)/$(build_GARHOS)-readelf
build_NM = $(clang_build_DESTDIR)$(clang_build_bindir)/$(build_GARHOS)-nm
build_AS = $(clang_build_DESTDIR)$(clang_build_bindir)/$(build_GARHOS)-as
build_AR = $(clang_build_DESTDIR)$(clang_build_bindir)/$(build_GARHOS)-ar
build_CPP = $(clang_build_DESTDIR)$(clang_build_bindir)/$(build_GARHOS)-cpp

main_CC = $(ccache_DESTDIR)$(ccache_bindir)/$(main_GARHOST)-clang
main_CXX = $(ccache_DESTDIR)$(ccache_bindir)/$(main_GARHOST)-clang++
main_LD = $(clang_build_DESTDIR)$(clang_build_bindir)/$(main_GARHOST)-lld
main_OBJDUMP = $(clang_build_DESTDIR)$(clang_build_bindir)/$(main_GARHOST)-objdump
main_OBJCOPY = $(clang_build_DESTDIR)$(clang_build_bindir)/$(main_GARHOST)-objcopy
main_STRIP = $(clang_build_DESTDIR)$(clang_build_bindir)/$(main_GARHOST)-strip
main_RANLIB = $(clang_build_DESTDIR)$(clang_build_bindir)/$(main_GARHOST)-ranlib
main_READELF = $(clang_build_DESTDIR)$(clang_build_bindir)/$(main_GARHOST)-readelf
main_NM = $(clang_build_DESTDIR)$(clang_build_bindir)/$(main_GARHOST)-nm
main_AS = $(clang_build_DESTDIR)$(clang_build_bindir)/$(main_GARHOST)-as
main_AR = $(clang_build_DESTDIR)$(clang_build_bindir)/$(main_GARHOST)-ar
main_CPP = $(clang_build_DESTDIR)$(clang_build_bindir)/$(main_GARHOST)-cpp

build_CPPFLAGS = \
	-idirafter /usr/include

main_CPPFLAGS =
