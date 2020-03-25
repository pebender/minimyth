GARNAME = linux-headers
GARVERSION = $(LINUX_HEADERS_MAJOR_VERSION).$(LINUX_HEADERS_MINOR_VERSION)$(if $(LINUX_HEADERS_TEENY_VERSION),$(if $(filter-out 0,$(LINUX_HEADERS_TEENY_VERSION)),.$(LINUX_HEADERS_TEENY_VERSION)))$(LINUX_HEADERS_EXTRA_VERSION)
CATEGORIES = gcc-target
SOURCEPKG = kernel-$(LINUX_HEADERS_MAJOR_VERSION).$(LINUX_HEADERS_MINOR_VERSION)/linux
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

BUILDDEPS = \
	native/native \
	gcc-build/ccache \
	gcc-build/gcc-build

WORKSRC = $(WORKDIR)/linux-$(GARVERSION)

INSTALL_SCRIPTS = custom

INSTALL_ARGS = $(LINUX_MAKE_ARGS)

INSTALL_ENV = $(LINUX_MAKE_ENV)

GAR_EXTRA_CONF += gcc-target/gcc-target/toolchain.mk
GAR_EXTRA_CONF += kernel-$(mm_KERNEL_VERSION)/linux/package-api.mk
include ../../gar.mk

build_CPPFLAGS := --sysroot=$(DESTDIR) -idirafter /usr/include
build_CFLAGS := --sysroot=$(DESTDIR) $(build_CPPFLAGS)
build_CXXFLAGS := --sysroot=$(DESTDIR) $(build_CPPFLAGS)
build_LDFLAGS := --sysroot=$(DESTDIR)

install-custom:
	@$(INSTALL_ENV) $(MAKE) $(INSTALL_ARGS) -C $(WORKSRC) headers
	@find $(WORKSRC)/usr/include -name '.*' -delete
	@rm -fv $(WORKSRC)/usr/include/Makefile
	@mkdir -pv $(DESTDIR)$(includedir)
	@cp -rfv $(WORKSRC)/usr/include/* $(DESTDIR)$(includedir)
	@$(MAKECOOKIE)
