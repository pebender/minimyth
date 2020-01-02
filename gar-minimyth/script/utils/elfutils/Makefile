GARNAME = elfutils
GARVERSION = 0.178
CATEGORIES = devel
MASTER_SITES = https://sourceware.org/$(GARNAME)/ftp/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = LGPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lib/zlib utils/bzip2 utils/xz
BUILDDEPS = devel-tainted/devel-tainted devel/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-textrelcheck \
	--disable-symbol-versioning \
	--enable-nls \
	--disable-debuginfod \
	--with-zlib \
	--with-bzlib \
	--with-lzma

include ../../gar.mk

# libelf 0.178  fails to compile with gcc 9.2.0.
CFLAGS  := -Wno-stack-usage
LDFLAGS := -Wno-stack-usage

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libelf.a
	@$(MAKECOOKIE)
