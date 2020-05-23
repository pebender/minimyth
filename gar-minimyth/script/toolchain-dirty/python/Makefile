GARNAME = Python
GARVERSION = $(PYTHON3_VERSION)
CATEGORIES = toolchain-dirty
SOURCEPKG = python3/python
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	toolchain-dirty/libc-crt \
	toolchain-dirty/zlib \
	toolchain-dirty/libffi
BUILDDEPS = \
	native/native \
	toolchain-dirty/ccache \
	toolchain-dirty/clang-wrappers \
	toolchain-dirty/bash \
	toolchain-dirty/coreutils \
	toolchain-dirty/make \
	toolchain-dirty/pkg-config

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-ipv6 \
	--without-system-expat \
	--with-system-ffi \
	--without-system-libmpdec
CONFIGURE_ENV += \
	PKG_CONFIG="$(DESTDIR)$(bindir)/pkg-config"

GAR_EXTRA_CONF += toolchain-dirty/toolchain-dirty/toolchain.mk
GAR_EXTRA_CONF += python3/python/package-api.mk
include ../../gar.mk

# Python 3.8.1 cannot find zlib without this.
CPPFLAGS += -I$(DESTDIR)$(includedir)
LDFLAGS += -L$(DESTDIR)$(libdir)

post-install: post-install-configs

post-install-configs:
	@rm -fv $(DESTDIR)$(libdir)/python$(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)/config.d/libpython$(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR).a
	@rm -fv $(DESTDIR)$(bindir)/config.d/python$(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)-config
	@rm -fv $(DESTDIR)$(bindir)/config.d/python$(PYTHON3_VERSION_MAJOR)-config
	@rm -fv $(DESTDIR)$(bindir)/config.d/python-config
	@rm -fv $(DESTDIR)$(bindir)/config.d/$(GARHOST)-python$(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)-config
	@rm -fv $(DESTDIR)$(bindir)/config.d/$(GARHOST)-python$(PYTHON3_VERSION_MAJOR)-config
	@rm -fv $(DESTDIR)$(bindir)/config.d/$(GARHOST)-python-config
	@mkdir -pv $(DESTDIR)$(bindir)/config.d
	@mv -fv $(DESTDIR)$(bindir)/python$(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)-config $(DESTDIR)$(bindir)/config.d/python$(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)-config
	@mv -fv $(DESTDIR)$(bindir)/python$(PYTHON3_VERSION_MAJOR)-config $(DESTDIR)$(bindir)/config.d/python$(PYTHON3_VERSION_MAJOR)-config
	@rm -fv $(DESTDIR)$(bindir)/python-config
	@ln -sfv python$(PYTHON3_VERSION_MAJOR)-config $(DESTDIR)$(bindir)/config.d/python-config
	@ln -sfv python$(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)-config $(DESTDIR)$(bindir)/config.d/$(GARHOST)-python$(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)-config
	@ln -sfv python$(PYTHON3_VERSION_MAJOR)-config $(DESTDIR)$(bindir)/config.d/$(GARHOST)-python$(PYTHON3_VERSION_MAJOR)-config
	@ln -sfv python-config $(DESTDIR)$(bindir)/config.d/$(GARHOST)-python-config
	@rm -fv $(DESTDIR)$(bindir)/python
	@ln -sfv python$(PYTHON3_VERSION_MAJOR) $(DESTDIR)$(bindir)/python
	@$(MAKECOOKIE)

clean-all:
	@rm -rfv $(DESTDIR)$(PYTHON3_includedir)
	@rm -rfv $(DESTDIR)$(PYTHON3_libdir)
	@rm -fv $(DESTDIR)$(bindir)/python$(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)
	@rm -fv $(DESTDIR)$(bindir)/python$(PYTHON3_VERSION_MAJOR)
	@rm -fv $(DESTDIR)$(bindir)/python
	@rm -fv $(DESTDIR)$(bindir)/config.d/python-config
	@rm -fv $(DESTDIR)$(bindir)/config.d/python$(PYTHON3_VERSION_MAJOR)-config
	@rm -fv $(DESTDIR)$(bindir)/config.d/python$(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)-config
	@rm -fv $(DESTDIR)$(bindir)/config.d/$(GARHOST)-python-config
	@rm -fv $(DESTDIR)$(bindir)/config.d/$(GARHOST)-python$(PYTHON3_VERSION_MAJOR)-config
	@rm -fv $(DESTDIR)$(bindir)/config.d/$(GARHOST)-python$(PYTHON3_VERSION_MAJOR).$(PYTHON3_VERSION_MINOR)-config
	@$(MAKE) clean-image
