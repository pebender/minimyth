GARNAME = gettext
GARVERSION = 0.20.1
CATEGORIES = devel
MASTER_SITES = https://ftp.gnu.org/gnu/gettext/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES = \
	$(DISTNAME)-non_interactive.patch \
	$(DISTNAME)-perl.patch.gar
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx build-tool/make

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-java \
	--disable-csharp \
	--enable-threads=posix \
	--enable-shared \
	--disable-static \
	--enable-nls \
	--disable-rpath \
	--enable-c++ \
	--enable-libasprintf \
	--disable-curses \
	--enable-namespacing \
	--disable-openmp \
	--disable-acl \
	--with-included-gettext \
	--without-libncurses-prefix \
	--without-libtermcap-prefix \
	--without-libxcurses-prefix \
	--without-libcurses-prefix \
	--with-included-libunistring \
	--with-included-libxml \
	--with-included-regex \
	--without-emacs \
	--without-git \
	--without-cvs \
	--without-bzip2 \
	--without-xz
BUILD_ARGS = DESTDIR="/"

include ../../gar.mk

post-install:
	@rm -fv $(DESTDIR)$(libdir)/libasprintf.la
	@rm -fv $(DESTDIR)$(libdir)/libgettextlib.la
	@rm -fv $(DESTDIR)$(libdir)/libgettextsrc.la
	@rm -fv $(DESTDIR)$(libdir)/libgettextpo.la
	@rm -fv $(DESTDIR)$(libdir)/libintl.la
	@rm -fv $(DESTDIR)$(libdir)/libtextstyle.la
	@$(MAKECOOKIE)
