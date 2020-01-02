GARNAME = ninja
GARVERSION = 1.9.0
CATEGORIES = python
MASTER_SITES = https://github.com/ninja-build/$(GARNAME)/archive/
DISTFILES = v$(GARVERSION).tar.gz
xPATCHFILES = \
	$(DISTNAME)-cross.patch.gar
LICENSE = Apache_2_0

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/cxx
BUILDDEPS = python2/python python/python

WORKSRC = $(WORKDIR)/$(patsubst python-%,%,$(GARNAME))-$(GARVERSION)

BUILD_SCRIPTS   = $(WORKSRC)/configure.py
INSTALL_SCRIPTS = custom

BUILD_ARGS = \
	--bootstrap \
	--verbose

include ../../gar.mk

build-%/configure.py:
	@echo " ==> Running configure.y in in $*"
	@cd $* && $(BUILD_ENV) python3 configure.py $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-custom: 
	@echo " ==> Installing ninja"
	@cp -fv $(WORKSRC)/ninja $(DESTDIR)$(bindir)/ninja
	@$(MAKECOOKIE)
