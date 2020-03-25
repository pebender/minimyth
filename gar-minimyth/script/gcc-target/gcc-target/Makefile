GARNAME = gcc-target
CATEGORIES = gcc-target
GARVERSION = none
LICENSE =

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	gcc-target/binutils \
	gcc-target/gcc

CROSSIMG = main
export CROSSIMG

GAR_EXTRA_CONF += gcc-target/gcc-target/toolchain.mk
include ../../gar.mk
