GARNAME = linux-firmware
GARVERSION = 20200316
CATEGORIES = kernel
MASTER_SITES = https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/
DISTFILES = $(DISTNAME).tar.gz
LICENSE =

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c kernel/linux

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/
	@cp -Rdf $(WORKSRC)/* $(DESTDIR)$(elibdir)/firmware/
	@$(MAKECOOKIE)
