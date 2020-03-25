GARNAME = pkg-config
GARVERSION = $(PKGCONFIG_VERSION)
CATEGORIES = clang-build
SOURCEPKG = devel/pkg-config
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILDDEPS = \
	native/native \
	cc-build/ccache \
	clang-build/clang \
	clang-build/clang-wrappers \
	clang-build/bash \
	clang-build/coreutils \
	clang-build/make

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

GAR_EXTRA_CONF += clang-build/clang-build/toolchain.mk
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
