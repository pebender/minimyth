GARNAME = gmp
GARVERSION = 6.2.0
CATEGORIES = lib
MASTER_SITES = https://ftp.gnu.org/gnu/gmp/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL3/LGPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
ifeq ($(DESTIMG),build)
BUILD_SCRIPTS     += check
endif
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-cxx \
	--enable-assembly \
	--enable-fft \
	--enable-shared \
	--disable-static \
	--without-readline \
	--with-gnu-ld

include ../../gar.mk

x-pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

build-check:
	@echo " ==> Running make check in $(WORKSRC)"
	@$(BUILD_ENV) $(MAKE) $(PARALLELMFLAGS) $(foreach TTT,$(BUILD_OVERRIDE_DIRS),$(TTT)="$($(TTT))") -C $(WORKSRC) $(BUILD_ARGS) check
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libgmp.la
	@rm -f $(DESTDIR)$(libdir)/libgmpxx.la
	@$(MAKECOOKIE)
