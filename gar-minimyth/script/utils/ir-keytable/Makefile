GARNAME = v4l-utils
GARVERSION = 1.18.0
CATEGORIES = utils
MASTER_SITES = https://linuxtv.org/downloads/v4l-utils/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = \
	$(DISTNAME)-rc_keymaps.patch
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx system/udev

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
#BUILD_SCRIPTS     = $(WORKSRC)/utils/keytable/Makefile
#INSTALL_SCRIPTS   = $(WORKSRC)/utils/keytable/Makefile
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-doxygen-doc \
	--disable-doxygen-dot \
	--disable-doxygen-man \
	--disable-doxygen-rtf \
	--disable-doxygen-xml \
	--disable-doxygen-chm \
	--disable-doxygen-chi \
	--disable-doxygen-html \
	--disable-doxygen-ps \
	--disable-doxygen-pdf \
	--disable-nls \
	--disable-rpath \
	--disable-libdvbv5 \
	--disable-dyn-libv4l \
	--disable-v4l2-compliance-libv4l \
	--disable-v4l2-ctl-libv4l \
	--disable-v4l2-ctl-stream-to \
	--disable-qv4l2 \
	--disable-qvidcap \
	--disable-bpf \
	--without-jpeg \
	--with-udevdir="$(libdir)/udev"

include ../../gar.mk
