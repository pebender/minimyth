GARNAME = python-urlgrabber
GARVERSION = 3.9.1
CATEGORIES = python3
MASTER_SITES = http://urlgrabber.baseurl.org/download/
DISTFILES = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
PATCHFILES  = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION)-setuptools.patch
PATCHFILES += $(patsubst python-%,%,$(GARNAME))-$(GARVERSION)-cross.patch
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c python3/python python3/python-pycurl

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
BUILD_ARGS += --cross-compile
BUILD_ENV  += PYTHONXCPREFIX=$(DESTDIR)$(prefix)
endif

GAR_EXTRA_CONF += python3/python/package-api.mk
include ../../gar.mk

#CFLAGS  += -L$(DESTDIR)$(libdir)
#LDFLAGS += -L$(DESTDIR)$(libdir)

build-%/setup.py:
	@echo " ==> Running setup.py build in $*"
	@cd $* && $(CONFIGURE_ENV) $(BUILD_ENV) python3 setup.py $(CONFIGURE_ARGS) build $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/setup.py: 
	@echo " ==> Running setup.py install in $*"
	@cd $* && $(CONFIGURE_ENV) $(INSTALL_ENV) python3 setup.py $(CONFIGURE_ARGS) install --skip-build $(INSTALL_ARGS)
	@$(MAKECOOKIE)
