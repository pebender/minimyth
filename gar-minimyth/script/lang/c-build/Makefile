GARNAME = c-build
CATEGORIES = lang

DESCRIPTION =
define BLURB
endef

BUILDDEPS = lang/c \
	native/native \
	toolchain-build/toolchain-build \
	utils/bash \
	utils/coreutils \
	devel/make \
	devel/pkg-config \
	perl/perl \
	python/python \
	utils/tar \
	utils/gzip \
	utils/bzip2 \
	utils/xz \
	utils/unzip \
	utils/lzip \
	devel/patch \
	utils/which \
	utils/ed \
	utils/sed \
	utils/grep \
	utils/gawk \
	devel/bison \
	devel/flex \
	utils/diffutils \
	utils/file \
	utils/findutils \
	devel/m4 \
	devel/gettext \
	devel/autoconf \
	devel/autoconf-archive \
	devel/automake \
	devel/intltool \
	devel/libtool \
	doc/texinfo \
	devel/ninja \
	devel/cmake \
	devel/meson \
	devel/qmake

GAR_EXTRA_CONF += lang/lang/toolchain.mk
include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
