GARNAME = Linux-PAM
GARVERSION = 1.3.1
CATEGORIES = lib
MASTER_SITES = https://github.com/linux-pam/linux-pam/releases/download/v$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES = $(DISTNAME)-musl-fix-pam_exec.patch $(DISTNAME)-musl-fix-uint.patch $(DISTNAME)-musl-fix-syslog.patch $(DISTNAME)-disable-pam_rhosts.patch
LICENSE = MIT_Modified

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/cracklib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

#	--disable-securedir \
	--disable-isadir \
	--disable-sconfigdir \

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--enable-cracklib \
	--disable-audit \
	--disable-db \
	--disable-nis \
	--disable-selinux \
	--disable-regenerate-docu \
	--disable-nls \
	--disable-rpath \
	CC_FOR_BUILD="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"

GAR_EXTRA_CONF += lib/ncursesw/package-api.mk
include ../../gar.mk

libdir := $(libdir)/security
includedir := $(includedir)/security
sysconfdir := $(sysconfdir)/security
