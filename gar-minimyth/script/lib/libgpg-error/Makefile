GARNAME = libgpg-error
# versions 1.13, 1.14, 1.15, 1.16, 1.17, 1.18 and 1.19 do not cross compile.
GARVERSION = 1.12
CATEGORIES = lib
MASTER_SITES = ftp://ftp.gnupg.org/gcrypt/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = \
	$(DISTNAME)-gawk_5.0.patch \
	$(DISTNAME)-gcc_5.0-fix.patch \
	$(DISTNAME).patch.gar
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--disable-nls \
	--disable-rpath \
	--disable-languages
CONFIGURE_ENV = \
	CC_FOR_BUILD="$(build_CC)"

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@rm -f $(DESTDIR)$(bindir)/config/gpg-error-config
	@rm -f $(DESTDIR)$(bindir)/config/$(GARHOST)-gpg-error-config
	@mkdir -p $(DESTDIR)$(bindir)/config
	@mv $(DESTDIR)$(bindir)/gpg-error-config $(DESTDIR)$(bindir)/config/gpg-error-config
	@ln -sf gpg-error-config $(DESTDIR)$(bindir)/config/$(GARHOST)-gpg-error-config
	@$(MAKECOOKIE)
	@$(MAKECOOKIE)
