GARNAME = qmake
CATEGORIES = build-tool
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = build-tool/make
BUILDDEPS = devel/qmake
ifneq ($(GARHOST),$(default_GARHOST))
BUILDDEPS += build-tool/qmake
endif

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
