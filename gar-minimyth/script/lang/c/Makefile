GARNAME = c
CATEGORIES = lang

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c-build \
	toolchain-wrappers/clang-wrappers \
	binutils/binutils \
	lang/libc \
	lang/libcxx \
	build-tool/make \
	devel/pkg-config \
	build-tool/ninja \
	build-tool/autotools \
	build-tool/cmake \
	build-tool/meson \
	build-tool/qmake

GAR_EXTRA_CONF += lang/lang/toolchain.mk
include ../../gar.mk

$(DESTIMG)_NODEPEND += lang/c
export $(DESTIMG)_NODEPEND

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
