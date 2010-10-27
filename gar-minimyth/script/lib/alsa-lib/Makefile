GARNAME = alsa-lib
GARVERSION = 1.0.23
CATEGORIES = lib
MASTER_SITES = ftp://ftp.alsa-project.org/pub/lib/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--enable-symbolic-functions \
	--disable-debug-assert \
	--enable-aload \
	--disable-resmgr \
	--enable-mixer \
	--enable-pcm \
	--enable-rawmidi \
	--enable-hwdep \
	--enable-seq \
	--enable-alisp \
	--disable-old-symbols \
	--disable-python \
	--with-gnu-ld \
	--with-versioned \
	--without-debug \
	--with-tmpdir="$(rootdir)/tmp" \
	--with-alsa-devdir="$(rootdir)/dev/snd" \
	--with-aload-devdir="$(rootdir)/dev"

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libasound.la
	@rm -f $(DESTDIR)$(libdir)/alsa-lib/smixer/smixer-sbase.la
	@rm -f $(DESTDIR)$(libdir)/alsa-lib/smixer/smixer-ac97.la
	@rm -f $(DESTDIR)$(libdir)/alsa-lib/smixer/smixer-hda.la
	@$(MAKECOOKIE)