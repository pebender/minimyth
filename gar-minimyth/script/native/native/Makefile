GARNAME = native
GARVERSION =
CATEGORIES = native
LICENSE =

DESCRIPTION =
define BLURB
endef

INSTALL_SCRIPTS = bins

build_DESTDIR = $(native_DESTDIR)
build_rootdir = $(native_rootdir)
main_DESTDIR = $(native_DESTDIR)
main_rootdir = $(native_rootdir)

GAR_EXTRA_CONF += native/native/package-api.mk
include ../../gar.mk

pre-install:
	@rm -rfv $(DESTDIR)
	@$(MAKECOOKIE)

install-bins:
	@rm -rfv $(DESTDIR)$(bindir)
	@mkdir -pv $(DESTDIR)$(bindir)
	@$(foreach pkg,$(native_bins), \
		$(foreach bin,$(sort $(native_bins_$(subst -,_,$(pkg)))), \
			which $(bin) > /dev/null 2>&1 ; \
			if [ ! "$$?" = "0" ] ; then \
				echo "error: your system does not contain the program '$(bin)' (from package '$(pkg)')." ; \
				exit 1 ; \
			fi ; \
			ln -sfv `which $(bin)` $(DESTDIR)$(bindir)/$(bin) ; \
		) \
	)
	@$(MAKECOOKIE)
