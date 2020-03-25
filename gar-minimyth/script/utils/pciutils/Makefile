GARNAME = pciutils
GARVERSION = 3.6.2
CATEGORIES = utils
MASTER_SITES = https://www.kernel.org/pub/software/utils/pciutils/
DISTFILES  = $(DISTNAME).tar.xz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c data/pci.ids

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

BUILD_ARGS   = \
	OPT="$(CFLAGS)" \
	HOST="$(GARCH_FAMILY)-Linux" \
	RELEASE="$(LINUX_VERSION)" \
	CROSS_COMPILE="$(GARHOST)-" \
	ZLIB="no" \
	DNS="no" \
	SHARED="yes" \
	DESTDIR="$(DESTDIR)" \
	PREFIX="$(prefix)" \
	SBINDIR="$(sbindir)" \
	SHAREDIR="$(datadir)" \
	IDSDIR="$(datadir)" \
	MANDIR="$(mandir)" \
	INCDIR="$(includedir)" \
	LIBDIR="$(libdir)" \
	PKGCFDIR="$(libdir)/pkgconfig" \
	STRIP="" \
	CC="$(CC)" \
	AR="$(AR)" \
	RANLIB="$(RANLIB)"
INSTALL_ARGS = \
	OPT="$(CFLAGS)" \
	HOST="$(GARCH_FAMILY)-dummy-linux" \
	RELEASE="$(LINUX_VERSION)" \
	CROSS_COMPILE="$(GARHOST)-" \
	ZLIB="no" \
	DNS="no" \
	SHARED="yes" \
	DESTDIR="$(DESTDIR)" \
	PREFIX="$(prefix)" \
	SBINDIR="$(sbindir)" \
	SHAREDIR="$(datadir)" \
	IDSDIR="$(datadir)" \
	MANDIR="$(mandir)" \
	INCDIR="$(includedir)" \
	LIBDIR="$(libdir)" \
	PKGCFDIR="$(libdir)/pkgconfig" \
	STRIP="" \
	CC="$(CC)" \
	AR="$(AR)" \
	RANLIB="$(RANLIB)" \
	install-lib

GAR_EXTRA_CONF += kernel-$(mm_KERNEL_VERSION)/linux/package-api.mk
include ../../gar.mk

#CFLAGS  := $(CFLAGS)  -fPIC
#LDFLAGS := $(LDFLAGS) -fPIC

# pciutils 3.3.1 fails to compile with gcc 5.2.0's link time optimization enabled.
#CFLAGS  := $(filter-out -flto, $(CFLAGS))
#LDFLAGS := $(filter-out -flto, $(LDFLAGS))
