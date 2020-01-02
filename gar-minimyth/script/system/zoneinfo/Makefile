GARNAME = zoneinfo
GARVERSION = 2019c
CATEGORIES = system
MASTER_SITES = https://www.iana.org/time-zones/repository/releases/
DISTFILES = tzcode$(GARVERSION).tar.gz tzdata$(GARVERSION).tar.gz
LICENSE = Public_Domain

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c
ifneq ($(DESTIMG),build)
BUILDDEPS = system/zoneinfo
endif

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

DEFAULT_ARGS  = \
	TZDEFAULT="$(sysconfdir)/localtime" \
	USRDIR="$(prefix)" \
	USRSHAREDIR="$(datadir)" \
	TZDIR_BASENAME="zoneinfo" \
	TZDIR="$(datadir)/zoneinfo" \
	BINDIR="$(bindir)" \
	ZDUMPDIR="$(ebindir)" \
	ZICDIR="$(sbindir)" \
	MANDIR="$(mandir)" \
	LIBDIR="$(libdir)" \
	cc="$(CC)"
ifneq ($(DESTIMG),build)
DEFAULT_ARGS += \
	zic="$(build_DESTDIR)$(build_sbindir)/zic"
endif

BUILD_ARGS    = $(DEFAULT_ARGS)
INSTALL_ARGS  = $(DEFAULT_ARGS)

include ../../gar.mk

CFLAGS := $(CFLAGS) -DTZDIR=\"$(datadir)/zoneinfo\"

extract-%:
	@mkdir -p $(WORKSRC)
	@gzip -dc $(DOWNLOADDIR)/$* | tar -xf - -C $(WORKSRC)
	@$(MAKECOOKIE)
