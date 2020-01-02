GARNAME = pixman
GARVERSION = 0.38.4
CATEGORIES = xorg
MASTER_SITES = https://www.x.org/releases/individual/lib/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-openmp \
	--disable-loongson-mmi \
	--enable-mmx \
	--enable-sse2 \
	--enable-ssse3 \
	--disable-vmx \
	--disable-arm-simd \
	--disable-arm-neon \
	--disable-arm-iwmmxt \
	--disable-arm-iwmmxt2 \
	--disable-mips-dspr2 \
	--enable-gcc-inline-asm \
	--disable-timers \
	--disable-gtk \
	--disable-libpng

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libpixman-1.la
	@$(MAKECOOKIE)
