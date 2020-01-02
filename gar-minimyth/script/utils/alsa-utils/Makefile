GARNAME = alsa-utils
GARVERSION = 1.2.1
CATEGORIES = utils
MASTER_SITES  = ftp://ftp.alsa-project.org/pub/utils/
MASTER_SITES += ftp://ftp.alsa-project.org/pub/testing/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/alsa-lib lib/ncursesw system/udev

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-nls \
	--disable-rpath \
	--enable-alsa-topology \
	--disable-alsatest \
	--disable-alsabat-backend-tiny \
	--enable-bat \
	--enable-alsamixer \
	--enable-alsaconf \
	--disable-xmlto \
	--disable-rst2man \
	--enable-largefile \
	--with-udev-rules-dir="$(libdir)/udev/rules.d" \
	--with-curses=ncursesw

include ../../gar.mk

post-patch:
	@cd $(WORKSRC) ; mv acinclude.m4 m4/acinclude.m4
	@$(MAKECOOKIE)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)
