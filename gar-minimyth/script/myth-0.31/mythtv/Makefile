GARNAME = mythtv
GARVERSION = $(MYTHTV_GARVERSION)
CATEGORIES = $(CATEGORY)
MASTER_SITES = git://github.com/MythTV/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES  =
PATCHFILES += \
	$(GARNAME)-$(word 1,$(subst -, ,$(GARVERSION)))-posix_headers.patch \
	$(GARNAME)-$(word 1,$(subst -, ,$(GARVERSION)))-disable_fstab.patch \
	$(GARNAME)-$(word 1,$(subst -, ,$(GARVERSION)))-disable_perl_checks.patch \
	$(GARNAME)-$(word 1,$(subst -, ,$(GARVERSION)))-disable_perl_inet6_check.patch \
	$(GARNAME)-$(word 1,$(subst -, ,$(GARVERSION)))-mythmusic_no_mythuiwebbrowser.patch \
	$(GARNAME)-$(word 1,$(subst -, ,$(GARVERSION)))-mythmusic_button_list_quick_scroll.patch \
	$(GARNAME)-$(word 1,$(subst -, ,$(GARVERSION)))-mythnetvision_oauth.patch \
	$(GARNAME)-$(word 1,$(subst -, ,$(GARVERSION)))-python_build.patch \
	$(GARNAME)-$(word 1,$(subst -, ,$(GARVERSION)))-sysroot.patch \
	$(GARNAME)-$(word 1,$(subst -, ,$(GARVERSION)))-networkcontrol.patch \
	$(GARNAME)-$(word 1,$(subst -, ,$(GARVERSION))).patch.gar \
	$(GARNAME)-$(word 1,$(subst -, ,$(GARVERSION)))-init.patch \
	$(GARNAME)-$(word 1,$(subst -, ,$(GARVERSION)))-programid.patch \
	$(GARNAME)-$(word 1,$(subst -, ,$(GARVERSION)))-wshadow.patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	lang/cxx \
	lib/alsa-lib \
	lib/avahi \
	lib/exiv2 \
	lib/fftw3 \
	lib/fftw3f \
	lib/fontconfig \
	lib/freetype \
	lib/libass \
	lib/libavc1394 \
	lib/libcdio-paranoia \
	lib/libbluray \
	lib/libcec \
	lib/liblzo \
	lib/libiec61883 \
	lib/libsamplerate \
	lib/libxml2 \
	lib/openssl \
	lib/taglib \
	lib/zlib \
	perl/perl \
		perl/perl-DBD-mysql \
		perl/perl-DBI \
		perl/perl-HTTP-Message \
		perl/perl-IO-Socket-INET6 \
		perl/perl-libwww-perl \
		perl/perl-Net-UPnP \
		perl/perl-XML-Simple \
	qt/qtbase \
	qt/qtscript \
	system/lirc \
	system/udev \
	utils/util-linux \
	X11/libva \
	X11/libvdpau \
	xorg/libdrm \
	xorg/libX11 \
	xorg/libXext \
	xorg/libXinerama \
	xorg/libXrandr \
	xorg/libXxf86vm \
	xorg/Mesa
BUILDDEPS = \
	devel/yasm \
	python3/python \
	python3/python-lxml

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

PWD := $(shell pwd)

CONFIGURE_SCRIPTS = $(WORKSRC)/mythtv/configure
BUILD_SCRIPTS     = $(WORKSRC)/mythtv/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/mythtv/Makefile source

CONFIGURE_ARGS = \
	--compile-type=$(if $(filter yes,$(mm_DEBUG)),"debug","release") \
	--prefix="$(DESTDIR)$(prefix)" \
	--runprefix="$(prefix)" \
	--libdir-name="$(patsubst $(prefix)/%,%,$(libdir))" \
	--disable-ccache \
	--disable-distcc \
