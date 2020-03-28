GARNAME = gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = gcc-target
SOURCEPKG = gcc-build/gcc
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION = 
define BLURB
endef

CROSSIMG ?= $(DESTIMG)
GARTARGET = $($(CROSSIMG)_GARHOST)

ifeq ($(DESTIMG),build)
IMGDEPS += $(CROSSIMG)
$(CROSSIMG)_DEPENDS = \
	gcc-target/kernel-headers\
	gcc-target/glibc-headers \
	gcc-target/binutils
BUILDDEPS = \
	native/native \
	cc-build/ccache \
	gcc-build/gcc-build
else
export CROSSIMG
BUILDDEPS = \
	gcc-target/gcc-static
endif

WORKDIR = $(WORKROOTDIR)/$(DESTIMG)_$(CROSSIMG).d
COOKIEDIR = $(COOKIEROOTDIR)/$(DESTIMG)_$(CROSSIMG).d

WORKSRC = $(WORKDIR)/gcc-$(GARVERSION)

WORKBLD = $(WORKSRC)_build

ifeq ($(DESTIMG),build)
CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS = $(WORKBLD)/Makefile
INSTALL_SCRIPTS = $(WORKBLD)/Makefile ccache-links
endif

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --target=$(GARTARGET) \
	--with-newlib \
	--enable-plugin \
	--disable-gold \
	--enable-ld=default \
	--enable-__cxa_atexit \
	--enable-clocale=gnu \
	--enable-languages=c,c++ \
	--disable-libatomic \
	--disable-libgomp \
	--disable-libquadmath \
	--disable-libquadmath-support \
	--disable-libada \
	--disable-libssp \
	--disable-libvtv \
	--disable-libstdcxx \
	--enable-lto \
	--disable-multilib \
	--disable-nls \
	--disable-shared \
	--disable-host-shared \
	--enable-threads=no \
	--with-local-prefix=$(patsubst %/include,%,$($(CROSSIMG)_includedir)) \
	--with-sysroot=$($(CROSSIMG)_DESTDIR)

GAR_EXTRA_CONF += gcc-target/gcc-target/toolchain.mk
GAR_EXTRA_CONF += gcc-build/gcc/package-api.mk
include ../../gar.mk

configure-custom:
	@mkdir -p $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

install-ccache-links:
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/$(GARTARGET)-gcc
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/$(GARTARGET)-g++
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/gcc
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/g++
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/cc
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/c++
	@$(MAKECOOKIE)
