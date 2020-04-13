GARNAME = flac
GARVERSION = 1.3.3
CATEGORIES = lib
MASTER_SITES = https://downloads.xiph.org/releases/flac/
DISTFILES = $(DISTNAME).tar.xz
xiph_LICENSE_TEXT = $(WORKSRC)/COPYING.Xiph

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c lang/cxx build-tool/make lib/libogg
BUILDDEPS = devel/nasm

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-altivec \
	--disable-doxygen-docs \
	--disable-xmms-plugin \
	--disable-oggtest \
	--disable-rpath \
	--with-ogg-includes=$(DESTDIR)$(includedir) \
	--with-ogg-libraries=$(DESTDIR)$(libdir)

include ../../gar.mk

# flac 1.3.3 fails to compile with gcc 9.2.0's link time optimization enabled.
#CFLAGS := $(filter-out -flto, $(CFLAGS))
#CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
#LDFLAGS := $(filter-out -flto, $(LDFLAGS))

post-install:
	@rm -f $(DESTDIR)$(libdir)/libFLAC.la
	@rm -f $(DESTDIR)$(libdir)/libFLAC++.la
	@rm -f $(DESTDIR)$(libdir)/libOggFLAC.la
	@rm -f $(DESTDIR)$(libdir)/libOggFLAC++.la
	@$(MAKECOOKIE)
