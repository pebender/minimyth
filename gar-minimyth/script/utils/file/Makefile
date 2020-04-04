GARNAME = file
GARVERSION = 5.38
CATEGORIES = utils
MASTER_SITES = ftp://ftp.astron.com/pub/file/
MASTER_SITES += ftp://ftp.gw.com/mirrors/pub/unix/file/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = BSD_2_Clause

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/zlib utils/bzip2 utils/xz
BUILDDEPS =
ifneq ($(DESTIMG),build)
BUILDDEPS += utils/file
endif

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-elf \
	--enable-elf-core \
	--enable-zlib \
	--enable-bzlib \
	--enable-xzlib \
	--disable-libseccomp \
	--enable-fsect-man5 \
	--disable-static \
	--enable-shared

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libmagic.la
	@$(MAKECOOKIE)
