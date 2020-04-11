GARNAME = glibc
GARVERSION = $(GLIBC_VERSION)
CATEGORIES = tainted-main
SOURCEPKG = toolchain/glibc
LICENSE = GPL2/LGPL2_1/GPL3/LGPL3

DESCRIPTION = 
define BLURB
endef

ifneq ($(DESTIMG),build)
DEPENDS = \
	tainted-main/linux-headers \
	tainted-main/binutils
BUILDDEPS = \
	native/native \
	tainted-build/tainted-build
endif

CONFIGURE_SCRIPTS = $(GLIBC_CONFIGURE_SCRIPTS)
INSTALL_SCRIPTS = headers additional-headers

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--disable-sanity-checks \
	--enable-kernel=5.6.0 \
	--disable-build-nscd \
	--disable-nscd \
	--disable-obsolete-rpc \
	--without-cvs \
	--with-headers=$(DESTDIR)$(includedir) \
	--disable-add-ons \
	--without-tls \
	--without-__thread
INSTALL_ARGS = $(GLIBC_INSTALL_ARGS)

GAR_EXTRA_CONF += toolchain/glibc/package-api.mk
GAR_EXTRA_CONF += tainted-main/tainted-main/toolchain.mk
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

install-headers:
	@$(INSTALL_ENV) $(MAKE) DESTDIR=$(DESTDIR) $(foreach TTT,$(INSTALL_OVERRIDE_DIRS),$(TTT)="$(DESTDIR)$($(TTT))") -C $(WORKBLD) $(INSTALL_ARGS) install-headers
	@$(MAKECOOKIE)

install-additional-headers:
	@mkdir -p $(DESTDIR)$(includedir)/gnu
	@mkdir -p $(DESTDIR)$(includedir)/bits
	@touch $(DESTDIR)$(includedir)/gnu/stubs.h
	@cp $(WORKBLD)/bits/stdio_lim.h $(DESTDIR)$(includedir)/bits
	@cp $(WORKSRC)/sysdeps/nptl/pthread.h $(DESTDIR)$(includedir)
	@cp $(WORKSRC)/sysdeps/nptl/bits/pthreadtypes.h $(DESTDIR)$(includedir)/bits
	@$(MAKECOOKIE)
