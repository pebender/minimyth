GARNAME = pkg-config
GARVERSION = $(PKGCONFIG_VERSION)
CATEGORIES = toolchain-dirty
SOURCEPKG = devel/pkg-config
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	toolchain-dirty/libc-crt
BUILDDEPS = \
	native/native \
	toolchain-dirty/ccache \
	toolchain-dirty/clang-wrappers \
	toolchain-dirty/bash \
	toolchain-dirty/coreutils \
	toolchain-dirty/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile wrapper

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--with-pc-path="$(DESTDIR)$(rootdir)" \
	--disable-host-tool \
	--with-internal-glib

GAR_EXTRA_CONF += toolchain-dirty/toolchain-dirty/toolchain.mk
GAR_EXTRA_CONF += devel/pkg-config/package-api.mk
include ../../gar.mk

install-wrapper:
	rm -fv $(DESTDIR)$(bindir)/$(GARHOST)-$(GARNAME)~
	echo '#!$(SHELL)'                                          >> $(DESTDIR)$(bindir)/$(GARHOST)-$(GARNAME)~
	echo 'PKG_CONFIG_PATH="$(PKG_CONFIG_PATH)"'                >> $(DESTDIR)$(bindir)/$(GARHOST)-$(GARNAME)~
	echo 'PKG_CONFIG_LIBDIR="$(PKG_CONFIG_LIBDIR)"'            >> $(DESTDIR)$(bindir)/$(GARHOST)-$(GARNAME)~
	echo 'PKG_CONFIG_SYSROOT_DIR="$(PKG_CONFIG_SYSROOT_DIR)"'  >> $(DESTDIR)$(bindir)/$(GARHOST)-$(GARNAME)~
	echo 'export PKG_CONFIG_PATH'                              >> $(DESTDIR)$(bindir)/$(GARHOST)-$(GARNAME)~
	echo 'export PKG_CONFIG_LIBDIR'                            >> $(DESTDIR)$(bindir)/$(GARHOST)-$(GARNAME)~
	echo 'export PKG_CONFIG_SYSROOT_DIR'                       >> $(DESTDIR)$(bindir)/$(GARHOST)-$(GARNAME)~
	echo '$(DESTDIR)$(bindir)/pkg-config $$*'                  >> $(DESTDIR)$(bindir)/$(GARHOST)-$(GARNAME)~
	chmod ugo+x                                                   $(DESTDIR)$(bindir)/$(GARHOST)-$(GARNAME)~
	mv -fv $(DESTDIR)$(bindir)/$(GARHOST)-$(GARNAME)~             $(DESTDIR)$(bindir)/$(GARHOST)-$(GARNAME)
	@$(MAkkKECOOKIE)
