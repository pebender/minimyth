GARNAME = cxx
CATEGORIES = lang

DESCRIPTION =
define BLURB
endef

ifneq ($(GARHOST),$(GARBUILD))
DEPENDS = lang/c lang/libcxx
else
DEPENDS = lang/c
endif

include ../../gar.mk

$(DESTIMG)_NODEPEND += lang/cxx
export $(DESTIMG)_NODEPEND

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
