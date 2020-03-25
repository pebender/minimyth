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

CONFIGURE_SCRIPTS = $(WORKSRC)/configure

CONFIGURE_SCRIPTS = $(WORKSRC)/Configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

DEFAULT_ARGS   = \
	AR="$(AR)" \
	AS="$(AS)" \
	CC="$(CC)" \
	CFLAGS="$(CFLAGS)" \
	CXX="$(CXX)" \
	CXXFLAGS="$(CXXFLAGS)" \
	CPP="$(CPP)" \
	CPPFLAGS="$(CPPFLAGS)" \
	LD="$(LD)" \
	LDFLAGS="$(LDFLAGS)" \
	PERL="$(build_DESTDIR)$(build_bindir)/perl"
CONFIGURE_ARGS = \
	--prefix=$(prefix) \
	--openssldir=$(sysconfdir)/pki/tls \
	--libdir=$(libdir) \
	shared \
	zlib \
	zlib-dynamic \
	$(if $(filter i386,  $(GARCH_FAMILY)),no-asm 386 linux-x86) \
	$(if $(filter x86_64,$(GARCH_FAMILY)),           linux-x86_64) \
	$(DEFAULT_ARGS)
BUILD_ARGS    = $(DEFAULT_ARGS)
INSTALL_ARGS  = $(DEFAULT_ARGS)

include ../../gar.mk

configure-%/Configure: 
	@echo " ==> Running Configure in $*"
	@cd $* && $(CONFIGURE_ENV) $(build_DESTDIR)$(build_bindir)/perl ./Configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

post-install:
	@rm -fv $(DESTDIR)$(libdir)/libcrypto.a
	@rm -fv $(DESTDIR)$(libdir)/libssl.a
	@chmod u+w $(DESTDIR)$(libdir)/libcrypto.so.*
	@chmod u+w $(DESTDIR)$(libdir)/libssl.so.*
	@$(MAKECOOKIE)
