GARNAME = cxx
CATEGORIES = lang

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

GAR_EXTRA_CONF += lang/lang/toolchain.mk
include ../../gar.mk

$(DESTIMG)_NODEPEND += lang/cxx
export $(DESTIMG)_NODEPEND

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
