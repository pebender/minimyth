GARNAME = syslinux
GARVERSION = 6.04-pre1
CATEGORIES = net
MASTER_SITES = http://www.kernel.org/pub/linux/utils/boot/syslinux/$(word 1,$(subst ., ,$(GARVERSION))).xx/
MASTER_SITES += https://www.kernel.org/pub/linux/utils/boot/syslinux/Testing/$(word 1,$(subst -, ,$(GARVERSION)))/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth
	@cp -f $(WORKSRC)/bios/core/pxelinux.0 $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/pxelinux.0
	@mkdir -p $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/pxelinux.cfg
	@$(MAKECOOKIE)
