GARNAME = ruby
GARVERSION = 2.7.1
CATEGORIES = devel
MASTER_SITES = https://cache.ruby-lang.org/pub/ruby/2.7/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/gmp

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-rpath
BUILD_ARGS = \
	Q=""
INSTALL_ARGS = \
	Q=""

include ../../gar.mk
