GARNAME = glew
GARVERSION = 2.2.0
CATEGORIES = xorg
MASTER_SITES = https://sourceforge.net/projects/glew/files/glew/$(GARVERSION)/
DISTFILES = $(DISTNAME).tgz
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.txt

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c build-tool/make \
	xorg/glu \
	xorg/libX11 \
	xorg/Mesa

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

BUILD_ARGS  = \
	GLEW_PREFIX="$(prefix)" \
	GLEW_DEST="$(prefix)" \
	BINDIR="$(bindir)" \
	LIBDIR="$(libdir)" \
	INCDIR="$(includedir)/GL" \
	CC="$(CC)" \
	LD="$(CC)" \
	AR="$(AR)" \
	STRIP="true" \
	CFLAGS.EXTRA="$(CFLAGS)" \
	LDFLAGS.EXTRA="$(LDFLAGS)"
INSTALL_ARGS = \
	GLEW_PREFIX="$(prefix)" \
	GLEW_DEST="$(prefix)" \
	BINDIR="$(bindir)" \
	LIBDIR="$(libdir)" \
	INCDIR="$(includedir)/GL" \
	CC="$(CC)" \
	LD="$(CC)" \
	AR="$(AR)" \
	STRIP="true" \
	CFLAGS.EXTRA="$(CFLAGS)" \
	CFLAGS.EXTRA="$(CFLAGS)" \
	LDFLAGS.EXTRA="$(LDFLAGS)"

GAR_EXTRA_CONF += xorg/xorg/package-api.mk
include ../../gar.mk

CFLAGS  := $(CFLAGS)  -fPIC
LDFLAGS := $(LDFLAGS) -fPIC

post-install:
	@rm -f $(DESTDIR)$(libdir)/libGLEW.a
	@$(MAKECOOKIE)
