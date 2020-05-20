GARNAME = regionset
GARVERSION = 0.2
CATEGORIES = utils
MASTER_SITES = http://linvdr.org/download/regionset/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-fpos64_t.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = custom

BUILD_ARGS = \
	CC="$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS)"

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -f $(WORKSRC)/regionset $(DESTDIR)$(bindir)
	@$(MAKECOOKIE)
