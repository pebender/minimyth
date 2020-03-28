GARNAME = binutils
GARVERSION = $(BINUTILS_VERSION)
CATEGORIES = gcc-target
SOURCEPKG = gcc-build/binutils
LICENSE = GPL2/LGPL2/GPL3/LGPL3

DESCRIPTION =
define BLURB
endef

CROSSIMG ?= $(DESTIMG)
GARTARGET = $($(CROSSIMG)_GARHOST)

ifeq ($(DESTIMG),build)
DEPENDS =
BUILDDEPS = \
	native/native \
	cc-build/ccache \
	gcc-build/gcc-build
else
export CROSSIMG
BUILDDEPS = \
	gcc-target/binutils
endif

WORKDIR = $(WORKROOTDIR)/$(DESTIMG)_$(CROSSIMG).d
COOKIEDIR = $(COOKIEROOTDIR)/$(DESTIMG)_$(CROSSIMG).d

ifeq ($(DESTIMG),build)
CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile remove-lib-wrappers
endif

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARBUILD) --target=$(GARTARGET) \
	--enable-plugins \
	--enable-gold \
	--enable-ld=default \
	--disable-libgomp \
	--disable-libada \
	--disable-libssp \
	--disable-werror \
	--disable-multilib \
	--enable-nls \
	--with-sysroot=$($(CROSSIMG)_DESTDIR) \
	--with-lib-path="=$($(CROSSIMG)_elibdir):=$($(CROSSIMG)_libdir)"

GAR_EXTRA_CONF += gcc-target/gcc-target/toolchain.mk
GAR_EXTRA_CONF += gcc-build/binutils/package-api.mk
include ../../gar.mk

install-remove-lib-wrappers:
	@rm -f $(DESTDIR)$(libdir)/libbfd.la
	@rm -f $(DESTDIR)$(libdir)/libopcodes.la
	@$(MAKECOOKIE)
