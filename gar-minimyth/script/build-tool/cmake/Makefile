GARNAME = cmake
CATEGORIES = build-tool
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = build-tool/make build-tool/ninja
BUILDDEPS = devel/cmake
ifneq ($(DESTIMG),build)
BUILDDEPS += build-tool/cmake
endif

include ../../gar.mk

$(DESTIMG)_NODEPEND += build-tool/cmake
export $(DESTIMG)_NODEPEND

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
