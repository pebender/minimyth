GARNAME = python-PyMySQL
GARVERSION = 0.9.3
CATEGORIES = python3
MASTER_SITES = https://github.com/PyMySQL/PyMySQL/archive/
DISTFILES = v$(GARVERSION).tar.gz
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c python3/python db/mariadb

WORKSRC = $(WORKDIR)/$(patsubst python-%,%,$(GARNAME))-$(GARVERSION)

BUILD_SCRIPTS   = $(WORKSRC)/setup.py
INSTALL_SCRIPTS = $(WORKSRC)/setup.py

CONFIGURE_ARGS =
BUILD_ARGS     =
INSTALL_ARGS   = \
	--prefix=$(DESTDIR)$(prefix)
CONFIGURE_ENV  =
BUILD_ENV      =
INSTALL_ENV    = \
	PYTHONPATH=$(DESTDIR)$(PYTHON3_libdir)/site-packages

ifneq ($(DESTIMG),build)
#BUILD_ARGS += --cross-compile
#BUILD_ENV  += PYTHONXCPREFIX=$(DESTDIR)$(prefix)
endif

GAR_EXTRA_CONF += python3/python/package-api.mk
include ../../gar.mk

CFLAGS  := $(CFLAGS)  -fPIC
LDFLAGS := $(LDFLAGS) -fPIC

CFLAGS  += -I$(DESTDIR)$(PYTHON3_includedir)
CFLAGS  += -L$(DESTDIR)$(libdir)
LDFLAGS += -I$(DESTDIR)$(PYTHON3_includedir)
LDFLAGS += -L$(DESTDIR)$(libdir)

build-%/setup.py:
	@echo " ==> Running setup.py build in $*"
	@cd $* && $(CONFIGURE_ENV) $(BUILD_ENV) python3 setup.py $(CONFIGURE_ARGS) build $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/setup.py: 
	@echo " ==> Running setup.py install in $*"
	@cd $* && $(CONFIGURE_ENV) $(INSTALL_ENV) python3 setup.py $(CONFIGURE_ARGS) install --skip-build $(INSTALL_ARGS)
	@$(MAKECOOKIE)
