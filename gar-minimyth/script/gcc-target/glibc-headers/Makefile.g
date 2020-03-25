GARNAME = glibc
GARVERSION = $(GLIBC_VERSION)
CATEGORIES = devel
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
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

GAR_EXTRA_CONF += compiler-gcc-cross/compiler-gcc-cross/toolchain.mk
include ../../gar.mk

CPP      := $(build_CPP)
CC       := $(build_CC)
CXX      := $(build_CXX)
LD       := $(build_LD)
AR       := $(build_AR)
AS       := $(build_AS)
OBJDUMP  := $(build_OBJDUMP)
RANLIB   := $(build_RANLIB)
CPPFLAGS :=
CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=

pre-configure:
	@mkdir -p $(WORKBLD)
	@rm -rf $(WORKBLD)/configparms
	@echo "slibdir=$(elibdir)" >> $(WORKBLD)/configparms
	@rm -rf $(WORKBLD)/config.cache
	@echo "libc_cv_386_tls=yes" >> $(WORKBLD)/config.cache
	@$(MAKECOOKIE)

configure-custom:
	@mkdir -p $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

install-custom:
	@$(INSTALL_ENV) $(MAKE) DESTDIR=$(DESTDIR) $(foreach TTT,$(INSTALL_OVERRIDE_DIRS),$(TTT)="$(DESTDIR)$($(TTT))") -C $(WORKBLD) $(INSTALL_ARGS) install-headers
	@$(MAKECOOKIE)

post-install:
	@mkdir -p $(DESTDIR)$(includedir)/gnu
	@mkdir -p $(DESTDIR)$(includedir)/bits
	@touch $(DESTDIR)$(includedir)/gnu/stubs.h
	@cp $(WORKBLD)/bits/stdio_lim.h $(DESTDIR)$(includedir)/bits
	@cp $(WORKSRC)/sysdeps/nptl/pthread.h $(DESTDIR)$(includedir)
	@cp $(WORKSRC)/sysdeps/nptl/bits/pthreadtypes.h $(DESTDIR)$(includedir)/bits
	@$(MAKECOOKIE)
