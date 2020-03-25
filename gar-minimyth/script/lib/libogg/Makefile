GARNAME = libogg
GARVERSION = 1.3.4
CATEGORIES = lib
MASTER_SITES = https://ftp.osuosl.org/pub/xiph/releases/ogg/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = xiph
xiph_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--enable-crc

include ../../gar.mk

post-install:
	@rm -fv $(DESTDIR)$(libdir)/libogg.la
	@$(MAKECOOKIE)
