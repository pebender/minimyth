GARNAME = make
CATEGORIES = build-tool
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS =
BUILDDEPS = devel/make
ifneq ($(DESTIMG),build)
BUILDDEPS += build-tool/make
endif

include ../../gar.mk

$(DESTIMG)_NODEPEND += build-tool/make
export $(DESTIMG)_NODEPEND

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
