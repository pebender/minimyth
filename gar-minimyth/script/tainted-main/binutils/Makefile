GARNAME = binutils
GARVERSION = $(BINUTILS_VERSION)
CATEGORIES = tainted-main
SOURCEPKG = toolchain/binutils
LICENSE = GPL2/LGPL2/GPL3/LGPL3

DESCRIPTION =
define BLURB
endef

CROSSIMG ?= $(DESTIMG)
GARTARGET = $($(CROSSIMG)_GARHOST)

ifeq ($(DESTIMG),build)
DEPENDS =
BUILDDEPS = \
	native/native \
	tainted-build/tainted-build
endif

CONFIGURE_ARGS = $(BINUTILS_CONFIGURE_ARGS)

GAR_EXTRA_CONF += tainted-main/tainted-main/toolchain.mk
GAR_EXTRA_CONF += toolchain/binutils/package-api.mk
include ../../gar.mk

CFLAGS += -fPIC
CXXFLAGS += -fPIC
LDFLAGS += -fPIC
