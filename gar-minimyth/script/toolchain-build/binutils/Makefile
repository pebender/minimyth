GARNAME = binutils
GARVERSION = $(BINUTILS_VERSION)
CATEGORIES = toolchain-build
SOURCEPKG = tainted-build/binutils
LICENSE = GPL2/LGPL2/GPL3/LGPL3

DESCRIPTION =
define BLURB
endef

BUILDDEPS = \
	native/native \
	tainted-build/tainted-build

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile lib-wrappers links

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARBUILD) --target=$(GARTARGET) \
	--with-static-standard-libraries \
	--enable-plugins \
	--disable-gold \
	--enable-ld=default \
	--disable-libgomp \
	--disable-libada \
	--disable-libssp \
	--disable-multilib \
	--disable-nls \
	--disable-werror \
	--with-sysroot=/, \
	--with-build-time-tools="$(tainted_build_DESTDIR)$(tainted_build_bindir)" \
	--with-lib-path="=$(elibdir):=$(libdir)"

GAR_EXTRA_CONF += toolchain-build/toolchain-build/toolchain.mk
GAR_EXTRA_CONF += tainted-build/binutils/package-api.mk
include ../../gar.mk

CC := $(build_DESTDIR)$(build_bindir)/ccache.d/$(build_GARHOST)-gcc
CXX := $(build_DESTDIR)$(build_bindir)/ccache.d/$(build_GARHOST)-g++
CPP := $(build_DESTDIR)$(build_bindir)/wrapper.d/$(build_GARHOST)-cpp
LD := $(build_DESTDIR)$(build_bindir)/wrapper.d/$(build_GARHOST)-ld.bfd
OBJDUMP := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-objdump
OBJCOPY := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-objcopy
STRIP := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-strip
RANLIB := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-ranlib
READELF := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-readelf
NM := $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-nm

install-lib-wrappers:
	@rm -f $(DESTDIR)$(libdir)/libbfd.la
	@rm -f $(DESTDIR)$(libdir)/libopcodes.la
	@$(MAKECOOKIE)

install-links:
	@ln -sfv ld $(DESTDIR)$(bindir)/$(GARHOST)-ld
	@ln -sfv ld.bfd $(DESTDIR)$(bindir)/$(GARHOST)-ld.bfd
	@ln -sfv objdump $(DESTDIR)$(bindir)/$(GARHOST)-objdump
	@ln -sfv objcopy $(DESTDIR)$(bindir)/$(GARHOST)-objcopy
	@ln -sfv strip $(DESTDIR)$(bindir)/$(GARHOST)-strip
	@ln -sfv ranlib $(DESTDIR)$(bindir)/$(GARHOST)-ranlib
	@ln -sfv readelf $(DESTDIR)$(bindir)/$(GARHOST)-readelf
	@ln -sfv nm $(DESTDIR)$(bindir)/$(GARHOST)-nm
	@ln -sfv as $(DESTDIR)$(bindir)/$(GARHOST)-as
	@ln -sfv ar $(DESTDIR)$(bindir)/$(GARHOST)-ar
	@$(MAKECOOKIE)
