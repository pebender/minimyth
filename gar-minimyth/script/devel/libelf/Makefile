GARNAME = elfutils
GARVERSION = 0.177
CATEGORIES = devel
MASTER_SITES = https://sourceware.org/$(GARNAME)/ftp/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = LGPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c devel/zlib
BUILDDEPS = devel-tainted/devel-tainted devel/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-textrelcheck \
	--enable-symbol-versioning \
	--enable-nls \
	--with-zlib \
	--without-bzlib \
	--without-lzma \
	--with-biarch

include ../../gar.mk

# elfclassify.c 0.177 fails to compile with gcc 9.2.
CPPFLAGS := -Wno-error
CFLAGS   := -Wno-error
CXXFLAGS := -Wno-error
LDFLAGS  := -Wno-error

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libelf.a
	@$(MAKECOOKIE)
