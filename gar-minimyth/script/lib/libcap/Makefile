GARNAME = libcap
GARVERSION = 2.34
CATEGORIES = lib
MASTER_SITES = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES = $(DISTNAME)-toolchain.patch $(DISTNAME)-no-static.patch
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/License

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

BUILD_SCRIPTS = $(WORKSRC)/libcap/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/libcap/Makefile

BUILD_ARGS = \
	DYNAMIC="yes" \
	lib="lib" \
	BUILD_CC="$(build_CC)"
INSTALL_ARGS = \
	DYNAMIC="yes" \
	lib="lib" \
	BUILD_CC="$(build_CC)"

include ../../gar.mk
