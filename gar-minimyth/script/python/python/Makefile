GARNAME = Python
GARVERSION =  $(PYTHON_VERSION)
CATEGORIES = python
MASTER_SITES = https://www.python.org/ftp/python/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c lib/expat lib/libffi lib/ncursesw lib/openssl lib/readline lib/zlib utils/bzip2 utils/xz db/sqlite
BUILDDEPS  = devel/autoconf devel/automake
ifneq ($(DESTIMG),build)
DEPENDS   += lib/bluez
BUILDDEPS += python/python
endif

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile

PWD := $(shell pwd)

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--enable-shared \
	--enable-optimizations \
	--disable-ipv6 \
	--with-system-expat

#	--with-system-ffi

ifneq ($(DESTIMG),build)
CONFIGURE_ENV = \
	_PYTHON_HOST_PLATFORM=$(GARHOST) \
	ax_cv_c_float_words_bigendian=no \
	ac_cv_file_dev_ptc=no \
	ac_cv_file_dev_ptmx=yes \
	ac_cv_file__dev_ptc=no \
	ac_cv_file__dev_ptmx=yes \
	ac_cv_func_lchflags_works=no \
	ac_cv_func_chflags_works=no \
	ac_cv_func_printf_zd=yes
endif

include ../../gar.mk

pre-configure:
	@cd $(WORKSRC) ; autoreconf --verbose --install --force
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -fv $(DESTDIR)$(libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config/libpython$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR).a
	@rm -fv $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@rm -fv $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR)-config
	@rm -fv $(DESTDIR)$(bindir)-config/python-config
	@rm -fv $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@rm -fv $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR)-config
	@rm -fv $(DESTDIR)$(bindir)-config/$(compiler_prefix)python-config
	@mkdir -pv $(DESTDIR)$(bindir)-config
	@mv -fv $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@mv -fv $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR)-config $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR)-config
	@rm -fv $(DESTDIR)$(bindir)/python-config
	@ln -sfv python$(PYTHON_VERSION_MAJOR)-config $(DESTDIR)$(bindir)-config/python-config
	@$(if $(compiler_prefix), ln -sfv python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config)
	@$(if $(compiler_prefix), ln -sfv python$(PYTHON_VERSION_MAJOR)-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR)-config)
	@$(if $(compiler_prefix), ln -sfv python-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)python-config)
	@rm -fv $(DESTDIR)$(bindir)/python
	@ln -sfv python$(PYTHON_VERSION_MAJOR) $(DESTDIR)$(bindir)/python
	@$(MAKECOOKIE)

clean-all:
	@rm -rfv $(DESTDIR)$(PYTHON_includedir)
	@rm -rfv $(DESTDIR)$(PYTHON_libdir)
	@rm -fv $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)
	@rm -fv $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR)
	@rm -fv $(DESTDIR)$(bindir)/python
	@rm -fv $(DESTDIR)$(bindir)-config/python-config
	@rm -fv $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR)-config
	@rm -fv $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@rm -fv $(DESTDIR)$(bindir)-config/$(compiler_prefix)python-config
	@rm -fv $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR)-config
	@rm -fv $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@$(MAKE) clean-image
