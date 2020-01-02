GARNAME = pci.ids
GARVERSION = 20191125
CATEGORIES = data
MASTER_SITES = https://pci-ids.ucw.cz/v2.2/
DISTFILES = pci.ids
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = pci.ids

include ../../gar.mk

extract-pci.ids:
	@mkdir -pv $(WORKSRC)
	@cp -fv $(DOWNLOADDIR)/pci.ids $(WORKSRC)/pci.ids
	@$(MAKECOOKIE)

install-pci.ids:
	@rm -fv $(DESTDIR)$(datadir)/pci.ids
	@cp -fv $(WORKSRC)/pci.ids $(DESTDIR)$(datadir)/pci.ids
	@$(MAKECOOKIE)
