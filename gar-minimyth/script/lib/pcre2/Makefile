GARNAME = pcre2
GARVERSION = 10.35
CATEGORIES = lib
MASTER_SITES = https://ftp.pcre.org/pub/pcre/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES  = $(DISTNAME).patch.gar
LICENSE = BSD_3_Clause

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lang/cxx
ifneq ($(DESTIMG),build)
BUILDDEPS = lib/pcre2
endif

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--enable-pcre2-8 \
	--enable-pcre2-16 \
	--enable-pcre2-32 \
	--enable-unicode \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -fv $(DESTDIR)$(libdir)/libpcre2-8.la
	@rm -fv $(DESTDIR)$(libdir)/libpcre2-16.la
	@rm -fv $(DESTDIR)$(libdir)/libpcre2-32.la
	@rm -fv $(DESTDIR)$(libdir)/libpcre2-posix.la
	@rm -fv $(DESTDIR)$(bindir)/config.d/pcre2-config
	@rm -fv $(DESTDIR)$(bindir)/config.d/$(GARHOST)-pcre2-config
	@mkdir -pv $(DESTDIR)$(bindir)/config.d
	@mv -fv $(DESTDIR)$(bindir)/pcre2-config $(DESTDIR)$(bindir)/config.d/pcre2-config
	@ln -sfv pcre2-config $(DESTDIR)$(bindir)/config.d/$(GARHOST)-pcre2-config
	@$(MAKECOOKIE)
