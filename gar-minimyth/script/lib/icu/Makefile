GARNAME = icu
GARVERSION = 65.1
CATEGORIES = lib
MASTER_SITES = https://github.com/unicode-org/icu/releases/download/release-$(subst .,-,$(GARVERSION))/
ftp://xmlsoft.org/$(GARNAME)/
DISTFILES = $(GARNAME)4c-$(subst .,_,$(GARVERSION))-src.tgz
LICENSE = MIT/MIT_Modified

DESCRIPTION = 
define BLURB
endef

DEPENDS  = lang/c lib/zlib
ifeq ($(DESTIMG),build)
DEPENDS += python/python
else
BUILDDEPS += lib/icu
endif

PWD := $(shell pwd)

WORKSRC = $(WORKDIR)/$(GARNAME)/source

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--config-cache \
	--disable-icu-config \
	--disable-debug \
	--enable-release \
	--enable-strict \
	--enable-shared \
	--disable-static \
	--disable-auto-cleanup \
	--enable-draft \
	--enable-renaming \
	--disable-tracing \
	--disable-plugins \
	--enable-dyload \
	--disable-rpath \
	--disable-weak-threads \
	--enable-extras \
	--enable-icuio \
	--disable-layoutex \
	--enable-tools \
	--disable-fuzzer \
	--disable-tests \
	--disable-samples
CONFIGURE_ENV  =
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--with-cross-build="$(PWD)/$(WORKROOTDIR)/build.d/$(GARNAME)/source"
CONFIGURE_ENV += \
	ac_cv_c_bigendian="no"
endif

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)