GARNAME = kmod
GARVERSION = 27
CATEGORIES = lib
MASTER_SITES = https://www.kernel.org/pub/linux/utils/kernel/kmod/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/openssl lib/zlib utils/xz

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile links

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--disable-experimental \
	--enable-tools \
	--disable-manpages \
	--disable-test-modules \
	--enable-logging \
	--disable-debug \
	--disable-python \
	--disable-coverage \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-gtk-doc-pdf \
	--with-xz \
	--with-zlib

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

install-links:
	@rm -fv $(DESTDIR)$(esbindir)/depmod
	@ln -sfv $(patsubst /%,%,$(call DIRSTODOTS,$(esbindir)))$(bindir)/kmod $(DESTDIR)$(esbindir)/depmod
	@rm -fv $(DESTDIR)$(esbindir)/insmod
	@ln -sfv $(patsubst /%,%,$(call DIRSTODOTS,$(esbindir)))$(bindir)/kmod $(DESTDIR)$(esbindir)/insmod
	@rm -fv $(DESTDIR)$(esbindir)/lsmod
	@ln -sfv $(patsubst /%,%,$(call DIRSTODOTS,$(esbindir)))$(bindir)/kmod $(DESTDIR)$(esbindir)/lsmod
	@rm -fv $(DESTDIR)$(esbindir)/modinfo
	@ln -sfv $(patsubst /%,%,$(call DIRSTODOTS,$(esbindir)))$(bindir)/kmod $(DESTDIR)$(esbindir)/modinfo
	@rm -fv $(DESTDIR)$(esbindir)/modprobe
	@ln -sfv $(patsubst /%,%,$(call DIRSTODOTS,$(esbindir)))$(bindir)/kmod $(DESTDIR)$(esbindir)/modprobe
	@rm -fv $(DESTDIR)$(esbindir)/rmmod
	@ln -sfv $(patsubst /%,%,$(call DIRSTODOTS,$(esbindir)))$(bindir)/kmod $(DESTDIR)$(esbindir)/rmmod
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libkmod.la
	@$(MAKECOOKIE)
