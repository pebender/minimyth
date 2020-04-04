GARNAME = curl
GARVERSION = 7.69.1
CATEGORIES = net
MASTER_SITES = https://curl.haxx.se/download/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = \
	$(DISTNAME).patch.gar
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/openssl lib/zlib net/librtmp
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-debug \
	--disable-optimize \
	--disable-warnings \
	--disable-werror \
	--disable-curldebug \
	--enable-symbol-hiding \
	--disable-ares \
	--enable-rt \
	--disable-esni \
	--disable-code-coverage \
	--enable-dependency-tracking \
	--enable-largefile \
	--enable-shared \
	--disable-static \
	--enable-http \
	--enable-ftp \
	--enable-file \
	--enable-ldap \
	--enable-ldaps \
	--enable-rtsp \
	--enable-proxy \
	--enable-dict \
	--enable-telnet \
	--enable-tftp \
	--enable-pop3 \
	--enable-imap \
	--enable-smb \
	--enable-smtp \
	--enable-gopher \
	--disable-manual \
	--enable-libcurl-option \
	--disable-libgcc \
	--disable-ipv6 \
	--enable-openssl-auto-load-config \
	--enable-versioned-symbols \
	--enable-threaded-resolver \
	--enable-pthreads \
	--disable-verbose \
	--disable-sspi \
	--enable-crypto-auth \
	--disable-ntlm-wb \
	--enable-tls-srp \
	--enable-unix-sockets \
	--enable-cookies \
	--enable-http-auth \
	--disable-doh \
	--enable-mime \
	--disable-dateparse \
	--disable-netrc \
	--enable-progress-meter \
	--enable-dnsshuffle \
	--with-zlib \
	--without-brotli \
	--without-gssapi  \
	--with-default-ssl-backend \
	--without-default-ssl-backend \
	--without-winssl \
	--without-schanne \
	--without-darwinss \
	--without-secure-tr \
	--without-amissl \
	--with-ssl \
	--with-random="$(rootdir)/dev/urandom" \
	--without-gnutls \
	--without-mbedtls \
	--without-wolfssl \
	--without-mesalink \
	--without-bearssl \
	--without-nss \
	--with-ca-bundle="$(sysconfdir)/pki/tls/certs/ca-bundle.crt" \
	--without-libmetalink \
	--without-libssh2 \
	--without-libssh \
	--without-wolfssh \
	--with-librtmp \
	--without-winidn \
	--without-libidn2 \
	--without-nghttp2 \
	--without-ngtcp2 \
	--without-nghttp3 \
	--without-quiche \
	--without-zsh-functions-dir \
	--without-fish-functions-dir
CONFIGURE_ENV  = \
	ac_cv_path_PKGCONFIG="pkg-config"

include ../../gar.mk

pre-configure:
	@#$(call RUN_AUTOTOOLS)
	@cd $(WORKSRC) ; aclocal  --force --verbose
	@cd $(WORKSRC) ; automake --force
	@cd $(WORKSRC) ; libtoolize --force --copy --install
	@cd $(WORKSRC) ; autoconf --force
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -fv $(DESTDIR)$(libdir)/libcurl.la
	@rm -fv $(DESTDIR)$(bindir)/config/curl-config
	@rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-curl-config
	@mkdir -pv $(DESTDIR)$(bindir)/config
	@mv $(DESTDIR)$(bindir)/curl-config $(DESTDIR)$(bindir)/config/curl-config
	@ln -sfv curl-config $(DESTDIR)$(bindir)/config/$(GARHOST)-curl-config
	@$(MAKECOOKIE)
