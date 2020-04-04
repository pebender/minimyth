GARNAME = glibc
GARVERSION = $(GLIBC_VERSION)
CATEGORIES = toolchain-main
SOURCEPKG = tainted-main/glibc
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

ifneq ($(DESTIMG),build)
DEPENDS = \
	tainted-main/tainted-main \
	kernel-headers/linux-headers
endif

build_DESTDIR = $(tainted_build_DESTDIR)
build_rootdir = $(tainted_build_rootdir)

WORKBLD = $(WORKSRC)_build

ifneq ($(DESTIMG),build)
CONFIGURE_SCRIPTS = fix-configs custom
BUILD_SCRIPTS = $(WORKBLD)/Makefile
INSTALL_SCRIPTS = $(WORKBLD)/Makefile extract-charmaps remove-static-libs
endif

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--enable-bind-now \
	--enable-kernel=5.4.0 \
	--disable-obsolete-rpc \
	--with-headers=$(DESTDIR)$(includedir) \
	--enable-add-ons=nptl \
	--with-tls \
	--with-__thread
INSTALL_ARGS = \
	install_root=$(DESTDIR)

CONFIGURE_ENV = \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"
	AR=$(AR)
BUILD_ENV = \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"
INSTALL_ENV = \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"

GAR_EXTRA_CONF += toolchain-main/toolchain-main/toolchain.mk
GAR_EXTRA_CONF += tainted-main/glibc/package-api.mk
include ../../gar.mk

# glibc 2.30 fails to compile with gcc 9.2.0's link time optimization enabled.
CFLAGS  := $(filter-out -flto, $(CFLAGS)) -fno-lto
LDFLAGS := $(filter-out -flto, $(LDFLAGS)) -fno-lto

CFLAGS := $(filter-out -ffast-math, $(CFLAGS))
CFLAGS := $(filter-out -O%, $(CFLAGS)) -O3

configure-fix-configs:
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

install-extract-charmaps:
	@cd $(DESTDIR)$(datadir)/i18n/charmaps ; gzip -df *.gz
	@$(MAKECOOKIE)

install-remove-static-libs:
	@rm -fv $(DESTDIR)$(libdir)/libc.a
	@$(MAKECOOKIE)
