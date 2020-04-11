GARNAME = nss
GARVERSION = 3.51
CATEGORIES = data
MASTER_SITES = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/$(shell echo $(DISTNAME) | sed -e 's/-/_/g' -e 's/\./_/g' -e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/')_RTM/src/
DISTFILES = $(DISTNAME).tar.gz
DISTFILES += ca-bundle.pl
LICENSE = MPL1_1/GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = lib/openssl perl/perl

WORKSRC = $(WORKDIR)/$(shell echo nss-$(GARVERSION) | sed -e 's/\.with\.ckbi\..*$$//')

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

GAR_EXTRA_CONF += lib/nss/package-api.mk
include ../../gar.mk

build-custom:
	@rm -f $(WORKDIR)/ca-bundle.crt
	@if [ ! -e $(WORKSRC)/nss/lib/ckfw/builtins/certdata.txt ] ; then \
		echo "error: file '$(WORKSRC)/nss/lib/ckfw/builtins/certdata.txt' does not exist" ; \
		exit 1 ; \
	fi
	@if [ ! -r $(WORKSRC)/nss/lib/ckfw/builtins/certdata.txt ] ; then \
		echo "error: file '$(WORKSRC)/nss/lib/ckfw/builtins/certdata.txt' cannot be read" ; \
		exit 1 ; \
	fi
	@cd $(shell dirname $(WORKSRC)); perl -w ca-bundle.pl $(shell basename $(WORKSRC))/nss/lib/ckfw/builtins/certdata.txt ca-bundle.crt
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(sysconfdir)/pki/tls/certs/
	@rm -f $(DESTDIR)$(sysconfdir)/pki/tls/certs/ca-bundle.crt
	@cp $(WORKDIR)/ca-bundle.crt $(DESTDIR)$(sysconfdir)/pki/tls/certs/ca-bundle.crt
	@$(MAKECOOKIE)
