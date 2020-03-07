GARNAME = c
CATEGORIES = lang

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	lang/c-build \
	lang/musl \
	lang/libunwind \
	build-tool/make \
	build-tool/ninja \
	build-tool/autotools \
	build-tool/cmake \
	build-tool/meson \
	build-tool/qmake \
	build-tool/meson

include ../../gar.mk

$(DESTIMG)_NODEPEND += lang/c
export $(DESTIMG)_NODEPEND

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
