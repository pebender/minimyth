GARNAME = Python
GARVERSION =  $(PYTHON3_VERSION)
CATEGORIES = python3
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
BUILDDEPS += python3/python
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
