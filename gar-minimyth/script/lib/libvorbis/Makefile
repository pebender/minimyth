GARNAME = libvorbis
GARVERSION = 1.3.6
CATEGORIES = lib
MASTER_SITES = https://ftp.osuosl.org/pub/xiph/releases/vorbis/
DISTFILES = $(DISTNAME).tar.xz
xPATCHFILES = \
	$(DISTNAME)-automake_1.13.patch \
	$(DISTNAME)-configure.patch
LICENSE = xiph
xiph_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/libogg
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-docs \
	--disable-examples \
	--disable-oggtest

include ../../gar.mk

post-install:
	rm -f $(DESTDIR)$(libdir)/libvorbis.la
	rm -f $(DESTDIR)$(libdir)/libvorbisenc.la
	rm -f $(DESTDIR)$(libdir)/libvorbisfile.la
	@$(MAKECOOKIE)
