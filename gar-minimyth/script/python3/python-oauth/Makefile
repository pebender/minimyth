GARNAME = python-oauth
GARVERSION = 1269
CATEGORIES = python3
MASTER_SITES = svn://oauth.googlecode.com/svn/code/python/
DISTFILES = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.bz2
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c

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

svn//%/$(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.bz2:
	@$(call FETCH_SVN, http://$*, $(GARVERSION), $(patsubst python-%,%,$(GARNAME))-$(GARVERSION))
	@$(MAKECOOKIE)

checksum-$(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.bz2:
	@$(MAKECOOKIE)

build-%/setup.py:
	@echo " ==> Running setup.py build in $*"
	@cd $* && $(CONFIGURE_ENV) $(BUILD_ENV) python3 setup.py $(CONFIGURE_ARGS) build $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/setup.py: 
	@echo " ==> Running setup.py install in $*"
	@cd $* && $(CONFIGURE_ENV) $(INSTALL_ENV) python3 setup.py $(CONFIGURE_ARGS) install --skip-build $(INSTALL_ARGS)
	@$(MAKECOOKIE)
