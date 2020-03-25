GARNAME = texinfo
GARVERSION = 6.7
CATEGORIES = doc
MASTER_SITES = https://ftp.gnu.org/gnu/texinfo/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/make lib/ncursesw devel/gettext
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-rpath \
	--disable-nls

include ../../gar.mk

post-install:
	@rm -fv $(DESTDIR)$(libdir)/texinfo/MiscXS.la
	@rm -fv $(DESTDIR)$(libdir)/texinfo/Parsetexi.la
	@rm -fv $(DESTDIR)$(libdir)/texinfo/XSParagraph.la
	@$(MAKECOOKIE)
