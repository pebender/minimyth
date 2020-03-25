GARNAME = alsa-lib
GARVERSION = 1.2.1.2
CATEGORIES = lib
MASTER_SITES  = ftp://ftp.alsa-project.org/pub/lib/
MASTER_SITES += ftp://ftp.alsa-project.org/pub/testing/
DISTFILES = $(DISTNAME).tar.bz2
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
	--disable-static \
	--enable-shared \
	--enable-symbolic-functions \
	--disable-debug-assert \
	--disable-resmgr \
	--enable-aload \
	--enable-mixer \
	--enable-pcm \
	--enable-rawmidi \
	--enable-hwdep \
	--enable-seq \
	--enable-ucm \
	--enable-topology \
	--disable-alisp \
	--disable-old-symbols \
	--disable-mixer-modules \
	--disable-mixer-pymods \
	--disable-python \
	--disable-python2 \
	--enable-thread-safety \
	--with-versioned \
	--without-debug \
	--with-tmpdir="$(rootdir)/tmp" \
	--with-alsa-devdir="$(rootdir)/dev/snd" \
	--with-aload-devdir="$(rootdir)/dev"

include ../../gar.mk

CFLAGS += -fPIC
CXXFLAGS += -fPIC

post-install:
	@rm -f $(DESTDIR)$(libdir)/libasound.la
	@rm -f $(DESTDIR)$(libdir)/libatopology.la
	@$(MAKECOOKIE)
