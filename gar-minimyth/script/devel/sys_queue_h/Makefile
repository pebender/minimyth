GARNAME = sys_queue_h
GARVERSION =
CATEGORIES = devel
DISTFILES = queue.h
LICENSE = BSD_3_Clause

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = header

include ../../gar.mk

extract-queue.h:
	@echo " ==> Extracting $(DOWNLOADDIR)/queue.h"
	@mkdir -p $(WORKSRC)
	@cp -a $(DOWNLOADDIR)/queue.h $(WORKSRC)
	@$(MAKECOOKIE)

install-header:
	@mkdir -pv $(DESTDIR)$(includedir)/sys
	@install -v -m 0644 $(WORKSRC)/queue.h $(DESTDIR)$(includedir)/sys/queue.h
	@$(MAKECOOKIE)