--bindir="$(DESTDIR)$(bindir)" \
--datadir="$(DESTDIR)$(datadir)/mythtv" \
--libdir="$(DESTDIR)$(libdir)" \
--shlibdir="$(DESTDIR)$(libdir)" \
--incdir="$(DESTDIR)$(includedir)/mythtv" \
--mandir="$(DESTDIR)$(mandir)" \
$(if $(filter -Os,$(CFLAGS)),--enable-small) \
	--cross-prefix="$(GARHOST)-" \
	--cross-prefix-cc="$(GARHOST)-" \
	--enable-cross-compile \
	--sysroot="$(DESTDIR)" \
	--sysinclude="$(DESTDIR)$(includedir)" \
--target-os="linux" \
--nm="$(NM)" \
--as="$(CC)" \
	--cc="$(CC)" \
	--cxx="$(CXX)" \
	--ld="$(CC)" \
	--qmake="$(build_DESTDIR)$(build_qt5bindir)/qmake" \
--host-cc="$(build_CC)" \
--host-cflags="$(build_CFLAGS)" \
--host-ldflags="$(build_LDFLAGS)" \
	--extra-cflags="$(CFLAGS)" \
	--extra-cxxflags="$(CXXFLAGS)" \
	--extra-ldflags="$(LDFLAGS)" \
	--enable-symbol-visibility \
	--enable-deprecation-warnings \
	--arch=$(GARCH_FAMILY) \
	--tune=$(GARCH) \
	--cpu=$(GARCH) \
	--disable-altivec \
	--enable-amd3dnow \
	--enable-amd3dnowext \
	--enable-mmx \
	--enable-mmxext \
	--enable-sse \
	--enable-sse2 \
	--enable-sse3 \
	--enable-sse4 \
	--enable-sse42 \
	--enable-ssse3 \
	--enable-avx \
	--enable-x86asm \
	--enable-yasm \
	--enable-pic \
	--disable-proc-opt \
	--enable-compdb \
	--enable-audio-oss \
	--enable-audio-alsa \
	--disable-audio-jack \
	--disable-audio-pulseoutput \
	--disable-valgrind \
	--enable-lirc \
	--enable-joystick-menu \
	--enable-libcec \
	--libcec-path="$(DESTDIR)$(includedir)" \
	--enable-firewire \
	--disable-hdhomerun \
	--disable-vbox \
	--disable-ceton \
	--enable-v4l2 \
	--enable-ivtv \
	--enable-hdpvr \
	--enable-dvb \
	--dvb-path="$(DESTDIR)$(includedir)" \
	--disable-asi \
	--enable-x11 \
	--x11-path="$(DESTDIR)$(includedir)" \
	--enable-xrandr \
	--enable-vdpau \
	--enable-vaapi \
	--disable-nvdec \
	--disable-dxva2 \
	--disable-mediacodec \
	--disable-mmal \
	--enable-libass \
	--enable-systemd_notify \
	--enable-systemd_journal \
	--disable-mac-bundle \
	--enable-libxml2 \
	--libxml2-path="$(DESTDIR)$(includedir)/libxml2" \
	--enable-libdns_sd \
	--enable-libcrypto \
	--with-bindings="perl" \
	--without-bindings="php" \
	--with-bindings="python" \
	--disable-bdjava \
	--disable-libmp3lame \
	--disable-libx264 \
	--disable-libx265 \
	--disable-libvpx \
	--disable-libxvid \
	--disable-sdl \
	--disable-sdl2 \
	--disable-ffplay

BUILD_ARGS = \
	Q=""

CONFIGURE_ENV  = $(MYTHTV_CONFIGURE_ENV)
BUILD_ENV      = $(MYTHTV_BUILD_ENV)
INSTALL_ENV    = $(MYTHTV_INSTALL_ENV)

CONFIGURE_ENV += pkg_config=pkg-config
BUILD_ENV     += PYTHONXCPREFIX=$(DESTDIR)$(prefix)
INSTALL_ENV   += PYTHONPATH=$(DESTDIR)$(PYTHON3_libdir)/site-packages

GAR_EXTRA_CONF += perl/perl/package-api.mk
GAR_EXTRA_CONF += python3/python/package-api.mk
include ../../gar.mk

