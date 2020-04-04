GARNAME = glibc
GARVERSION = $(GLIBC_VERSION)
CATEGORIES = lang
SOURCEPKG = gcc-target/glibc
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

ifneq ($(DESTIMG),build)
DEPENDS = \
	gcc-target/gcc-target \
	tainted-target/tainted-target
BUILDDEPS = \
	native/native
endif

WORKBLD = $(WORKSRC)_build

build_DESTDIR = $(gcc_build_DESTDIR)
build_rootdir = $(gcc_build_rootdir)

ifneq ($(DESTIMG),build)
CONFIGURE_SCRIPTS = fix-configs custom
BUILD_SCRIPTS = $(WORKBLD)/Makefile
INSTALL_SCRIPTS = $(WORKBLD)/Makefile extract-charmaps remove-static-libs
endif

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--enable-bind-now \
	--enable-kernel=5.5.0 \
	--disable-obsolete-rpc \
	--with-headers=$(DESTDIR)$(includedir) \
	--enable-add-ons=nptl \
	--with-tls \
	--with-__thread
INSTALL_ARGS = \
	install_root=$(DESTDIR)

CONFIGURE_ENV = \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"
	AR=$(AR)
BUILD_ENV = \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"
INSTALL_ENV = \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"

main_CC = $(build_DESTDIR)$(build_bindir)/ccache.d/$(main_GARHOST)-gcc
main_CXX = $(build_DESTDIR)$(build_bindir)/ccache.d/$(main_GARHOST)-g++
main_CPP = $(build_DESTDIR)$(build_bindir)/wrapper.d/$(main_GARHOST)-cpp
main_LD = $(build_DESTDIR)$(build_bindir)/wrapper.d/$(main_GARHOST)-ld.bfd
main_OBJDUMP = $(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-objdump
main_OBJCOPY = $(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-objcopy
main_STRIP = $(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-strip
main_RANLIB = $(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-ranlib
main_READELF = $(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-readelf
main_NM = $(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-nm
main_AS = $(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-as
main_AR = $(build_DESTDIR)$(build_bindir)/$(main_GARHOST)-ar

build_CC = $(build_DESTDIR)$(build_bindir)/ccache.d/$(build_GARHOST)-gcc
build_CXX = $(build_DESTDIR)$(build_bindir)/ccache.d/$(build_GARHOST)-g++
build_CPP = $(build_DESTDIR)$(build_bindir)/wrapper.d/$(build_GARHOST)-cpp
build_LD = $(build_DESTDIR)$(build_bindir)/wrapper.d/$(build_GARHOST)-ld.bfd
build_OBJDUMP = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-objdump
build_OBJCOPY = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-objcopy
build_STRIP = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-strip
build_RANLIB = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-ranlib
build_READELF = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-readelf
build_NM = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-nm
build_AS = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-as
build_AR = $(build_DESTDIR)$(build_bindir)/$(build_GARHOST)-ar

xmain_FLAGS = \
	--sysroot=$(main_DESTDIR)
xmain_CPPFLAGS += $(main_FLAGS)
xmain_CFLAGS += $(main_FLAGS)
xmain_CXXFLAGS += $(main_FLAGS)
xmain_LDFLAGS += $(main_FLAGS)

xbuild_FLAGS = \
	--sysroot=$(build_DESTDIR)
xbuild_CPPFLAGS += $(build_FLAGS)
xbuild_CFLAGS += $(build_FLAGS)
xbuild_CXXFLAGS += $(build_FLAGS)
xbuild_LDFLAGS += $(build_FLAGS)

GAR_EXTRA_CONF += gcc-target/glibc/package-api.mk
include ../../gar.mk

# glibc 2.30 fails to compile with gcc 9.2.0's link time optimization enabled.
CFLAGS  := $(filter-out -flto, $(CFLAGS)) -fno-lto
LDFLAGS := $(filter-out -flto, $(LDFLAGS)) -fno-lto

CFLAGS := $(filter-out -ffast-math, $(CFLAGS))
CFLAGS := $(filter-out -O%, $(CFLAGS)) -O3

configure-fix-configs:
	@mkdir -p $(WORKBLD)
	@rm -rf $(WORKBLD)/configparms
	@echo "slibdir=$(elibdir)" >> $(WORKBLD)/configparms
	@rm -rf $(WORKBLD)/config.cache
	@echo "libc_cv_forced_unwind=yes" >> $(WORKBLD)/config.cache
	@echo "libc_cv_c_cleanup=yes"     >> $(WORKBLD)/config.cache
	@echo "libc_cv_ctors_header=yes"  >> $(WORKBLD)/config.cache
	@$(MAKECOOKIE)

configure-custom:
	@mkdir -p $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

install-extract-charmaps:
	@cd $(DESTDIR)$(datadir)/i18n/charmaps ; gzip -df *.gz
	@$(MAKECOOKIE)

install-remove-static-libs:
	@rm -fv $(DESTDIR)$(libdir)/libc.a
	@$(MAKECOOKIE)
