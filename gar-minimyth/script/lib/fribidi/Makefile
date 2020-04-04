GARNAME = fribidi
GARVERSION = 1.0.9
CATEGORIES = lib
MASTER_SITES = https://github.com/fribidi/fribidi/releases/download/v$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = LGPL2_1

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c build-tool/make
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-debug \
	--disable-deprecated \
	CC_FOR_BUILD="$(build_CC)" \
	CPPFLAGS_FOR_BUILD="$(build_CPPFLAGS)" \
	CFLAGS_FOR_BUILD="$(build_CFLAGS)" \
	LDFLAGS_FOR_BUILD="$(build_LDFLAGS)"

include ../../gar.mk

ifeq ($(DESTIMG),build)
CPPFLAGS += -DFRIBIDI_CHUNK_SIZE=4080
endif

post-install:
	@rm -f $(DESTDIR)$(libdir)/libfribidi.la
	@$(MAKECOOKIE)
