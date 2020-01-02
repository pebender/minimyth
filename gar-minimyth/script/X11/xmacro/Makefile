GARNAME = xmacro
GARVERSION = pre0.3-20000911
CATEGORIES = X11
MASTER_SITES = https://sourceforge.net/projects/xmacro/files/xmacro/pre0.3/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-c++.patch $(DISTNAME)-makefile.patch
LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/cxx xorg/xorg

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

include ../../gar.mk

LDFLAGS  := $(LDFLAGS) -fwhole-program

CXXFLAGS := $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS)
