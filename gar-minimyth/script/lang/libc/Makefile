GARNAME = libc
GARVERSION =
CATEGORIES = lang
LICENSE =

DESCRIPTION =
define BLURB
endef

ifneq ($(DESTIMG),build)
DEPENDS = lang/musl
endif

GAR_EXTRA_CONF += lang/lang/toolchain.mk
include ../../gar.mk
