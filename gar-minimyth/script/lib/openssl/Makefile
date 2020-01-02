GARNAME = openssl
GARVERSION = 1.1.1d
CATEGORIES = lib
MASTER_SITES = https://www.openssl.org/source/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lib/zlib
BUILDDEPS = perl/perl

CONFIGURE_SCRIPTS = $(WORKSRC)/Configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	--prefix=$(prefix) \
	--openssldir=$(sysconfdir)/pki/tls \
	shared \
	zlib \
	zlib-dynamic \
	$(if $(filter i386,  $(GARCH_FAMILY)),no-asm 386 linux-x86) \
	$(if $(filter x86_64,$(GARCH_FAMILY)),           linux-x86_64)

BUILD_ARGS = \
	AR="$(AR)" \
	AS="$(AS)" \
	CC="$(CC)" \
	CXX="$(CXX)" \
	CPP="$(CPP)" \
	LD="$(LD)" \
	RANLIB="$(RANLIB)"

include ../../gar.mk

PARALLELMFLAGS := -j1

configure-%/Configure: 
	@echo " ==> Running Configure in $*"
	@cd $* && $(CONFIGURE_ENV) ./Configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

post-install:
	@rm -fv $(DESTDIR)$(libdir)/libcrypto.a
	@rm -fv $(DESTDIR)$(libdir)/libssl.a
	@chmod u+w $(DESTDIR)$(libdir)/libcrypto.so.*
	@chmod u+w $(DESTDIR)$(libdir)/libssl.so.*
	@$(MAKECOOKIE)
