GARNAME = binutils
GARVERSION = $(BINUTILS_VERSION)
CATEGORIES = binutils
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
	binutils/binutils
endif

WORKDIR = $(WORKROOTDIR)/$(DESTIMG)_$(CROSSIMG).d
COOKIEDIR = $(COOKIEROOTDIR)/$(DESTIMG)_$(CROSSIMG).d

ifeq ($(DESTIMG),build)
CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile remove-lib-wrappers host-links
endif

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
	--with-sysroot=$($(CROSSIMG)_DESTDIR) \
	--with-build-time-tools="$(gcc_build_DESTDIR)$(gcc_build_bindir)" \
	--with-lib-path="=$($(CROSSIMG)_elibdir):=$($(CROSSIMG)_libdir)"

GAR_EXTRA_CONF += binutils/binutils/toolchain.mk
GAR_EXTRA_CONF += gcc-build/binutils/package-api.mk
include ../../gar.mk

install-remove-lib-wrappers:
	@rm -f $(DESTDIR)$(libdir)/libbfd.la
	@rm -f $(DESTDIR)$(libdir)/libopcodes.la
	@$(MAKECOOKIE)

install-host-links:
	@$(if $(filter $(CROSSIMG),build), \
		ln -sfv ld $(DESTDIR)$(bindir)/$(GARHOST)-ld && \
		ln -sfv ld.bfd $(DESTDIR)$(bindir)/$(GARHOST)-ld.bfd && \
		ln -sfv objdump $(DESTDIR)$(bindir)/$(GARHOST)-objdump && \
		ln -sfv objcopy $(DESTDIR)$(bindir)/$(GARHOST)-objcopy && \
		ln -sfv strip $(DESTDIR)$(bindir)/$(GARHOST)-strip && \
		ln -sfv ranlib $(DESTDIR)$(bindir)/$(GARHOST)-ranlib && \
		ln -sfv readelf $(DESTDIR)$(bindir)/$(GARHOST)-readelf && \
		ln -sfv nm $(DESTDIR)$(bindir)/$(GARHOST)-nm && \
		ln -sfv as $(DESTDIR)$(bindir)/$(GARHOST)-as && \
		ln -sfv ar $(DESTDIR)$(bindir)/$(GARHOST)-ar \
	)
	@$(MAKECOOKIE)
