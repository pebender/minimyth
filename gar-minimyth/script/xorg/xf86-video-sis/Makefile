GARNAME = xf86-video-sis
GARVERSION = 0.12.0
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/driver/
DISTFILES = $(DISTNAME).tar.bz2
xPATCHFILES = \
	$(DISTNAME)-git_2014.11.11.patch \
	$(DISTNAME)-pkg_config.patch
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	xorg/libdrm \
	xorg/libpciaccess \
	xorg/util-macros \
	xorg/xorg-server \
	xorg/xorgproto
BUILDDEPS = \
	xorg/xorg-sgml-doctools

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--enable-dri \
	--disable-xaa

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@rm -f $(WORKSRC)/config.cache
	@echo "`echo ac_cv_file_$(DESTDIR)$(includedir)/xorg/dri.h | sed -e 's%[^a-zA-Z0-9]%_%g'`=yes"       >> $(WORKSRC)/config.cache
	@echo "`echo ac_cv_file_$(DESTDIR)$(includedir)/xorg/dristruct.h | sed -e 's%[^a-zA-Z0-9]%_%g'`=yes" >> $(WORKSRC)/config.cache
	@echo "`echo ac_cv_file_$(DESTDIR)$(includedir)/xorg/sarea.h | sed -e 's%[^a-zA-Z0-9]%_%g'`=yes"     >> $(WORKSRC)/config.cache
	@$(MAKECOOKIE)

post-install:
	@rm -fv $(DESTDIR)$(libdir)/xorg/modules/drivers/sis_drv.la
	@$(MAKECOOKIE)
