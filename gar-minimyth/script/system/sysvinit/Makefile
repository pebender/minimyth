GARNAME = sysvinit
GARVERSION = 2.96
CATEGORIES = system
MASTER_SITES = https://download.savannah.gnu.org/releases/sysvinit/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES = $(DISTNAME)-init_silent.patch $(DISTNAME)-makefile.patch $(DISTNAME)-halt.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

BUILD_SCRIPTS   = $(WORKSRC)/src/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/src/Makefile

DEFAULT_ARGS = \
	CC="$(CC)" \
        CFLAGS="$(CFLAGS) -D_GNU_SOURCE" \
        LDFLAGS="$(LDFLAGS)" \
	INSTALL="install" \
	ROOT="$(DESTDIR)" \
	MANDIR="$(mandir)" \
	CONFDIR="$(sysconfdir)" \
	BINDIR="$(ebindir)" \
	USRBINDIR="$(bindir)" \
	SBINDIR="$(esbindir)" \
	USRLIBDIR="$(libdir)" \
	INCLUDEDIR="$(includedir)"
BUILD_ARGS   = $(DEFAULT_ARGS)
INSTALL_ARGS = $(DEFAULT_ARGS)

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

#LDFLAGS := $(CFLAGS) $(LDFLAGS)
