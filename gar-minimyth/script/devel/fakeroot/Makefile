GARNAME = fakeroot
GARVERSION = 1.22
CATEGORIES = devel
MASTER_SITES = https://mirrors.aliyun.com/oldubuntu-releases/ubuntu/pool/main/f/fakeroot/
DISTFILES = $(GARNAME)_$(GARVERSION).orig.tar.bz2
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libcap

CONFIGURE_SCRIPTS = $(WORKSRC)/configure shell
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static
BUILD_ARGS     = \
	SUBDIRS="scripts test"
INSTALL_ARGS   = \
	SUBDIRS="scripts test"

include ../../gar.mk

ifneq ($(DESTIMG),build)
CFLAGS += -D_STAT_VER=0
endif

x-pre-configure:
	@cd $(WORKSRC) ; mkdir -p build-aux
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

configure-shell:
	@$(if $(filter build,$(DESTIMG)), \
		sed -i -e 's%@SHELL@%$(DESTDIR)$(ebindir)/sh%g' $(WORKSRC)/scripts/fakeroot.in , \
		sed -i -e 's%@SHELL@%$(ebindir)/sh%g' $(WORKSRC)/scripts/fakeroot.in \
	)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libfakeroot.la
	@$(MAKECOOKIE)
