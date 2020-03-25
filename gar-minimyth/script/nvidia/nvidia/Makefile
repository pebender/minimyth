GARNAME = nvidia
CATEGORIES = nvidia
NVIDIA_MAJOR_VERSION = 304
NVIDIA_MINOR_VERSION = 125
NVIDIA_TEENY_VERSION = 
LICENSE =

DESCRIPTION = 
define BLURB
endef

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
