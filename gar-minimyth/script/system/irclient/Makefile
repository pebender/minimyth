GARNAME = irclient
GARVERSION = 6.01.16
CATEGORIES = system
# This site lacks a version number so we will download it from www.minimyth.org.
#MASTER_SITES = http://www.irtrans.de/download/Client/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = BSD_3_Clause

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

BUILD_SCRIPTS   = $(WORKSRC)/makefile
INSTALL_SCRIPTS = custom

BUILD_ARGS = \
	SHELL="sh" \
	CC="$(CC)" \
	CFLAGS="$(CFLAGS)" \
	CPPFLAGS="$(CPPFLAGS) -DLINUX" \
	LDFLAGS="$(LDFLAGS)" \
	$(if $(filter i386,$(GARCH_FAMILY)),irclient) \
	$(if $(filter x86_64,$(GARCH_FAMILY)),irclient64)

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

install-custom:
	@mkdir -p $(DESTDIR)$(sbindir)
	@rm -rf $(DESTDIR)$(sbindir)/irclient
	@$(if $(filter i386,  $(GARCH_FAMILY)),install -v -m 755 $(WORKSRC)/irclient   $(DESTDIR)$(sbindir)/irclient)
	@$(if $(filter x86_64,$(GARCH_FAMILY)),install -v -m 755 $(WORKSRC)/irclient64 $(DESTDIR)$(sbindir)/irclient)
	@$(MAKECOOKIE)
