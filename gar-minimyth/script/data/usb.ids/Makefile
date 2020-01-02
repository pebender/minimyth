GARNAME = usb.ids
GARVERSION = 20191105
CATEGORIES = data
MASTER_SITES = http://www.linux-usb.org/
DISTFILES = usb.ids
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = usb.ids

include ../../gar.mk

extract-usb.ids:
	@mkdir -pv $(WORKSRC)
	@cp -fv $(DOWNLOADDIR)/usb.ids $(WORKSRC)/usb.ids
	@$(MAKECOOKIE)

install-usb.ids:
	@rm -fv $(DESTDIR)$(datadir)/usb.ids
	@cp -fv $(WORKSRC)/usb.ids $(DESTDIR)$(datadir)/usb.ids.
	@$(MAKECOOKIE)
