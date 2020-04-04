GARNAME = binutils
GARVERSION = $(BINUTILS_VERSION)
CATEGORIES = toolchain-main
SOURCEPKG = tainted-build/binutils
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
	tainted-build/tainted-build
else
export CROSSIMG
BUILDDEPS = \
	toolchain-main/binutils
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
	--disable-gold \
	--enable-ld=default \
	--disable-libgomp \
	--disable-libada \
	--disable-libssp \
	--disable-werror \
	--disable-multilib \
	--disable-nls \
	$(if $(filter build,$(CROSSIMG)), \
		--with-sysroot=/, \
		--with-sysroot=$($(CROSSIMG)_DESTDIR) \
	) \
	--with-lib-path="=$($(CROSSIMG)_elibdir):=$($(CROSSIMG)_libdir)"

GAR_EXTRA_CONF += toolchain-main/toolchain-main/toolchain.mk
GAR_EXTRA_CONF += tainted-build/binutils/package-api.mk
include ../../gar.mk

install-remove-lib-wrappers:
	@rm -f $(DESTDIR)$(libdir)/libbfd.la
	@rm -f $(DESTDIR)$(libdir)/libopcodes.la
	@$(MAKECOOKIE)
