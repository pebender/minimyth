GARNAME = Python
GARVERSION = $(PYTHON2_VERSION)
CATEGORIES = python2
MASTER_SITES = https://www.python.org/ftp/python/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES  = $(DISTNAME)-no_default_links.patch
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c lang/cxx lib/ncursesw lib/openssl lib/readline lib/zlib
BUILDDEPS  =
ifneq ($(DESTIMG),build)
DEPENDS   += lib/bluez
BUILDDEPS += python2/python
endif

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile

PWD := $(shell pwd)

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--config-cache \
	--enable-shared \
	--enable-optimizations

CONFIGURE_ENV  = \
	
ifneq ($(DESTIMG),build)
CONFIGURE_ENV += \
	PYTHON_FOR_BUILD=$(build_DESTDIR)$(build_bindir)/python2 \
	PYTHON_FOR_REGEN=$(build_DESTDIR)$(build_bindir)/python2 \
	ac_cv_file__dev_ptc=no \
	ac_cv_file__dev_ptmx=yes \
	ac_cv_func_lchflags_works=no \
	ac_cv_func_chflags_works=no
endif

include ../../gar.mk

# Needed so that Python 2.6 can find the correct libpython shared library.
LDFLAGS := $(LDFLAGS) -L$(PWD)/$(WORKSRC)

post-install:
	@rm -fv $(DESTDIR)$(libdir)/python$(PYTHON2_VERSION_MAJOR).$(PYTHON2_VERSION_MINOR)/config/libpython$(PYTHON2_VERSION_MAJOR).$(PYTHON2_VERSION_MINOR).a
	@rm -fv $(DESTDIR)$(bindir)/config/python$(PYTHON2_VERSION_MAJOR)-config
	@rm -fv $(DESTDIR)$(bindir)/config/python$(PYTHON2_VERSION_MAJOR).$(PYTHON2_VERSION_MINOR)-config
	@rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-python$(PYTHON2_VERSION_MAJOR)-config
	@rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-python$(PYTHON2_VERSION_MAJOR).$(PYTHON2_VERSION_MINOR)-config
	@mkdir -pv $(DESTDIR)$(bindir)/config
	@rm -fv $(DESTDIR)$(bindir)/python-config
	@mv -fv $(DESTDIR)$(bindir)/python$(PYTHON2_VERSION_MAJOR)-config $(DESTDIR)$(bindir)/config/python$(PYTHON2_VERSION_MAJOR)-config
	@mv -fv $(DESTDIR)$(bindir)/python$(PYTHON2_VERSION_MAJOR).$(PYTHON2_VERSION_MINOR)-config $(DESTDIR)$(bindir)/config/python$(PYTHON2_VERSION_MAJOR).$(PYTHON2_VERSION_MINOR)-config
	@ln -sfv python$(PYTHON2_VERSION_MAJOR)-config $(DESTDIR)$(bindir)/config/$(GARHOST)-python-config
	@ln -sfv python$(PYTHON2_VERSION_MAJOR).$(PYTHON2_VERSION_MINOR)-config $(DESTDIR)$(bindir)/config/$(GARHOST)-python$(PYTHON2_VERSION_MAJOR).$(PYTHON2_VERSION_MINOR)-config
	@$(MAKECOOKIE)

clean-all:
	@rm -rfv $(DESTDIR)$(PYTHON2_includedir)
	@rm -rfv $(DESTDIR)$(PYTHON2_libdir)
	@rm -fv $(DESTDIR)$(bindir)/pydoc$(PYTHON2_VERSION_MAJOR)
	@rm -fv $(DESTDIR)$(bindir)/pydoc$(PYTHON2_VERSION_MAJOR).$(PYTHON2_VERSION_MINOR)
	@rm -fv $(DESTDIR)$(bindir)/python$(PYTHON2_VERSION_MAJOR)
	@rm -fv $(DESTDIR)$(bindir)/python$(PYTHON2_VERSION_MAJOR).$(PYTHON2_VERSION_MINOR)
	@rm -fv $(DESTDIR)$(bindir)/config/python$(PYTHON2_VERSION_MAJOR)-config
	@rm -fv $(DESTDIR)$(bindir)/config/python$(PYTHON2_VERSION_MAJOR).$(PYTHON2_VERSION_MINOR)-config
	@$(if $(compiler_prefix), rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-python$(PYTHON2_VERSION_MAJOR)-config)
	@$(if $(compiler_prefix), rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-python$(PYTHON2_VERSION_MAJOR).$(PYTHON2_VERSION_MINOR)-config)
	@$(MAKE) clean-image
