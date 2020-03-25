GARNAME = xz
GARVERSION = 5.2.4
CATEGORIES = utils
MASTER_SITES = https://tukaani.org/xz/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = xz/Public_Domain/GPL2/LGPL2_1/GPL3
xz_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/src/liblzma/Makefile $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-xz \
	--enable-xzdec \
	--enable-lzmadec \
	--enable-lzmainfo \
	--enable-lzma-links \
	--enable-scripts \
	--disable-doc \
	--disable-silent-rules \
	--enable-shared \
	--enable-nls \
	--disable-rpath

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(libdir)/liblzma.la
	@$(MAKECOOKIE)
