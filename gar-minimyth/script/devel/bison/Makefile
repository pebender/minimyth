GARNAME = bison
GARVERSION = 3.6.2
CATEGORIES = devel
MASTER_SITES = https://ftp.gnu.org/gnu/bison/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES = $(DISTNAME)-perl.patch.gar
LICENSE = GPL3

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c devel/m4
BUILDDEPS = devel/m4

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-rpath

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/liby.a
	@$(MAKECOOKIE)
