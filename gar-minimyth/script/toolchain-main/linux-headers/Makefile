GARNAME = linux-headers
GARVERSION = $(LINUX_FULL_VERSION)
CATEGORIES = kernel-headers
SOURCEPKG = kernel/linux
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = tainted-$(DESTIMG)
BUILDDEPS = toolchain-build/toolchain-build net/rsync utils/unifdef

WORKSRC = $(WORKDIR)/linux-$(GARVERSION)

INSTALL_SCRIPTS = custom

INSTALL_ARGS = $(LINUX_MAKE_ARGS)

INSTALL_ENV = $(LINUX_MAKE_ENV)

GAR_EXTRA_CONF += kernel/linux/package-api.mk
include ../../gar.mk

install-custom:
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) headers_install
	@mkdir -p $(DESTDIR)$(includedir)
	@cp -rf $(WORKSRC)/usr/include/* $(DESTDIR)$(includedir)
	@$(MAKECOOKIE)
