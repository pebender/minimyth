GARNAME = perl
GARVERSION = $(PERL_VERSION)
CATEGORIES = perl
MASTER_SITES = https://www.cpan.org/src/
MASTER_SITES += https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)/
DISTFILES = $(DISTNAME).tar.gz
ifneq ($(DESTIMG),build)
DISTFILES += perl-cross-$(PERL_CROSS_VERSION).tar.gz
endif
PATCHFILES = $(GARNAME)-dash.patch $(GARNAME)-perl.patch.gar $(GARNAME)-path.patch $(GARNAME)-perl5lib.patch
ifeq ($(DESTIMG),build)
PATCHFILES += $(GARNAME)-cbuilder.patch $(GARNAME)-xsloader.patch $(GARNAME)-dynaloader.patch $(GARNAME)-errno.patch
endif
LICENSE = Artistic

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c
BUILDDEPS = utils/bash
ifneq ($(DESTIMG),build)
BUILDDEPS += perl/perl
endif

ifeq ($(DESTIMG),build)
CONFIGURE_SCRIPTS = create $(WORKSRC)/configure cleanup
CONFIGURE_ARGS = \
	-d \
	-e \
	-Dprefix="$(prefix)" \
	-Dman1dir='$(mandir)/man1' \
	-Dman3dir='$(mandir)/man3' \
	-Dpager='/bin/less -isR' \
	-Dusrinc="$(DESTDIR)$(includedir)" \
	-Dlibpth="$(PERL_libpth)" \
	-Dglibpth="$(PERL_libpth)" \
	-Dldlibpthname='none' \
	-Dshrpenv=' ' \
	-Duseshrplib='true' \
	-Dcpp="$(CPP)" \
	-Dcc="$(CC)" \
	-Dld="$(CC)" \
	-Dar="$(AR)" \
	-Dnm="$(NM)" \
	-Dranlib="$(RANLIB)" \
	-Dccflags="$(CFLAGS)" \
	-Dldflags="$(LDFLAGS)" \
	-Dusethreads \
	-Adefine:cf_by=' ' \
	-Adefine:cf_email=' ' \
	-Adefine:locincpth=' ' \
	-Adefine:loclibpth=' ' \
	-Adefine:mydomain=' ' \
	-Adefine:myhostname=' ' \
	-Adefine:myuname=' ' \
	-Adefine:optimize=' '
else
CONFIGURE_SCRIPTS = $(WORKSRC)/configure
CONFIGURE_ARGS = \
	--prefix="$(prefix)" \
	--html1dir="$(docdir)/perl/html" \
	--html3dir="$(docdir)/perl/html" \
	--man1dir="$(mandir)/man1" \
	--man3dir="$(mandir)/man3" \
	--build="$(GARBUILD)" \
	--target="$(GARHOST)" \
	--with-cc="$(CC)" \
	--with-cpp="$(CPP)" \
	--with-ar="$(AR)" \
	--with-ranlib="$(RANLIB)" \
	--with-objdump="$(OBJDUMP)" \
	--host-cc="$(build_CC)" \
	--host-cpp="$(build_CPP)" \
	--host-ar="$(build_AR)" \
	--host-ranlib="$(build_RANLIB)" \
	--host-objdump="$(build_OBJDUMP)" \
	-Duseshrplib='true'
endif
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = config $(WORKSRC)/Makefile

CONFIGURE_ENV = $(PERL_CONFIGURE_ENV)
BUILD_ENV     = $(PERL_BUILD_ENV)
INSTALL_ENV   = $(PERL_INSTALL_ENV)

GAR_EXTRA_CONF += tainted-build/gcc/package-api.mk
GAR_EXTRA_CONF += tainted-main/glibc/package-api.mk
GAR_EXTRA_CONF += kernel/linux/package-api.mk
include ../../gar.mk

# Perl insists on adding the path to AR.
#AR := $(notdir $(AR))

CPPFLAGS := $(PERL_CPPFLAGS)
CFLAGS   := $(PERL_CFLAGS)
CXXFLAGS := $(PERL_CXXFLAGS)
LDFLAGS  := $(PERL_LDFLAGS)

PERL_config_sh_check=$(if $(filter-out $(PERL_config_sh_$(2)),$($(2))), \
	echo "warning: config.sh was generated using $(1) $(PERL_config_sh_$(2)) but you are using $(1) $($(2)).")
PERL_config_sh_var=$(shell cat files/$(GARNAME)-config_sh-$(GARCH_FAMILY).patch.gar \
	| grep -e "^+$(1)=" | sed -e "s%^+$(1)='\(.*\)'%\1%")
