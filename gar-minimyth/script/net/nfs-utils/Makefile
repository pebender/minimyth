GARNAME = nfs-utils
GARVERSION = 2.4.3
CATEGORIES = net
MASTER_SITES = https://sourceforge.net/projects/nfs/files/nfs-utils/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME)-native_hack.patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c net/libtirpc utils/util-linux
BUILDDEPS = net/rpcgen

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-nfsv4 \
	--disable-nfsv41 \
	--disable-gss \
	--disable-svcgss \
	--disable-kprefix \
	--enable-uuid \
	--enable-mount \
	--enable-libmount-mount \
	--disable-junction \
	--enable-tirpc \
	--disable-ipv6 \
	--disable-mountconfig \
	--disable-nfsdcld \
	--disable-nfsdcltrack \
	--disable-caps \
	--enable-largefile \
	--enable-shared \
	--disable-static \
	--disable-ldap \
	--disable-gums \
	--with-rpcgen=$(build_DESTDIR)$(build_bindir)/rpcgen \
	--with-tirpcinclude=$(DESTDIR)$(includedir)/tirpc \
	--without-tcp-wrappers \
	--without-krb5

CONFIGURE_ENV = \
	CC_FOR_BUILD="$(build_CC)" \
	CFLAGS_FOR_BUILD="$(build_CFLAGS)" \
	CPPFLAGS_FOR_BUILD="$(build_CPPFLAGS)" \
	LDFLAGS_FOR_BUILD="$(build_LDFLAGS)" \
	libblkid_cv_is_recent="yes"

include ../../gar.mk

CFLAGS += -Wno-format-nonliteral
CXXFLAGS += -Wno-format-nonliteral
LDFLAGS += -lintl

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
