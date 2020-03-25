GARNAME = libcdaudio
GARVERSION = 0.99.12p2
CATEGORIES = lib
MASTER_SITES = https://sourceforge.net/projects/libcdaudio/files/libcdaudio/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = \
	$(DISTNAME)-automake_1.12.patch \
	$(DISTNAME)-automake_1.13.patch \
	$(DISTNAME)-DESTDIR.patch.gar
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c build-tool/autotools
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--enable-threads

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libcdaudio.la
	@rm -f $(DESTDIR)$(bindir)/config/libcdaudio-config
	@rm -f $(DESTDIR)$(bindir)/config/$(GARHOST)-libcdaudio-config
	@mkdir -p $(DESTDIR)$(bindir)/config
	@mv $(DESTDIR)$(bindir)/libcdaudio-config $(DESTDIR)$(bindir)/config/libcdaudio-config
	@ln -s libcdaudio-config $(DESTDIR)$(bindir)/config/$(GARHOST)-libcdaudio-config
	@$(MAKECOOKIE)
