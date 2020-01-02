GARNAME = glibc
GARVERSION = $(GLIBC_VERSION)
CATEGORIES = devel
MASTER_SITES  = https://ftp.gnu.org/gnu/$(GARNAME)/
MASTER_SITES += ftp://sources.redhat.com/pub/$(GARNAME)/snapshots/
DISTFILES = $(DISTNAME).tar.xz
xPATCHFILES = \
	$(DISTNAME)-perl.patch.gar \
	$(DISTNAME).patch
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c
BUILDDEPS  = devel/binutils python/python
ifeq ($(DESTIMG),build)
BUILDDEPS += devel/gcc
else
BUILDDEPS += devel/gcc-minimal-static
endif

# If this is the build image and the system is using linuxthreads, then we need to use linux threads.
# Otherwise, the build packages will not compile and run correctly.
use_linuxthreads = no
ifeq ($(DESTIMG),build)
ifeq ($(shell getconf GNU_LIBPTHREAD_VERSION | sed 's%[- ].*%%'),linuxthreads)
use_linuxthreads = yes
endif
endif

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--enable-bind-now \
	--enable-kernel=5.4.0 \
	--disable-obsolete-rpc \
	--with-headers=$(DESTDIR)$(includedir)
ifeq ($(use_linuxthreads),yes)
CONFIGURE_ARGS += \
	--enable-add-ons=linuxthreads \
	--without-tls \
	--without-__thread
else
CONFIGURE_ARGS += \
	--enable-add-ons=nptl \
	--with-tls \
	--with-__thread
endif
INSTALL_ARGS    = \
	install_root=$(DESTDIR)

CONFIGURE_ENV = \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"
BUILD_ENV     = \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"
INSTALL_ENV   = \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"

GAR_EXTRA_CONF += devel/glibc/package-api.mk
include ../../gar.mk

# glibc 2.30 fails to compile with gcc 9.2.0's link time optimization enabled.
CFLAGS  := $(filter-out -flto, $(CFLAGS))  -fno-lto
LDFLAGS := $(filter-out -flto, $(LDFLAGS)) -fno-lto

CFLAGS := $(filter-out -ffast-math, $(CFLAGS))
CFLAGS := $(filter-out -O%, $(CFLAGS)) -O3

pre-configure:
	@mkdir -p $(WORKBLD)
	@rm -rf $(WORKBLD)/configparms
	@echo "slibdir=$(elibdir)" >> $(WORKBLD)/configparms
	@rm -rf $(WORKBLD)/config.cache
	@echo "libc_cv_forced_unwind=yes" >> $(WORKBLD)/config.cache
	@echo "libc_cv_c_cleanup=yes"     >> $(WORKBLD)/config.cache
	@echo "libc_cv_ctors_header=yes"  >> $(WORKBLD)/config.cache
	@$(MAKECOOKIE)

configure-custom:
	@mkdir -p $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

post-install:
	@cd $(DESTDIR)$(datadir)/i18n/charmaps ; gzip -df *.gz
	@$(MAKECOOKIE)
