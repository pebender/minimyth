GARNAME = pkg-config
GARVERSION = 0.29.2
CATEGORIES = devel
MASTER_SITES = https://pkgconfig.freedesktop.org/releases/
DISTFILES = $(DISTNAME).tar.gz 
xPATCHFILES = \
	$(DISTNAME)-automake_1.13.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c
ifneq ("$(DESTIMG)","build")
BUILDDEPS = devel/pkg-config
endif

ifeq ("$(DESTIMG)","build")
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

include ../../gar.mk

pre-configure:
	@#$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)

install-wrapper:
	rm -fv $(build_DESTDIR)$(build_bindir)/$(compiler_prefix)$(GARNAME)~
	echo '#!$(SHELL)'                                          >> $(build_DESTDIR)$(build_bindir)/$(compiler_prefix)$(GARNAME)~
	echo 'PKG_CONFIG_PATH="$(PKG_CONFIG_PATH)"'                >> $(build_DESTDIR)$(build_bindir)/$(compiler_prefix)$(GARNAME)~
	echo 'PKG_CONFIG_LIBDIR="$(PKG_CONFIG_LIBDIR)"'            >> $(build_DESTDIR)$(build_bindir)/$(compiler_prefix)$(GARNAME)~
	echo 'PKG_CONFIG_SYSROOT_DIR="$(PKG_CONFIG_SYSROOT_DIR)"'  >> $(build_DESTDIR)$(build_bindir)/$(compiler_prefix)$(GARNAME)~
	echo 'export PKG_CONFIG_PATH'                              >> $(build_DESTDIR)$(build_bindir)/$(compiler_prefix)$(GARNAME)~
	echo 'export PKG_CONFIG_LIBDIR'                            >> $(build_DESTDIR)$(build_bindir)/$(compiler_prefix)$(GARNAME)~
	echo 'export PKG_CONFIG_SYSROOT_DIR'                       >> $(build_DESTDIR)$(build_bindir)/$(compiler_prefix)$(GARNAME)~
	echo '$(build_DESTDIR)$(build_bindir)/pkg-config $$*'      >> $(build_DESTDIR)$(build_bindir)/$(compiler_prefix)$(GARNAME)~
	chmod ugo+x                                                   $(build_DESTDIR)$(build_bindir)/$(compiler_prefix)$(GARNAME)~
	mv -fv $(build_DESTDIR)$(build_bindir)/$(compiler_prefix)$(GARNAME)~ $(build_DESTDIR)$(build_bindir)/$(GARHOST)-$(GARNAME)
	@$(MAkkKECOOKIE)
