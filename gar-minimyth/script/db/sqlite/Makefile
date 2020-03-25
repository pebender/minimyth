GARNAME = sqlite
GARVERSION = autoconf-3310100
CATEGORIES = db
MASTER_SITES = https://www.sqlite.org/2020/
DISTFILES = $(DISTNAME).tar.gz
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = build-tool/make lib/readline lib/ncursesw lib/zlib
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--enable-readline \
	--enable-threadsafe \
	--enable-dynamic-extensions

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libsqlite3.la
	@$(MAKECOOKIE)
