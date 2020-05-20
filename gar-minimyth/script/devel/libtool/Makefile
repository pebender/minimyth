GARNAME = libtool
# 2.4.6 fails to install.
GARVERSION = 2.4.2
CATEGORIES = devel
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.gz config.guess config.sub
PATCHFILES = $(DISTNAME)-no_use_linker_plugin.patch $(DISTNAME)-bash.patch.gar $(DISTNAME)-use_ld.patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static

include ../../gar.mk

extract-config.guess: extract-$(DISTNAME).tar.gz
	@cp -fv $(DOWNLOADDIR)/config.guess $(WORKSRC)/libltdl/config/config.guess
	@$(MAKECOOKIE)

extract-config.sub: extract-$(DISTNAME).tar.gz
	@cp -fv $(DOWNLOADDIR)/config.sub $(WORKSRC)/libltdl/config/config.sub
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libltdl.la
	@$(MAKECOOKIE)
