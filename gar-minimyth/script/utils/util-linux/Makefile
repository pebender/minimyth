GARNAME = util-linux
GARVERSION = 2.35.1
CATEGORIES = utils
MASTER_SITES = https://www.kernel.org/pub/linux/utils/util-linux/v2.35/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/ncursesw lib/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--bindir=$(ebindir) \
	--sbindir=$(esbindir) \
	--libdir=$(elibdir) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-gtk-doc \
	--disable-nls \
	--disable-rpath \
	--enable-tls \
	--enable-widechar \
	--enable-libuuid \
	--enable-libblkid \
	--enable-libmount \
	--disable-libmount-support-mtab \
	--disable-libsmartcols \
	--disable-libfdisk \
	--disable-fdisks \
	--enable-mount \
	--disable-losetup \
	--disable-zramctl \
	--disable-fsck \
	--disable-partx \
	--enable-uuidd \
	--disable-mountpoint \
	--disable-fallocate \
	--disable-unshare \
	--disable-nsenter \
	--disable-setpriv \
	--enable-hardlink \
	--enable-eject \
	--enable-agetty \
	--enable-cramfs \
	--disable-bfs \
	--disable-minix \
	--disable-fdformat \
	--disable-hwclock \
	--disable-wdctl \
	--enable-switch_root \
	--disable-pivot_root \
	--disable-tunelp \
	--disable-kill \
	--disable-deprecated-last \
	--disable-last \
	--disable-utmpdump \
	--disable-line \
	--disable-mesg \
	--disable-raw \
	--enable-rename \
	--disable-vipw \
	--disable-newgrp \
	--disable-chfn-chsh-password \
	--disable-chfn-chsh \
	--enable-chsh-only-listed \
	--disable-login \
	--disable-login-chown-vcs \
	--disable-login-stat-mail \
	--disable-nologin \
	--disable-sulogin \
	--disable-su \
	--disable-runuser \
	--disable-ul \
	--disable-more \
	--disable-pg \
	--disable-setterm \
	--disable-schedutils \
	--disable-wall \
	--disable-write \
	--disable-bash-completion \
	--disable-pylibmount \
	--enable-pg-bell \
	--disable-use-tty-group \
	--disable-sulogin-emergency-mount \
	--disable-makeinstall-chown \
	--disable-makeinstall-setuid \
	--disable-colors-default \
	--without-util \
	--without-selinux \
	--without-audit \
	--without-udev \
	--with-ncursesw \
	--without-ncurses \
	--without-slang \
	--without-tinfo \
	--without-readline \
	--without-utempter \
	--without-cap-ng \
	--with-libz \
	--without-user \
	--without-btrfs \
	--without-systemd \
	--without-systemdsystemunitdir \
	--without-smack \
	--without-python

BUILD_ARGS     = \
	usrbin_execdir=$(bindir) \
	usrsbin_execdir=$(sbindir) \
	usrlib_execdir=$(elibdir) \
	pkgconfigdir=$(libdir)/pkgconfig
INSTALL_ARGS   = \
	usrbin_execdir=$(bindir) \
	usrsbin_execdir=$(sbindir) \
	usrlib_execdir=$(elibdir) \
	pkgconfigdir=$(libdir)/pkgconfig

include ../../gar.mk

# util-linux 2.26.2 fails to compile with gcc 5.2.0's link time optimization enabled.
CFLAGS  := $(filter-out -flto, $(CFLAGS))
LDFLAGS := $(filter-out -flto, $(LDFLAGS))

post-install:
	@rm -f $(DESTDIR)$(elibdir)/libblkid.la
	@rm -f $(DESTDIR)$(elibdir)/libmount.la
	@rm -f $(DESTDIR)$(elibdir)/libuuid.la
	@$(MAKECOOKIE)
