GARNAME = compiler
CATEGORIES = compiler
GARVERSION = none
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	compiler/libc-crt \
	compiler/libcxx-from-clang \
	compiler/clang

GAR_EXTRA_CONF += compiler/compiler/toolchain.mk
GAR_EXTRA_CONF += compiler/compiler/package-api.mk
include ../../gar.mk
