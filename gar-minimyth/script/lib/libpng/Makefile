GARNAME = libpng
GARVERSION = 1.6.37
CATEGORIES = lib
MASTER_SITES = https://sourceforge.net/projects/libpng/files/libpng16/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES = \
	$(DISTNAME).patch.gar
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--enable-unversioned-links \
  	--enable-unversioned-libpng-pc \
	--enable-unversioned-libpng-config \
	--enable-hardware-optimizations \
	--with-binconfigs

CONFIGURE_ENV = \
	ac_cv_func_strtod="yes"

include ../../gar.mk

post-install:
	@rm -fv $(DESTDIR)$(libdir)/libpng.la
	@rm -fv $(DESTDIR)$(libdir)/libpng16.la
	@mkdir -pv $(DESTDIR)$(bindir)/config.d
	@rm -fv $(DESTDIR)$(bindir)/config.d/libpng16-config
	@rm -fv $(DESTDIR)$(bindir)/config.d/$(GARHOST)-libpng16-config
	@mv -v $(DESTDIR)$(bindir)/libpng16-config $(DESTDIR)$(bindir)/config.d/libpng16-config
	@ln -sfv libpng16-config $(DESTDIR)$(bindir)/config.d/$(GARHOST)-libpng16-config
	@rm -fv $(DESTDIR)$(bindir)/config.d/libpng-config
	@rm -fv $(DESTDIR)$(bindir)/config.d/$(GARHOST)-libpng-config
	@mv -v $(DESTDIR)$(bindir)/libpng-config $(DESTDIR)$(bindir)/config.d/libpng-config
	@ln -sfv libpng-config $(DESTDIR)$(bindir)/config.d/$(GARHOST)-libpng-config
	@$(MAKECOOKIE)
