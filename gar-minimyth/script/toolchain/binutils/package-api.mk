# Binutils 2.34 fails to compile
BINUTILS_VERSION = 2.33.1

GMP_VERSION = 6.2.0
# ISL 0.22.1 fails to build when used as part of GCC 9.3.0
ISL_VERSION = 0.21
MPC_VERSION = 1.1.0
MPFR_VERSION = 4.0.2

CROSSIMG ?= $(DESTIMG)
GARTARGET = $($(CROSSIMG)_GARHOST)

ifneq ($(DESTIMG),build)
export CROSSIMG
PWD := $(shell pwd)
MY_PACKAGE_NAME := $(lastword $(subst /, ,$(PWD)))
MY_PACKAGE_CATEGORY := $(lastword $(subst /, ,$(patsubst %/$(MY_PACKAGE_NAME),%,$(PWD))))
BUILDDEPS = $(MY_PACKAGE_CATEGORY)/$(MY_PACKAGE_NAME)
endif

WORKDIR = $(WORKROOTDIR)/$(DESTIMG)_$(CROSSIMG).d
COOKIEDIR = $(COOKIEROOTDIR)/$(DESTIMG)_$(CROSSIMG).d

WORKBLD = $(WORKSRC)_build

ifeq ($(DESTIMG),build)
CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS = $(WORKBLD)/Makefile
INSTALL_SCRIPTS = $(WORKBLD)/Makefile lib-wrappers-$(CROSSIMG) links-$(CROSSIMG)
endif

BINUTILS_CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --target=$(GARTARGET) \
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
	--with-lib-path="=$($(CROSSIMG)_elibdir):=$($(CROSSIMG)_libdir)"
ifeq ($(CROSSIMG),build)
BINUTILS_CONFIGURE_ARGS +=
	--with-sysroot=/ \
	--with-build-time-tools="$(tainted_build_DESTDIR)$(tainted_build_bindir)"
else
BINUTILS_CONFIGURE_ARGS +=
	--with-sysroot=$($(CROSSIMG)_DESTDIR)
endif

configure-custom:
	@mkdir -pv $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

install-lib-wrappers-build:
	@rm -fv $(DESTDIR)$(libdir)/libbfd.la
	@rm -fv $(DESTDIR)$(libdir)/libopcodes.la
	@$(MAKECOOKIE)

install-lib-wrappers-main:
	@rm -fv $(DESTDIR)$(libdir)/libbfd.la
	@rm -fv $(DESTDIR)$(libdir)/libopcodes.la
	@$(MAKECOOKIE)

install-links-build:
	@ln -sfv ld $(DESTDIR)$(bindir)/$(GARTARGET)-ld
	@ln -sfv ld.bfd $(DESTDIR)$(bindir)/$(GARTARGET)-ld.bfd
	@ln -sfv objdump $(DESTDIR)$(bindir)/$(GARTARGET)-objdump
	@ln -sfv objcopy $(DESTDIR)$(bindir)/$(GARTARGET)-objcopy
	@ln -sfv strip $(DESTDIR)$(bindir)/$(GARTARGET)-strip
	@ln -sfv ranlib $(DESTDIR)$(bindir)/$(GARTARGET)-ranlib
	@ln -sfv readelf $(DESTDIR)$(bindir)/$(GARTARGET)-readelf
	@ln -sfv nm $(DESTDIR)$(bindir)/$(GARTARGET)-nm
	@ln -sfv as $(DESTDIR)$(bindir)/$(GARTARGET)-as
	@ln -sfv ar $(DESTDIR)$(bindir)/$(GARTARGET)-ar
	@$(MAKECOOKIE)

install-links-main:
	@$(MAKECOOKIE)
