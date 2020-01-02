GARNAME = cwiid
GARVERSION = svn_history
CATEGORIES = utils
MASTER_SITES = https://github.com/abstrakraft/$(GARNAME)/archive/
DISTFILES = $(GARVERSION).tar.gz
PATCHFILES = $(DISTNAME)-no_gtk.patch $(DISTNAME)-ldlibs.patch $(DISTNAME)-rootdir.patch $(DISTNAME)-ioctl_ui_set_phys.patch $(DISTNAME)-wait_forever_sleep.patch $(DISTNAME)-abs_only.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lib/bluez

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--without-python \
	--disable-ldconfig

include ../../gar.mk

LDFLAGS_BAD = -Wl,--as-needed
LDFLAGS := $(filter-out $(LDFLAGS_BAD), $(LDFLAGS))

svn//%/$(DISTNAME).tar.bz2:
	@$(call FETCH_SVN, http://$*, $(GARVERSION), $(DISTNAME))
	@$(MAKECOOKIE)

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libcwiid.a
	@$(MAKECOOKIE)
