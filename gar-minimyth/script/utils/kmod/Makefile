GARNAME = kmod
GARVERSION = 8
CATEGORIES = lib
MASTER_SITES = http://ftp.kernel.org/pub/linux/utils/kernel/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile links

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--enable-tools \
	--enable-logging \
	--disable-debug \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-gtk-doc-pdf \
	--with-gnu-ld \
	--without-xz \
	--without-zlib

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

install-links:
	@rm -f $(DESTDIR)$(esbindir)/depmod
	@ln -s $(patsubst /%,%,$(call DIRSTODOTS,$(esbindir)))$(bindir)/kmod $(DESTDIR)$(esbindir)/depmod
	@rm -f $(DESTDIR)$(esbindir)/insmod
	@ln -s $(patsubst /%,%,$(call DIRSTODOTS,$(esbindir)))$(bindir)/kmod $(DESTDIR)$(esbindir)/insmod
	@rm -f $(DESTDIR)$(esbindir)/lsmod
	@ln -s $(patsubst /%,%,$(call DIRSTODOTS,$(esbindir)))$(bindir)/kmod $(DESTDIR)$(esbindir)/lsmod
	@rm -f $(DESTDIR)$(esbindir)/modinfo
	@ln -s $(patsubst /%,%,$(call DIRSTODOTS,$(esbindir)))$(bindir)/kmod $(DESTDIR)$(esbindir)/modinfo
	@rm -f $(DESTDIR)$(esbindir)/modprobe
	@ln -s $(patsubst /%,%,$(call DIRSTODOTS,$(esbindir)))$(bindir)/kmod $(DESTDIR)$(esbindir)/modprobe
	@rm -f $(DESTDIR)$(esbindir)/rmmod
	@ln -s $(patsubst /%,%,$(call DIRSTODOTS,$(esbindir)))$(bindir)/kmod $(DESTDIR)$(esbindir)/rmmod
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libkmod.la
	@$(MAKECOOKIE)