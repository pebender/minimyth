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
	utils/bluez-tools \
	utils/busybox \
	data/ca-bundle.crt \
	net/cifs-utils \
	net/curl \
	disk/e2fsprogs \
	utils/ethtool \
	utils/evtest \
	devel/fakeroot \
	system/g15daemon \
	disk/hdparm \
	net/ifplugd \
	X11/libva-intel-driver \
	net/inetutils \
	utils/intel-microcode2ucode \
	system/irxkeys \
	kernel/kernel \
	system/lcdproc \
	net/lighttpd \
	fonts/liberation-fonts \
	system/lirc \
	utils/lm-sensors \
	utils/lsdvd \
	utils/kmod \
	myth-$(mm_MYTH_VERSION)/mythtv \
	lib/ncursesw \
	net/nfs-utils \
	net/ntp \
	net/openssh \
	net/rpcbind \
	utils/pciutils \
	perl/perl \
	perl/perl-Class-Inspector \
	perl/perl-Date-Manip \
	perl/perl-Lchown \
	perl/perl-MiniMyth \
	perl/perl-RFLibs \
	perl/perl-Regexp-Wildcards \
	utils/pmount \
	system/powernowd \
	utils/procps \
	python/python \
	X11/ratpoison \
	utils/regionset \
	X11/rxvt \
	utils/SDL-Test \
	utils/squashfs \
	system/sysvinit \
	system/udev \
	X11/unclutter \
	utils/usbutils \
	utils/util-linux \
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
	$(if $(filter mythgame,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythgame),myth-$(mm_MYTH_VERSION)/mythgame) \
		emulators/fceu \
		emulators/jzintv \
		emulators/mednafen \
		emulators/stella \
		$(if $(filter mame,$(mm_SOFTWARE)),emulators/mame) \
		$(if $(filter i386,$(mm_GARCH_FAMILY)),emulators/zsnes)) \
	$(if $(filter mythmusic,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythmusic),myth-$(mm_MYTH_VERSION)/mythmusic)) \
	$(if $(filter mythnetvision,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythnetvision),myth-$(mm_MYTH_VERSION)/mythnetvision)) \
	$(if $(filter mythnews,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythnews),myth-$(mm_MYTH_VERSION)/mythnews)) \
	$(if $(filter mythweather,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythweather),myth-$(mm_MYTH_VERSION)/mythweather)) \
	$(if $(filter mythzoneminder,$(mm_SOFTWARE)), \
		$(if $(wildcard ../../myth-$(mm_MYTH_VERSION)/mythzoneminder),myth-$(mm_MYTH_VERSION)/mythzoneminder)) \
	$(if $(filter airplay,$(mm_SOFTWARE)), \
		lib/dbus \
		lib/avahi) \
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
	utils/module-init-tools \
	utils/squashfs \
	utils/tar \
	utils/util-linux \
	xorg/mkfontdir \
	xorg/mkfontscale \
	perl/perlstrip \
	python/python-pyminifier

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

include ../../gar.mk

pre-everything:
	@$(MAKE) -f files/check.mk DESTIMG=$(DESTIMG) build_DESTIMG=$(build_DESTIMG)
	@# There is no MAKECOOKIE so that this runs every time.

$(DOWNLOADDIR)/$(DISTNAME).tar.bz2:
	@if [ ! -e $(DOWNLOADDIR)/$(DISTNAME).tar.bz2 ] ; then \
		$(MAKE) -f files/distfile.mk DESTIMG=$(DESTIMG) build_DESTIMG=$(build_DESTIMG) ; \
	fi

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

$(GARCHIVEDIR)/$(DISTNAME).tar.bz2:
	@#

configure-custom:
	@$(MAKE) -f files/configure.mk DESTIMG=$(DESTIMG) build_DESTIMG=$(build_DESTIMG)
	@$(MAKECOOKIE)
