GARNAME = Python
GARVERSION = $(PYTHON_VERSION)
CATEGORIES = tainted-build
SOURCEPKG = python/python
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	tainted-build/libc-crt \
	tainted-build/zlib \
	tainted-build/libffi
BUILDDEPS = \
	native/native \
	tainted-build/gcc-wrappers \
	tainted-build/bash \
	tainted-build/coreutils \
	tainted-build/make \
	tainted-build/pkg-config

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

GAR_EXTRA_CONF += tainted-build/tainted-build/toolchain.mk
GAR_EXTRA_CONF += python/python/package-api.mk
include ../../gar.mk

# Python 3.8.1 cannot find zlib without this.
CPPFLAGS += -I$(DESTDIR)$(includedir)
LDFLAGS += -L$(DESTDIR)$(libdir)

post-install: post-install-configs

post-install-configs:
	@rm -fv $(DESTDIR)$(libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config/libpython$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR).a
	@rm -fv $(DESTDIR)$(bindir)/config/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@rm -fv $(DESTDIR)$(bindir)/config/python$(PYTHON_VERSION_MAJOR)-config
	@rm -fv $(DESTDIR)$(bindir)/config/python-config
	@rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-python$(PYTHON_VERSION_MAJOR)-config
	@rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-python-config
	@mkdir -pv $(DESTDIR)$(bindir)/config
	@mv -fv $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config $(DESTDIR)$(bindir)/config/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@mv -fv $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR)-config $(DESTDIR)$(bindir)/config/python$(PYTHON_VERSION_MAJOR)-config
	@rm -fv $(DESTDIR)$(bindir)/python-config
	@ln -sfv python$(PYTHON_VERSION_MAJOR)-config $(DESTDIR)$(bindir)/config/python-config
	@ln -sfv python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config $(DESTDIR)$(bindir)/config/$(GARHOST)-python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@ln -sfv python$(PYTHON_VERSION_MAJOR)-config $(DESTDIR)$(bindir)/config/$(GARHOST)-python$(PYTHON_VERSION_MAJOR)-config
	@ln -sfv python-config $(DESTDIR)$(bindir)/config/$(GARHOST)-python-config
	@rm -fv $(DESTDIR)$(bindir)/python
	@ln -sfv python$(PYTHON_VERSION_MAJOR) $(DESTDIR)$(bindir)/python
	@$(MAKECOOKIE)

clean-all:
	@rm -rfv $(DESTDIR)$(PYTHON_includedir)
	@rm -rfv $(DESTDIR)$(PYTHON_libdir)
	@rm -fv $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)
	@rm -fv $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR)
	@rm -fv $(DESTDIR)$(bindir)/python
	@rm -fv $(DESTDIR)$(bindir)/config/python-config
	@rm -fv $(DESTDIR)$(bindir)/config/python$(PYTHON_VERSION_MAJOR)-config
	@rm -fv $(DESTDIR)$(bindir)/config/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-python-config
	@rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-python$(PYTHON_VERSION_MAJOR)-config
	@rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@$(MAKE) clean-image
