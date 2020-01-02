GARNAME = kernel
GARVERSION = 5.4
CATEGORIES = kernel-5.4
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	$(filter-out %/Makefile %/kernel,$(subst ../../,,$(wildcard ../../kernel-5.4/*)))

GAR_EXTRA_CONF += kernel-5.4/linux/package-api.mk
include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(LINUX_DIR)
	@rm -rf $(DESTDIR)$(LINUX_MODULESPREFIX)
	@$(MAKE) clean-all -C ../../system/lirc
	@$(MAKE) clean-all -C ../../nvidia
	@$(MAKE) clean     -C ../../kernel/kernel
	@$(foreach dir,$(filter-out %/Makefile,$(wildcard ../../kernel/* ../../kernel-3.*/* ../../kernel-5.*/*)),$(MAKE) -C $(dir) clean ; )
