GARNAME = python-pycurl
GARVERSION = 7.43.0.5
CATEGORIES = python
MASTER_SITES = https://github.com/pycurl/pycurl/archive/
DISTFILES = REL_$(subst .,_,$(GARVERSION)).tar.gz
LICENSE = LGPL2_1/MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lib/openssl net/curl

WORKSRC = $(WORKDIR)/$(patsubst python-%,%,$(GARNAME))-REL_$(subst .,_,$(GARVERSION))

CONFIGURE_SCRIPTS = $(WORKSRC)/Makefile
BUILD_SCRIPTS = $(WORKSRC)/setup.py
INSTALL_SCRIPTS = $(WORKSRC)/setup.py

CONFIGURE_ARGS =
BUILD_ARGS     = \
	--with-openssl \
	--openssl-dir="$(DESTDIR)$(prefix)" \
	--curl-config="$(DESTDIR)$(bindir)/config/curl-config"
INSTALL_ARGS   = \
	--prefix=$(DESTDIR)$(prefix)
CONFIGURE_ENV  =
BUILD_ENV      =
INSTALL_ENV    = \
	PYTHONPATH=$(DESTDIR)$(PYTHON_libdir)/site-packages

ifneq ($(DESTIMG),build)
#BUILD_ARGS += --cross-compile
BUILD_ENV  += PYTHONXCPREFIX=$(DESTDIR)$(prefix)
endif

GAR_EXTRA_CONF += python/python/package-api.mk
include ../../gar.mk

CFLAGS  := $(CFLAGS)  -fPIC
LDFLAGS := $(LDFLAGS) -fPIC

CFLAGS  += -I$(DESTDIR)$(PYTHON_includedir)
CFLAGS  += -L$(DESTDIR)$(libdir)
LDFLAGS += -I$(DESTDIR)$(PYTHON_includedir)
LDFLAGS += -L$(DESTDIR)$(libdir)

configure-%/Makefile:
	@echo " ==> Running make in $*"
	@$(CONFIGURE_ENV) $(MAKE) $(PARALLELMFLAGS) $(foreach TTT,$(CONFIGURE_OVERRIDE_DIRS),$(TTT)="$($(TTT))") -C $* $(CONFIGURE_ARGS) gen
	@$(MAKECOOKIE)

build-%/setup.py:
	@echo " ==> Running setup.py build in $*"
	cd $* && $(CONFIGURE_ENV) $(BUILD_ENV) python setup.py $(CONFIGURE_ARGS) build $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/setup.py: 
	@echo " ==> Running setup.py install in $*"
	@cd $* && $(CONFIGURE_ENV) $(INSTALL_ENV) python setup.py $(CONFIGURE_ARGS) install --skip-build $(INSTALL_ARGS)
	@$(MAKECOOKIE)
