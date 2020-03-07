GARNAME = c-build
CATEGORIES = lang

DESCRIPTION =
define BLURB
endef

BUILDDEPS = lang/c \
	native/native \
	ccache/ccache \
	compiler/compiler \
	lang/libcxx-from-compiler \
	utils/bash \
	utils/coreutils \
	devel/make \
	perl/perl \
	devel/pkg-config \
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
	devel/libtool \
	devel/intltool \
	doc/texinfo

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
