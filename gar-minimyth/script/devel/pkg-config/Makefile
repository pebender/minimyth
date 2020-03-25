GARNAME = pkg-config
GARVERSION = $(PKGCONFIG_VERSION)
CATEGORIES = devel
MASTER_SITES = https://pkgconfig.freedesktop.org/releases/
DISTFILES = $(DISTNAME).tar.gz 
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

ifeq ($(DESTIMG),build)
DEPENDS = lang/c build-tool/make
else
BUILDDEPS = devel/pkg-config
endif

CONFIGURE_SCRIPTS  =
BUILD_SCRIPTS      =
INSTALL_SCRIPTS    =
ifeq ($(DESTIMG),build)
CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile
endif
INSTALL_SCRIPTS   += wrapper

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--with-pc-path="$(DESTDIR)$(rootdir)" \
	--disable-host-tool \
	--with-internal-glib

GAR_EXTRA_CONF += devel/pkg-config/package-api.mk
include ../../gar.mk

install-wrapper:
	rm -fv $(build_DESTDIR)$(build_bindir)/$(GARHOST)-$(GARNAME)~
	echo '#!$(SHELL)'                                          >> $(build_DESTDIR)$(build_bindir)/$(GARHOST)-$(GARNAME)~
	echo 'PKG_CONFIG_PATH="$(PKG_CONFIG_PATH)"'                >> $(build_DESTDIR)$(build_bindir)/$(GARHOST)-$(GARNAME)~
	echo 'PKG_CONFIG_LIBDIR="$(PKG_CONFIG_LIBDIR)"'            >> $(build_DESTDIR)$(build_bindir)/$(GARHOST)-$(GARNAME)~
	echo 'PKG_CONFIG_SYSROOT_DIR="$(PKG_CONFIG_SYSROOT_DIR)"'  >> $(build_DESTDIR)$(build_bindir)/$(GARHOST)-$(GARNAME)~
	echo 'export PKG_CONFIG_PATH'                              >> $(build_DESTDIR)$(build_bindir)/$(GARHOST)-$(GARNAME)~
	echo 'export PKG_CONFIG_LIBDIR'                            >> $(build_DESTDIR)$(build_bindir)/$(GARHOST)-$(GARNAME)~
	echo 'export PKG_CONFIG_SYSROOT_DIR'                       >> $(build_DESTDIR)$(build_bindir)/$(GARHOST)-$(GARNAME)~
	echo '$(build_DESTDIR)$(build_bindir)/pkg-config $$*'      >> $(build_DESTDIR)$(build_bindir)/$(GARHOST)-$(GARNAME)~
	chmod ugo+x                                                   $(build_DESTDIR)$(build_bindir)/$(GARHOST)-$(GARNAME)~
	mv -fv $(build_DESTDIR)$(build_bindir)/$(GARHOST)-$(GARNAME)~ $(build_DESTDIR)$(build_bindir)/$(GARHOST)-$(GARNAME)
	@$(MAkkKECOOKIE)
