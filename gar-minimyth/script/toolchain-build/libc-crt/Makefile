GARNAME = libc-crt
GARVERSION =
CATEGORIES = toolchain-build
SOURCEPKG = toolchain/libc-crt
LICENSE =

DESCRIPTION =
define BLURB
endef

ifeq ($(DESTIMG),build)
INSTALL_SCRIPTS = libs
endif

GAR_EXTRA_CONF += toolchain/libc-crt/package-api.mk
include ../../gar.mk
