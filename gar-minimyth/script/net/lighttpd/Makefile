GARNAME = lighttpd
GARVERSION = 1.4.55
CATEGORIES = net
MASTER_SITES = https://download.lighttpd.net/lighttpd/releases-1.4.x/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = BSD_3_Clause

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/pcre

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--enable-lfs \
	--disable-ipv6 \
	--disable-extra-warnings \
	--without-mysql \
	--without-ldap \
	--without-attr \
	--without-valgrind \
	--without-libunwind \
	--without-openssl \
	--without-kerberos5 \
	--with-pcre \
	--without-zlib \
	--without-bzip2 \
	--without-fam \
	--without-webdav-props \
	--without-webdav-locks \
	--without-gdbm \
	--without-memcache \
	--without-lua \
	CPP_FOR_BUILD="$(build_CPP)" \
	CC_FOR_BUILD="$(build_CC)" \
	CPPFLAGS_FOR_BUILD="$(build_CPPFLAGS)" \
	CFLAGS_FOR_BUILD="$(build_CFLAGS)" \
	LDFLAGS_FOR_BUILD="$(build_LDFLAGS)"
CONFIGURE_ENV = \
	PCRECONFIG="$(DESTDIR)$(bindir)/config.d/pcre-config"

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/mod_access.la
	@rm -f $(DESTDIR)$(libdir)/mod_accesslog.la
	@rm -f $(DESTDIR)$(libdir)/mod_alias.la
	@rm -f $(DESTDIR)$(libdir)/mod_auth.la
	@rm -f $(DESTDIR)$(libdir)/mod_authn_file.la
	@rm -f $(DESTDIR)$(libdir)/mod_cgi.la
	@rm -f $(DESTDIR)$(libdir)/mod_compress.la
	@rm -f $(DESTDIR)$(libdir)/mod_deflate.la
	@rm -f $(DESTDIR)$(libdir)/mod_dirlisting.la
	@rm -f $(DESTDIR)$(libdir)/mod_evasive.la
	@rm -f $(DESTDIR)$(libdir)/mod_evhost.la
	@rm -f $(DESTDIR)$(libdir)/mod_expire.la
	@rm -f $(DESTDIR)$(libdir)/mod_extforward.la
	@rm -f $(DESTDIR)$(libdir)/mod_fastcgi.la
	@rm -f $(DESTDIR)$(libdir)/mod_flv_streaming.la
	@rm -f $(DESTDIR)$(libdir)/mod_indexfile.la
	@rm -f $(DESTDIR)$(libdir)/mod_proxy.la
	@rm -f $(DESTDIR)$(libdir)/mod_redirect.la
	@rm -f $(DESTDIR)$(libdir)/mod_rewrite.la
	@rm -f $(DESTDIR)$(libdir)/mod_rrdtool.la
	@rm -f $(DESTDIR)$(libdir)/mod_scgi.la
	@rm -f $(DESTDIR)$(libdir)/mod_secdownload.la
	@rm -f $(DESTDIR)$(libdir)/mod_setenv.la
	@rm -f $(DESTDIR)$(libdir)/mod_simple_vhost.la
	@rm -f $(DESTDIR)$(libdir)/mod_sockproxy.la
	@rm -f $(DESTDIR)$(libdir)/mod_ssi.la
	@rm -f $(DESTDIR)$(libdir)/mod_staticfile.la
	@rm -f $(DESTDIR)$(libdir)/mod_status.la
	@rm -f $(DESTDIR)$(libdir)/mod_uploadprogress.la
	@rm -f $(DESTDIR)$(libdir)/mod_userdir.la
	@rm -f $(DESTDIR)$(libdir)/mod_usertrack.la
	@rm -f $(DESTDIR)$(libdir)/mod_vhostdb.la
	@rm -f $(DESTDIR)$(libdir)/mod_webdav.la
	@rm -f $(DESTDIR)$(libdir)/mod_wstunnel.la
	@$(MAKECOOKIE)
