GARNAME = autotools
CATEGORIES = build-tool

DESCRIPTION = 
define BLURB
endef

DEPENDS = build-tool/make devel/gettext
BUILDDEPS = devel/autoconf devel/automake devel/intltool devel/libtool
ifneq ($(DESTIMG),build)
BUILDDEPS += build-tool/autotools
endif

include ../../gar.mk

$(DESTIMG)_NODEPEND += build-tool/autotools
export $(DESTIMG)_NODEPEND

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