# MythTV does not look in the default include install directory for dns_sd.h.
CPPFLAGS += -I$(DESTDIR)$(includedir)/avahi-compat-libdns_sd
CFLAGS   += -I$(DESTDIR)$(includedir)/avahi-compat-libdns_sd
CXXFLAGS += -I$(DESTDIR)$(includedir)/avahi-compat-libdns_sd

CPPFLAGS += -D_GNU_SOURCE
CFLAGS += -D_GNU_SOURCE
CXXFLAGS += -D_GNU_SOURCE

LDFLAGS  += -Wl,-z,notext

git//%/$(DISTNAME).tar.bz2:
	$(call FETCH_GIT, $*/mythtv.git, $(word 3,$(subst -, ,$(GARVERSION))), $(DISTNAME))

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

install-source:
	@rm -rf $(DESTDIR)$(MYTHTV_SOURCEDIR)
	@mkdir -p $(DESTDIR)$(MYTHTV_SOURCEDIR)
	@rm -rf $(DESTDIR)$(MYTHTV_SOURCEDIR)
	@ln -sf $(PWD)/$(WORKSRC)/mythtv $(DESTDIR)$(MYTHTV_SOURCEDIR)
	@$(MAKECOOKIE)

post-install: post-install-mythtv-version
	@rm -f $(DESTDIR)$(bindir)/mythtv
	@mv $(DESTDIR)$(bindir)/mythavtest $(DESTDIR)$(bindir)/mythtv
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(bindir)/mtd
	@rm -rf $(DESTDIR)$(bindir)/myth*
	@rm -rf $(DESTDIR)$(datadir)/myth*
	@rm -rf $(DESTDIR)$(includedir)/myth*
	@rm -rf $(DESTDIR)$(libdir)/libmyth*
	@rm -rf $(DESTDIR)$(libdir)/myth*
	@rm -rf $(DESTDIR)$(libdir)/python*/site-packages/MythTV
	@rm -rf $(DESTDIR)$(libdir)/python*/site-packages/MythTV-*
	@$(foreach dir,$(filter-out %/Makefile,$(wildcard ../../myth/* ../../myth-*/*)),$(MAKE) -C $(dir) clean ; )

source-update:
	@$(MAKE) source-update-source
	@$(MAKE) source-update-patches

source-update-source:
	@$(MAKE) clean
	@$(MAKE) fetch
	@$(MAKE) $(GARCHIVEDIR)/$(DISTNAME).tar.bz2
	@$(MAKE) clean

source-update-patches:
	@$(MAKE) clean
	@$(MAKE) extract
	@$(foreach PATCHFILE, $(PATCHFILES), \
		cd $(WORKDIR) || exit 1 ; \
		mv $(DISTNAME) $(DISTNAME)-old || exit 1 ; \
		cp -r $(DISTNAME)-old $(DISTNAME)-new || exit 1 ; \
		cd $(DISTNAME)-new || exit 1 ; \
		SIMPLE_BACKUP_SUFFIX=.gar-source-update-patches patch -p1 < ../../../files/$(PATCHFILE) || exit 1 ; \
		cd ../ || exit 1 ; \
		find $(DISTNAME)-new -name *.gar-source-update-patches -exec rm {} \; || exit 1 ; \
		( diff -Naur $(DISTNAME)-old $(DISTNAME)-new > ../../files/$(PATCHFILE) ; test $$? -lt 2 ) || exit 1 ; \
		rm -fr $(DISTNAME)-old || exit 1 ; \
		mv $(DISTNAME)-new $(DISTNAME) || exit 1 ; \
		cd ../../ || exit 1 ; \
		rm -f checksums~ || exit 1 ; \
		cat checksums | grep -v $(DOWNLOADDIR)/$(PATCHFILE) > checksums~ || true ; \
		md5sum $(DOWNLOADDIR)/$(PATCHFILE) >> checksums~ || exit 1 ; \
		rm -f checksums || exit 1 ; \
		mv -f checksums~ checksums || exit 1 ; )
	@$(MAKE) clean
