GCC_VERSION = 10.1.0

CROSSIMG ?= $(DESTIMG)
GARTARGET = $($(CROSSIMG)_GARHOST)

ifneq ($(DESTIMG),build)
export CROSSIMG
PWD := $(shell pwd)
MY_PACKAGE_NAME := $(lastword $(subst /, ,$(PWD)))
MY_PACKAGE_CATEGORY := $(lastword $(subst /, ,$(patsubst %/$(MY_PACKAGE_NAME),%,$(PWD))))
BUILDDEPS = $(MY_PACKAGE_CATEGORY)/$(MY_PACKAGE_NAME)
endif

WORKDIR = $(WORKROOTDIR)/$(DESTIMG)_$(CROSSIMG).d
COOKIEDIR = $(COOKIEROOTDIR)/$(DESTIMG)_$(CROSSIMG).d

WORKBLD = $(WORKSRC)_build

ifeq ($(DESTIMG),build)
CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS = $(WORKBLD)/Makefile
INSTALL_SCRIPTS = $(WORKBLD)/Makefile lib-wrappers-$(CROSSIMG) lib-locations-$(CROSSIMG) links-$(CROSSIMG) cc-links-$(CROSSIMG) ccache-links-$(CROSSIMG)
endif

GCC_CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARBUILD) --target=$(GARTARGET) \
	--enable-__cxa_atexit \
	--disable-plugin \
	--disable-gold \
	--enable-ld=default \
	--enable-languages=c,c++ \
	--disable-decimal-float \
	--disable-libgomp \
	--disable-libquadmath \
	--disable-libquadmath-support \
	--disable-libada \
	--disable-libssp \
	--disable-libvtv \
	--disable-multiarch \
	--disable-multilib \
	--disable-nls \
	--disable-werror \
	--with-local-prefix=$(patsubst %/include,%,$($(CROSSIMG)_includedir)) \
	--with-sysroot=$($(CROSSIMG)_DESTDIR) \
	--with-gmp=$(DESTDIR)$(prefix) \
	--with-isl=$(DESTDIR)$(prefix) \
	--with-mpc=$(DESTDIR)$(prefix) \
	--with-mpfr=$(DESTDIR)$(prefix)

configure-custom:
	@mkdir -pv $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

install-lib-wrappers-build:
	@rm -fv $(DESTDIR)$(libdir)/libcc1.la
	@rm -fv $(DESTDIR)$(libdir)/libasan.la
	@rm -fv $(DESTDIR)$(libdir)/libatomic.la
	@rm -fv $(DESTDIR)$(libdir)/libitm.la
	@rm -fv $(DESTDIR)$(libdir)/liblsan.la
	@rm -fv $(DESTDIR)$(libdir)/libstdc++.la
	@rm -fv $(DESTDIR)$(libdir)/libstdc++fs.la
	@rm -fv $(DESTDIR)$(libdir)/libsupc++.la
	@rm -fv $(DESTDIR)$(libdir)/libtsan.la
	@rm -fv $(DESTDIR)$(libdir)/libubsan.la
	@rm -fv $(DESTDIR)$(libdir)/gcc/$(GARTARGET)/$(GCC_VERSION)/plugin/libcc1plugin.la
	@rm -fv $(DESTDIR)$(libdir)/gcc/$(GARTARGET)/$(GCC_VERSION)/plugin/libcp1plugin.la
	@rm -fv $(DESTDIR)$(elibdir)/gcc/$(GARTARGET)/$(GCC_VERSION)/liblto_plugin.la
	@$(MAKECOOKIE)

install-lib-wrappers-main:
	@rm -fv $(build_DESTDIR)$(build_libdir)/libcc1.la
	@rm -fv $(build_DESTDIR)$(build_prefix)/$(GARTARGET)/lib/libasan.la
	@rm -fv $(build_DESTDIR)$(build_prefix)/$(GARTARGET)/lib/libatomic.la
	@rm -fv $(build_DESTDIR)$(build_prefix)/$(GARTARGET)/lib/libitm.la
	@rm -fv $(build_DESTDIR)$(build_prefix)/$(GARTARGET)/lib/libstdc++.la
	@rm -fv $(build_DESTDIR)$(build_prefix)/$(GARTARGET)/lib/libstdc++fs.la
	@rm -fv $(build_DESTDIR)$(build_prefix)/$(GARTARGET)/lib/libsupc++.la
	@rm -fv $(build_DESTDIR)$(build_prefix)/$(GARTARGET)/lib/libubsan.la
	@rm -fv $(build_DESTDIR)$(build_libdir)/gcc/$(GARTARGET)/$(GCC_VERSION)/plugin/libcc1plugin.la
	@rm -fv $(build_DESTDIR)$(build_libdir)/gcc/$(GARTARGET)/$(GCC_VERSION)/plugin/libcp1plugin.la
	@rm -fv $(build_DESTDIR)$(build_execlibdir)/gcc/$(GARTARGET)/$(GCC_VERSION)/liblto_plugin.la
	@$(MAKECOOKIE)

install-lib-locations-build:
	@$(MAKECOOKIE)

install-lib-locations-main:
	@mkdir -pv $(main_DESTDIR)$(main_libdir)
	@cp -afv $(build_DESTDIR)$(build_prefix)/$(GARTARGET)/lib/libatomic.so.* $(main_DESTDIR)$(main_libdir)
	@cp -afv $(build_DESTDIR)$(build_prefix)/$(GARTARGET)/lib/libgcc_s.so.* $(main_DESTDIR)$(main_libdir)
	@cp -afv $(build_DESTDIR)$(build_prefix)/$(GARTARGET)/lib/libitm.so.* $(main_DESTDIR)$(main_libdir)
	@cp -afv $(build_DESTDIR)$(build_prefix)/$(GARTARGET)/lib/libstdc++.so.* $(main_DESTDIR)$(main_libdir)
	@$(MAKECOOKIE)

install-links-build:
	@ln -sfv cpp $(build_DESTDIR)$(build_bindir)/ccache.d/c++
	@$(MAKECOOKIE)

install-links-main:
	@$(MAKECOOKIE)

install-cc-links-build:
	@ln -sfv gcc $(build_DESTDIR)$(build_bindir)/cc
	@ln -sfv g++ $(build_DESTDIR)$(build_bindir)/c++
	@$(MAKECOOKIE)

install-cc-links-main:
	@$(MAKECOOKIE)

install-ccache-links-build:
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/gcc
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/g++
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/$(GARTARGET)-gcc
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/$(GARTARGET)-g++
	@$(MAKECOOKIE)

install-ccache-links-main:
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/$(GARTARGET)-gcc
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/$(GARTARGET)-g++
	@$(MAKECOOKIE)
