GARNAME = gawk
GARVERSION = $(GAWK_VERSION)
CATEGORIES = utils
MASTER_SITES = https://ftp.gnu.org/gnu/gawk/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-nls \
	--enable-lint \
	--enable-builtin-intdiv0 \
	--disable-mpfr \
	--disable-nls \
	--disable-rpath \
	--without-libiconv-prefix \
	--without-libintl-prefix \
	--without-libsigsegv-prefix
BUILD_ARGS = \
	MANS="" \
	INFO_DEPS=""
INSTALL_ARGS = \
	MANS="" \
	INFO_DEPS=""

GAR_EXTRA_CONF += utils/gawk/package-api.mk
include ../../gar.mk
