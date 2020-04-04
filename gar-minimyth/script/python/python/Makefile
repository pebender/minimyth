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

DEPENDS = lang/c lang/cxx lib/expat lib/libffi lib/ncursesw lib/openssl lib/readline lib/zlib utils/bzip2 utils/xz db/sqlite
BUILDDEPS  =
ifneq ($(DESTIMG),build)
DEPENDS   += lib/bluez
BUILDDEPS += python/python
endif

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-ipv6 \
	--with-system-expat \
	--with-system-ffi \
	--without-system-libmpdec
CONFIGURE_ENV += \
	PKG_CONFIG="$(build_DESTDIR)$(build_bindir)/pkg-config"

ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--without-ensurepip
CONFIGURE_ENV += \
	_PYTHON_HOST_PLATFORM=$(GARHOST) \
	HOSTPYTHON="$(build_DESTDIR)$(build_bindir)/python" \
	ax_cv_c_float_words_bigendian=no \
	ac_cv_file_dev_ptc=no \
	ac_cv_file_dev_ptmx=yes \
	ac_cv_file__dev_ptc=no \
	ac_cv_file__dev_ptmx=yes \
	ac_cv_func_lchflags_works=no \
	ac_cv_func_chflags_works=no \
	ac_cv_func_printf_zd=yes \
	ac_cv_header_stropts_h=no
endif

include ../../gar.mk

# Python 3.8.2 cannot find zlib without this.
#CPPFLAGS += -I$(DESTDIR)$(includedir)
#LDFLAGS += -L$(DESTDIR)$(libdir)

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
