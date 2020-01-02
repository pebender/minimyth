GARNAME = gpxe
GARVERSION = 1.0.1
CATEGORIES = net
MASTER_SITES = https://github.com/etherboot/gpxe/archive/
DISTFILES = v$(GARVERSION).tar.gz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

BUILD_SCRIPTS   = $(WORKSRC)/src/Makefile
INSTALL_SCRIPTS = custom

BUILD_ARGS = \
	HOST_CC="$(build_CC)" \
	CC="$(CC)" \
	CPP="$(CC) -E" \
	AS="$(AS)" \
	LD="$(compiler_prefix)ld.bfd" \
	SIZE="$(SIZE)" \
	AR="$(AR)" \
	RANLIB="$(RANLIB)" \
	OBJCOPY="$(OBJCOPY)" \
	NM="$(NM)" \
	OBJDUMP="$(OBJDUMP)" \
	PERL="$(build_DESTDIR)$(build_bindir)/perl" \
	CROSS_COMPILE="$(compiler_prefix)" \
	NO_WERROR="1" \
	ARCH="$(GARCH_FAMILY)" \
	BINUTILS_DIR="$(prefix)" \
	BFD_DIR="$(BINUTILS_DIR)" \
	ZLIB_DIR="$(prefix)" \
	V="1" \
	NO_WERROR="1" \
	bin/undionly.kpxe

include ../../gar.mk

CPPFLAGS :=
CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=

checksum-v$(GARVERSION).tar.gz:
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth
	@cp -f $(WORKSRC)/src/bin/undionly.kpxe $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/gpxe.0
	@mkdir -p $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/gpxe.cfg
	@$(MAKECOOKIE)
