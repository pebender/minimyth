GARNAME = irserver
GARVERSION = 6.10.23
CATEGORIES = system
# This site lacks a version number so we will download it from www.minimyth.org.
#MASTER_SITES = http://www.irtrans.de/download/Server/Linux/
DISTFILES = $(DISTNAME).tar.bz2
#PATCHFILES = $(DISTNAME)-lirc_0.8.6.patch
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
	$(if $(filter i386,$(GARCH_FAMILY)),irserver) \
	$(if $(filter x86_64,$(GARCH_FAMILY)),irserver64)


include ../../gar.mk

#CC := $(build_DESTDIR)$(build_bindir)/$(GARHOST)-gcc

CPPFLAGS := $(CPPFLAGS) -D_LARGEFILE64_SOURCE=1 -D_FILE_OFFSET_BITS=1
CFLAGS := $(CFLAGS) -Wno-return-type
LDFLAGS := $(LDFLAGS) -fwhole-program

install-custom:
	@mkdir -p $(DESTDIR)$(sbindir)
	@rm -rf $(DESTDIR)$(sbindir)/irserver
	@$(if $(filter i386,  $(GARCH_FAMILY)),install -v -m 755 $(WORKSRC)/irserver   $(DESTDIR)$(sbindir)/irserver)
	@$(if $(filter x86_64,$(GARCH_FAMILY)),install -v -m 755 $(WORKSRC)/irserver64 $(DESTDIR)$(sbindir)/irserver)
	@mkdir -p $(DESTDIR)$(datadir)/irtrans
	@rm -rf $(DESTDIR)$(datadir)/irtrans/remotes
	@cp -r $(WORKSRC)/remotes $(DESTDIR)$(datadir)/irtrans
	@$(MAKECOOKIE)
