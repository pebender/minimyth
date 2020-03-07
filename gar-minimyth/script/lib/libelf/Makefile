GARNAME = libelf
GARVERSION = 0.8.13
CATEGORIES = devel
MASTER_SITES = http://www.mr511.de/software/
MASTER_SITES += https://fossies.org/linux/misc/old/
MASTER_SITES += https://ftp.osuosl.org/pub/blfs/conglomeration/libelf/
DISTFILES = $(DISTNAME).tar.gz
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-compat \
	--disable-nls \
	--enable-shared
INSTALL_ARGS = \
	instroot="$(DESTDIR)"

include ../../gar.mk

x-post-install:
	@rm -rf $(DESTDIR)$(libdir)/libelf.a
	@$(MAKECOOKIE)
