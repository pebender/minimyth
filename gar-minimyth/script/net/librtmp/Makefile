GARNAME = rtmpdump
GARVERSION = c5f04a5
CATEGORIES = net
MASTER_SITES = http://git.ffmpeg.org/gitweb/rtmpdump.git/snapshot/
DISTFILES = $(GARVERSION).tar.gz
PATCHFILES = $(DISTNAME)-openssl-1.1.patch
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/openssl lib/zlib

BUILD_SCRIPTS   = $(WORKSRC)/librtmp/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/librtmp/Makefile

BUILD_ARGS   = \
	DESTDIR=$(DESTDIR) \
	prefix=$(prefix) \
	incdir=$(includedir)/librtmp \
	bindir=$(bindir) \
	libdir=$(libdir) \
	mandir=$(mandir) \
	CC="$(CC)" \
	LD="$(LD)" \
	AR="$(AR)" \
	CRYPTO="OPENSSL" \
	XCFLAGS="$(CFLAGS) $(LDFLAGS)"
INSTALL_ARGS = \
	DESTDIR=$(DESTDIR) \
	prefix=$(prefix) \
	incdir=$(includedir)/librtmp \
	bindir=$(bindir) \
	libdir=$(libdir) \
	mandir=$(mandir) \
	CC="$(CC)" \
	LD="$(LD)" \
	AR="$(AR)" \
	CRYPTO="OPENSSL" \
	XCFLAGS="$(CFLAGS) $(LDFLAGS)"

include ../../gar.mk

CFLAGS  := $(CFLAGS)  -fPIC
LDFLAGS := $(LDFLAGS) -fPIC

post-install:
	@rm -f $(DESTDIR)$(libdir)/librtmp.a
	@$(MAKECOOKIE)
