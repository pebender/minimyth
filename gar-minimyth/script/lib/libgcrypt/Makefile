GARNAME = libgcrypt
GARVERSION = 1.6.3
CATEGORIES = lib
MASTER_SITES = ftp://ftp.gnupg.org/gcrypt/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = \
	$(DISTNAME).patch.gar
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libgpg-error

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-asm
CONFIGURE_ENV = \
	CC_FOR_BUILD="$(build_CC)"

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@rm -f $(DESTDIR)$(bindir)/config/libgcrypt-config
	@rm -f $(DESTDIR)$(bindir)/config/$(GARHOST)-libgcrypt-config
	@mkdir -p $(DESTDIR)$(bindir)/config
	@mv $(DESTDIR)$(bindir)/libgcrypt-config $(DESTDIR)$(bindir)/config/libgcrypt-config
	@ln -sf libgcrypt-config $(DESTDIR)$(bindir)/config/$(GARHOST)-libgcrypt-config
	@$(MAKECOOKIE)
	@$(MAKECOOKIE)
