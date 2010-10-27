GARNAME = minimyth
GARVERSION = $(mm_VERSION)
CATEGORIES = meta
LICENSE = minimyth
DISTFILES = $(DISTNAME).tar.bz2
minimyth_LICENSE_TEXT = $(mm_HOME)/html/minimyth/license.txt

DESCRIPTION =
define BLURB
endef

MINIMYTHIMG = main

DESTIMG = $(MINIMYTHIMG)

DEPENDS = \
	system/acpid \
	system/aquosserver \
	utils/alsa-utils \
	system/bdremote-ng \
	utils/busybox \
	net/curl \
	disk/e2fsprogs \
	disk/eject \
	utils/ethtool \
	system/eventlircd \
	utils/evtest \
	devel/fakeroot \
	system/g15daemon \
	devel/glibc-locale \
	$(if $(filter i386,$(mm_GARCH_FAMILY)),net/gpxe) \
	disk/hdparm \
	net/ifplugd \
	system/iguanair \
	net/iputils \
	system/irclient \
	system/irserver \
	system/irxkeys \
	system/lcdproc \
	net/lighttpd \
	system/kbdd \
	kernel/kernel \
	fonts/liberation-fonts \
	system/lirc \
	utils/lm_sensors \
	utils/lsdvd \
	utils/lsof \
	utils/microcode_ctl \
	utils/module-init-tools \
	net/mount.cifs \
	myth-$(mm_MYTH_VERSION)/myththemes \
	myth-$(mm_MYTH_VERSION)/myththemes-addons \
	$(if $(filter-out 0.20 0.20-softpad 0.21,$(mm_MYTH_VERSION)), myth-$(mm_MYTH_VERSION)/myththemes-blue-abstract-wide) \
	$(if $(filter 0.22,$(mm_MYTH_VERSION)), myth-$(mm_MYTH_VERSION)/myththemes-old) \
	myth-$(mm_MYTH_VERSION)/mythtv \
	lib/ncursesw \
	net/nfs-utils \
	net/ntp \
	net/openssh \
	utils/pciutils \
	perl/perl \
	perl/perl-Date-Manip \
	perl/perl-Lchown \
	perl/perl-MiniMyth \
	perl/perl-RFLibs \
	perl/perl-Regexp-Wildcards \
	utils/pmount \
	net/portmap \
	system/powernowd \
	utils/procps \
	python/python \
	X11/ratpoison \
	utils/regionset \
	X11/rxvt \
	utils/SDL-Test \
	system/splashutils \
	utils/squashfs \
	net/syslinux \
	system/sysvinit \
	system/udev \
	X11/unclutter \
	utils/usbutils \
	utils/util-linux-ng \
	X11/vdpau-video \
	X11/vdpauinfo \
	net/wakelan \
	X11/x11vnc \
	X11/xbindkeys \
	X11/xmacro \
	xorg/xorg \
	X11/xosd \
	X11/xscreensaver \
	X11/xvattr \
	system/zoneinfo \
	$(if $(filter nvidia,$(mm_GRAPHICS)), \
		nvidia/nvidia-$(mm_NVIDIA_VERSION)) \
	$(if $(filter mythbrowser,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythbrowser),myth-$(mm_MYTH_VERSION)/mythbrowser)) \
	$(if $(filter mythdvd,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythdvd),myth-$(mm_MYTH_VERSION)/mythdvd)) \
	$(if $(filter mythgallery,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythgallery),myth-$(mm_MYTH_VERSION)/mythgallery)) \
	$(if $(filter mythgame,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythgame),myth-$(mm_MYTH_VERSION)/mythgame) \
		emulators/fceu \
		emulators/jzintv \
		emulators/mednafen \
		emulators/stella \
		$(if $(filter mame,$(mm_SOFTWARE)),emulators/mame) \
		emulators/VisualBoyAdvance \
		$(if $(filter i386,$(mm_GARCH_FAMILY)),emulators/zsnes)) \
	$(if $(filter mythmusic,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythmusic),myth-$(mm_MYTH_VERSION)/mythmusic)) \
	$(if $(filter mythnetvision,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythnetvision),myth-$(mm_MYTH_VERSION)/mythnetvision) \
		$(if $(filter python,$(mm_SOFTWARE)), \
			python/python-lxml \
			python/python-MySQL-python \
			python/python-pycurl)) \
	$(if $(filter mythnews,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythnews),myth-$(mm_MYTH_VERSION)/mythnews)) \
	$(if $(filter mythphone,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythphone),myth-$(mm_MYTH_VERSION)/mythphone)) \
	$(if $(filter mythstream,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythstream),myth-$(mm_MYTH_VERSION)/mythstream) \
		perl/perl-HTML-Parser \
		perl/perl-libwww-perl \
		perl/perl-XML-DOM \
		perl/perl-XML-XQL) \
	$(if $(filter mythvideo,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythvideo),myth-$(mm_MYTH_VERSION)/mythvideo) \
		perl/perl-HTML-Parser \
		perl/perl-libwww-perl \
		perl/perl-URI \
		$(if $(filter python,$(mm_SOFTWARE)), \
			python/python-BeautifulSoup \
			python/python-IMDbPY \
			python/python-Imaging \
			python/python-MySQL-python)) \
	$(if $(filter mythweather,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythweather),myth-$(mm_MYTH_VERSION)/mythweather) \
		$(if $(filter 0.20 0.20-softpad 0.21 0.22 0.23,$(mm_MYTH_VERSION)), \
			perl/perl-Date-Manip \
			perl/perl-Image-Size \
			perl/perl-libwww-perl \
			perl/perl-SOAP-Lite \
			perl/perl-XML-Parser \
			perl/perl-XML-SAX \
			perl/perl-XML-Simple \
			, \
			perl/perl-Date-Manip \
			perl/perl-DateTime-Format-ISO8601 \
			perl/perl-Image-Size \
			perl/perl-SOAP-Lite \
			perl/perl-XML-Simple \
			perl/perl-XML-XPath)) \
	$(if $(filter mythzoneminder,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythzoneminder),myth-$(mm_MYTH_VERSION)/mythzoneminder)) \
	$(if $(filter flash,$(mm_SOFTWARE)), \
		gtk/gtk \
		lib/nss) \
	$(if $(filter gnash,$(mm_SOFTWARE)), \
		mediaplayers/gnash) \
	$(if $(filter mplayer-svn,$(mm_SOFTWARE)), \
		mediaplayers/mplayer-svn \
		mediaplayers/mplayer-resumer) \
	$(if $(filter mplayer-vld,$(mm_SOFTWARE)), \
		mediaplayers/mplayer-vld \
		mediaplayers/mplayer-resumer) \
	$(if $(filter vlc,$(mm_SOFTWARE)), \
		mediaplayers/vlc) \
	$(if $(filter xine,$(mm_SOFTWARE)), \
		mediaplayers/xine-ui) \
	$(if $(filter transcode,$(mm_SOFTWARE)), \
		utils/transcode) \
	$(if $(filter wiimote,$(mm_SOFTWARE)), \
		utils/cwiid) \
	$(if $(filter debug,$(mm_SOFTWARE)), \
		devel/gdb \
		devel/strace) \
	$(filter-out %/Makefile extras/extras-% extras/extras.%,$(subst ../../,,$(wildcard ../../extras/*))) \
	$(mm_USER_PACKAGES)

BUILDDEPS = \
	utils/coreutils \
	devel/fakeroot \
	utils/file \
	utils/findutils \
	utils/squashfs \
	utils/tar \
	utils/util-linux-ng \
	xorg/xorg \
	perl/perlstrip \
	python/python-pyminifier

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

include ../../gar.mk

pre-everything:
	@$(MAKE) -f files/check.mk DESTIMG=$(DESTIMG)
	@# There is no MAKECOOKIE so that this runs every time.

$(DOWNLOADDIR)/$(DISTNAME).tar.bz2:
	@if [ ! -e $(DOWNLOADDIR)/$(DISTNAME).tar.bz2 ] ; then \
		$(MAKE) -f files/distfile.mk DESTIMG=$(DESTIMG) ; \
	fi

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

$(GARCHIVEDIR)/$(DISTNAME).tar.bz2:
	@#

configure-custom:
	@$(MAKE) -f files/configure.mk DESTIMG=$(DESTIMG)
	@$(MAKECOOKIE)