GARNAME = linux-headers
GARVERSION = $(LINUX_FULL_VERSION)
CATEGORIES = tainted-main
SOURCEPKG = kernel/linux
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	native/native \
	tainted-build/tainted-build

WORKSRC = $(WORKDIR)/linux-$(GARVERSION)

INSTALL_SCRIPTS = custom

INSTALL_ARGS = $(LINUX_MAKE_ARGS)

INSTALL_ENV = $(LINUX_MAKE_ENV)

GAR_EXTRA_CONF += tainted-main/tainted-main/toolchain.mk
GAR_EXTRA_CONF += kernel/linux/package-api.mk
include ../../gar.mk

install-custom:
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) headers
	@find $(WORKSRC)/usr/include -name '.*' -delete
	@rm -fv $(WORKSRC)/usr/include/Makefile
	@mkdir -pv $(DESTDIR)$(includedir)
	@cp -rfv $(WORKSRC)/usr/include/* $(DESTDIR)$(includedir)
	@$(MAKECOOKIE)