PERL_config_sh_GCC_VERSION=$(call PERL_config_sh_var,gccversion)
PERL_config_sh_GLIBC_VERSION=$(call PERL_config_sh_var,gnulibc_version)
PERL_config_sh_LINUX_VERSION=$(call PERL_config_sh_var,osvers)

PERL_libpth := $(LIBRARY_PATH)

extract-perl-cross-$(PERL_CROSS_VERSION).tar.gz:
	@echo " ==> Extracting $(DOWNLOADDIR)/perl-cross-$(PERL_CROSS_VERSION).tar.gz"
	@gzip -dc $(DOWNLOADDIR)/perl-cross-$(PERL_CROSS_VERSION).tar.gz | tar --strip-components=1 -xf - -C $(WORKSRC)
	@$(MAKECOOKIE)

configure-create:
	@ln -sf Configure $(WORKSRC)/configure
	@$(MAKECOOKIE)

configure-cleanup:
	@$(BUILD_ENV) $(MAKE) $(PARALLELMFLAGS) $(foreach TTT,$(BUILD_OVERRIDE_DIRS),$(TTT)="$($(TTT))") -C $(WORKSRC) $(BUILD_ARGS) depend
	@for file in `find $(WORKSRC) -name makefile` ; do \
		sed -i 's%^[^:]*: *<command-line>$$%%' $${file} ; \
	 done
	@$(MAKECOOKIE)

pre-install:
	@cd $(DESTDIR)$(libdir) ; rm -f libperl.so

install-config:
	@mkdir -p $(DESTDIR)$(PERL_configdir)
	@cp -f $(WORKSRC)/lib/Config.pm       $(DESTDIR)$(PERL_configdir)
	@cp -f $(WORKSRC)/lib/Config.pod      $(DESTDIR)$(PERL_configdir)
	@cp -f $(WORKSRC)/lib/Config_heavy.pl $(DESTDIR)$(PERL_configdir)
	@$(MAKECOOKIE)

install-miniperl:
	@mkdir -p $(DESTDIR)$(bindir)
	@if test -e $(WORKSRC)/miniperl ; then \
		cp -f $(WORKSRC)/miniperl $(DESTDIR)$(bindir)/perl-miniperl ; \
	fi
	@$(MAKECOOKIE)

install-generate_uudmap:
	@mkdir -p $(DESTDIR)$(bindir)
	@if test -e $(WORKSRC)/generate_uudmap ; then \
		cp -f $(WORKSRC)/generate_uudmap $(DESTDIR)$(bindir)/perl-generate_uudmap ; \
	fi
	@$(MAKECOOKIE)

post-install:
	@mv -f $(DESTDIR)$(PERL_archlib)/CORE/libperl.so $(DESTDIR)$(libdir)/libperl.so
	@$(MAKECOOKIE)

source-update:
	@$(MAKE) source-update-source
	@$(MAKE) source-update-patches

source-update-source:
	@$(MAKE) clean
	@$(MAKE) fetch
	@$(MAKE) $(GARCHIVEDIR)/$(DISTNAME).tar.gz
	@$(MAKE) clean

source-update-patches:
	@$(MAKE) clean
	@$(MAKE) extract
	@$(foreach PATCHFILE, $(PATCHFILES), \
		echo "*** applying $(PATCHFILE) ***" ; \
		cd $(WORKDIR) || exit 1 ; \
		chmod -R u+w $(DISTNAME) ; \
		mv $(DISTNAME) $(DISTNAME)-old || exit 1 ; \
		cp -r $(DISTNAME)-old $(DISTNAME)-new || exit 1 ; \
		cd $(DISTNAME)-new || exit 1 ; \
		SIMPLE_BACKUP_SUFFIX=.gar-source-update-patches patch -p1 < ../../../files/$(PATCHFILE) || exit 1 ; \
		cd ../ || exit 1 ; \
		find $(DISTNAME)-new -name *.gar-source-update-patches -exec rm {} \; || exit 1 ; \
		( diff -Naur $(DISTNAME)-old $(DISTNAME)-new > ../../files/$(PATCHFILE) ; test $$? -lt 2 ) || exit 1 ; \
		rm -fr $(DISTNAME)-old || exit 1 ; \
		mv $(DISTNAME)-new $(DISTNAME) || exit 1 ; \
		cd ../../ || exit 1 ; \
		rm -f checksums~ || exit 1 ; \
		cat checksums | grep -v $(DOWNLOADDIR)/$(PATCHFILE) > checksums~ || true ; \
		md5sum $(DOWNLOADDIR)/$(PATCHFILE) >> checksums~ || exit 1 ; \
		rm -f checksums || exit 1 ; \
		mv -f checksums~ checksums || exit 1 ; )
	@$(MAKE) clean
