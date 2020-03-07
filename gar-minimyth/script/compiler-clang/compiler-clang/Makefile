GARNAME = compiler-clang
VERSION = none
CATEGORIES = compiler-clang
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	compiler-clang/libc-crt \
	compiler-clang/libstdcxx-from-gcc \
	compiler-clang/gcc-for-clang \
	compiler-clang/clang

GAR_EXTRA_CONF += compiler-clang/compiler-clang/toolchain.mk
include ../../gar.mk
