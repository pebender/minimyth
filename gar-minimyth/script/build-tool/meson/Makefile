GARNAME = meson
CATEGORIES = build-tool
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = build-tool/make build-tool/autotools build-tool/ninja devel/meson
ifneq ($(DESTIMG),build)
BUILDDEPS += build-tool/meson
endif

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
