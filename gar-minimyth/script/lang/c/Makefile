GARNAME = c
GARVERSION = none
CATEGORIES = lang

DESCRIPTION =
define BLURB
endef

DEPENDS    = lib/libgcc
BUILDDEPS  = lang/c
DEPENDS   += \
	devel/meson \
	devel/pkg-config
# Development tools often used when building c language programs.
BUILDDEPS += \
	utils/bash \
	utils/coreutils \
	utils/lzip \
	utils/ed \
	utils/sed \
	utils/gawk \
	utils/grep \
	perl/perl \
	devel/pkg-config \
	python/python \
	devel/cmake \
	devel/meson \
	utils/m4 \
	utils/diffutils \
	utils/findutils \
	devel/bison \
	devel/flex \
	devel/gettext \
	devel/autoconf \
	devel/autoconf-archive \
	devel/automake \
	devel/libtool \
	devel/intltool \
	devel/patch \
	utils/which \
	utils/file \
	utils/tar \
	utils/xz \
	utils/bzip2 \
	utils/gzip \
	utils/unzip \
	doc/texinfo \
	devel/ruby

include ../../gar.mk

$(DESTIMG)_NODEPEND += lang/c
export $(DESTIMG)_NODEPEND

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
