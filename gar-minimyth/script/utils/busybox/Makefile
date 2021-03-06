GARNAME = busybox
GARVERSION = 1.31.1
CATEGORIES = utils
MASTER_SITES = http://www.busybox.net/downloads/
MASTER_SITES += http://www.busybox.net/downloads/fixes-$(GARVERSION)/
CONFIGFILE = $(DISTNAME).config
DISTFILES = $(DISTNAME).tar.bz2
DISTFILES += $(CONFIGFILE)
PATCHFILES = \
	$(DISTNAME)-werror.patch \
	$(DISTNAME)-be5a505d.patch \
	$(DISTNAME)-dhcp_log_server.patch \
	$(DISTNAME)-tftp_timeout.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = custom

DEFAULT_ARGS = \
	ARCH="$(GARCH_FAMILY)" \
	HOSTCFLAGS="$(build_CFLAGS)" \
	HOSTCXXFLAGS="$(build_CXXFLAGS)" \
	HOSTCC="$(build_CC)" \
	HOSTCXX="$(build_CXX)" \
	CFLAGS="$(CFLAGS)" \
	CXXFLAGS="$(CXXFLAGS)" \
	CC="$(CC)" \
	CPP="$(CPP)" \
	LD="$(CC)" \
	AS="$(AS)" \
	AR="$(AR)" \
	NM="$(NM)" \
	STRIP="$(STRIP)" \
	RANLIB="$(RANLIB)" \
	OBJCOPY="$(OBJCOPY)" \
	OBJDUMP="$(OBJDUMP)" \
	OBJSIZE="size" \
	CROSS_COMPILE="$(GARHOST)-" \
	KBUILD_VERBOSE="1" \
	V="1" \
	SKIP_STRIP="y"

CONFIGURE_ARGS = $(DEFAULT_ARGS)
BUILD_ARGS = $(DEFAULT_ARGS)
INSTALL_ARGS = $(DEFAULT_ARGS)

CONFIGURE_ENV = $(DEFAULT_ARGS)
BUILD_ENV = $(DEFAULT_ARGS)
INSTALL_ENV = $(DEFAULT_ARGS)

GAR_EXTRA_CONF += toolchain/toolchain/toolchain-gcc.mk
include ../../gar.mk

# Build system includes LDFLAGS in HOST flags.
LDFLAGS :=

extract-$(CONFIGFILE):
	@cat $(DOWNLOADDIR)/$(CONFIGFILE) \
		| sed -e 's%@GAR_localstatedir@%$(localstatedir)%g' \
		| sed -e 's%@GAR_rootdir@%$(rootdir)%g' \
		| sed -e 's%@GAR_sysconfdir@%$(sysconfdir)%g' \
		> $(WORKDIR)/$(CONFIGFILE)
	@$(MAKECOOKIE)

pre-configure:
	@rm -rf   $(WORKSRC)/arch/$(GARCH_FAMILY)
	@mkdir -p $(WORKSRC)/arch/$(GARCH_FAMILY)
	@echo "CPPFLAGS += $(CPPFLAGS)" >> $(WORKSRC)/arch/$(GARCH_FAMILY)/Makefile
	@echo "CFLAGS   += $(CFLAGS)"   >> $(WORKSRC)/arch/$(GARCH_FAMILY)/Makefile
	@$(MAKECOOKIE)

configure-custom:
	@$(CONFIGURE_ENV) $(MAKE) $(CONFIGURE_ARGS) -C $(WORKSRC) mrproper
	@cp $(WORKDIR)/$(CONFIGFILE) $(WORKSRC)/.config
	@$(CONFIGURE_ENV) $(MAKE) $(CONFIGURE_ARGS) -C $(WORKSRC) oldconfig
	@$(CONFIGURE_ENV) $(MAKE) $(CONFIGURE_ARGS) -C $(WORKSRC) clean
	@$(MAKECOOKIE)

install-custom:
	@$(INSTALL_ENV) $(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) CONFIG_PREFIX="$(DESTDIR)$(rootdir)" install
