GARNAME = binutils
GARVERSION = $(BINUTILS_VERSION)
CATEGORIES = devel
MASTER_SITES  = https://ftp.gnu.org/gnu/binutils/
MASTER_SITES += https://ftp.gnu.org/gnu/gmp/
MASTER_SITES += http://isl.gforge.inria.fr/
MASTER_SITES += https://ftp.gnu.org/gnu/mpc/
MASTER_SITES += https://ftp.gnu.org/gnu/mpfr/
DISTFILES  = $(DISTNAME).tar.xz
DISTFILES += gmp-$(GMP_VERSION).tar.xz
DISTFILES += isl-$(ISL_VERSION).tar.xz
DISTFILES += mpc-$(MPC_VERSION).tar.gz
DISTFILES += mpfr-$(MPFR_VERSION).tar.xz
PATCHFILES  = $(DISTNAME)-multi_os_directory.patch
ifneq ("$(DESTIMG)+$(CROSSIMG)","build+build")
PATCHFILES += $(DISTNAME)-perl.patch.gar
endif
LICENSE = GPL2/LGPL2

DESCRIPTION =
define BLURB
endef

CROSSIMG ?= $(DESTIMG)
GARTARGET = $($(CROSSIMG)_GARHOST)

DEPENDS  = lang/c
BUILDDEPS = devel-tainted/devel-tainted devel/make

WORKDIR   = $(WORKROOTDIR)/$(DESTIMG)_$(CROSSIMG).d
COOKIEDIR = $(COOKIEROOTDIR)/$(DESTIMG)_$(CROSSIMG).d

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --target=$(GARTARGET) \
	--enable-plugins \
	--disable-gold \
	--enable-ld=default \
	--disable-libgomp \
	--disable-libada \
	--disable-libssp \
	--disable-werror \
	--disable-multilib \
	--enable-nls \
	--with-sysroot=$($(CROSSIMG)_DESTDIR)
# I do not know what '=' does at the beginning of the path name. However, the correct libraries are not found without it.
# For the native environment, glibc is not installed, so the native environment needs to pick up glibc from the system.
# Libraries are located in /lib and /usr/lib. On some systems (e.g. Ubuntu 11.04), some libraries (e.g. libc.so) are
# located in /lib/$(GARBUILD) and /usr/lib/$(GARBUILD). On some systems, i386 libraries are located in /lib32 and /usr/lib32,
# and on some systems x86_64 libraries are located in /lib64 and /usr/lib64.
ifeq ("$(DESTIMG)+$(CROSSIMG)","build+build")
CONFIGURE_ARGS += \
	--with-lib-path="=$($(CROSSIMG)_elibdir):=$($(CROSSIMG)_libdir):/lib/$(GARBUILD):/usr/lib/$(GARBUILD):$(strip $(if $(filter i386,$(GARCH_FAMILY)),:/lib32:/usr/lib32:/lib:/usr/lib) $(if $(filter x86_64,$(GARCH_FAMILY)),:/lib64:/usr/lib64:/lib:/usr/lib))"
else
CONFIGURE_ARGS += \
	--with-lib-path="=$($(CROSSIMG)_elibdir):=$($(CROSSIMG)_libdir)"
endif

GAR_EXTRA_CONF += devel/gcc/package-api.mk
GAR_EXTRA_CONF += devel/gmp/package-api.mk
GAR_EXTRA_CONF += devel/isl/package-api.mk
GAR_EXTRA_CONF += devel/mpc/package-api.mk
GAR_EXTRA_CONF += devel/mpfr/package-api.mk
include ../../gar.mk

CPPFLAGS :=
CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=

post-extract:
	@rm -rf $(WORKSRC)/gmp-$(GMP_VERSION) $(WORKSRC)-gmp
	@cp -a $(WORKDIR)/gmp-$(GMP_VERSION) $(WORKSRC)/
	@mv $(WORKSRC)/gmp-$(GMP_VERSION) $(WORKSRC)/gmp
	@rm -rf $(WORKSRC)/isl-$(ISL_VERSION) $(WORKSRC)/isl
	@cp -a $(WORKDIR)/isl-$(ISL_VERSION) $(WORKSRC)/
	@mv $(WORKSRC)/isl-$(ISL_VERSION) $(WORKSRC)/isl
	@rm -rf $(WORKWRC)/mpc-$(MPC_VERSION) $(WORKSRC)/mpc
	@cp -a $(WORKDIR)/mpc-$(MPC_VERSION) $(WORKSRC)/
	@mv $(WORKSRC)/mpc-$(MPC_VERSION) $(WORKSRC)/mpc
	@rm -rf $(WORKSRC)/mpfr-$(MPFR_VERSION) $(WORKSRC)/mpfr
	@cp -a $(WORKDIR)/mpfr-$(MPFR_VERSION) $(WORKSRC)/
	@mv $(WORKSRC)/mpfr-$(MPFR_VERSION) $(WORKSRC)/mpfr
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libbfd.la
	@rm -f $(DESTDIR)$(libdir)/libopcodes.la
	@$(MAKECOOKIE)
