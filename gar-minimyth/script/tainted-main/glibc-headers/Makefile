GARNAME = glibc
GARVERSION = $(GLIBC_VERSION)
CATEGORIES = tainted-main
SOURCEPKG = tainted-main/glibc
LICENSE = GPL2/LGPL2_1/GPL3/LGPL3

DESCRIPTION = 
define BLURB
endef

WORKSRC = $(WORKDIR)/glibc-$(GARVERSION)
WORKBLD = $(WORKSRC)_build

DEPENDS = \
	tainted-main/kernel-headers \
	tainted-main/binutils
BUILDDEPS = \
	native/native \
	tainted-build/tainted-build

CONFIGURE_SCRIPTS = custom
INSTALL_SCRIPTS = custom

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--disable-sanity-checks \
	--enable-kernel=5.4.0 \
	--disable-build-nscd \
	--disable-nscd \
	--without-cvs \
	--with-headers=$(DESTDIR)$(includedir) \
	--disable-add-ons \
	--without-tls \
	--without-__thread
INSTALL_ARGS = \
	cross-compiling=yes \
	install_root=$(DESTDIR)

CONFIGURE_ENV = \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"
BUILD_ENV    = \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"
INSTALL_ENV  = \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"

GAR_EXTRA_CONF += tainted-main/tainted-main/toolchain.mk
GAR_EXTRA_CONF += tainted-main/glibc/package-api.mk
include ../../gar.mk

CC := $(build_CC)
CXX := $(build_CXX)
LD := $(build_LD)
OBJDUMP := $(build_OBJDUMP)
OBJCOPY := $(build_OBJCOPY)
STRIP = :$(build_STRIP)
RANLIB := $(build_RANLIB)
READELF := $(build_READELF)
NM := $(build_NM)
AS := $(build_AS)
AR := $(build_AR)
CPP := $(build_CPP)

CPPFLAGS := $(build_CPPFLAGS)
CFLAGS := $(build_CFLAGS)
CXXFLAGS := $(build_CXXFLAGS)
LDFLAGS := $(build_LDFLAGS)

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
