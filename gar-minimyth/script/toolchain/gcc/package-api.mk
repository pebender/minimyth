GCC_VERSION = 9.3.0

GMP_VERSION = 6.2.0
# ISL 0.22.1 fails to build when used as part of GCC 9.3.0
ISL_VERSION = 0.21
MPC_VERSION = 1.1.0
MPFR_VERSION = 4.0.2

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
	--enable-clocale=gnu \
	--enable-plugin \
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
	--with-local-prefix=$(patsubst %/include,%,$($(CROSSIMG)_includedir))
ifeq ($(CROSSIMG),build)
GCC_CONFIGURE_ARGS += \
	--with-sysroot=/ \
	--with-build-time-tools="$($(CROSSIMG)_DESTDIR)$(bindir)"
else
GCC_CONFIGURE_ARGS += \
	--with-sysroot=$($(CROSSIMG)_DESTDIR)
endif

pre-everything:
	echo "MY_PACKAGE_NAME $(MY_PACKAGE_NAME)"
	echo "MY_PACKAGE_CATEGORY $(MY_PACKAGE_CATEGORY)"

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
	@mkdir -pv $(DESTDIR)$(elibdir)
	@$(foreach file,$(wildcard $(build_DESTDIR)$(build_prefix)$(GARTARGET)/lib/libgcc.a   ),cp -afv $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(build_DESTDIR)$(build_prefix)$(GARTARGET)/lib/libgcc.so  ),cp -afv $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(build_DESTDIR)$(build_prefix)$(GARTARGET)/lib/libgcc.so.*),cp -afv $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(build_DESTDIR)$(build_prefix)$(GARTARGET)/lib/libgcc_s.so  ),cp -afv $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(build_DESTDIR)$(build_prefix)$(GARTARGET)/lib/libgcc_s.so.*),cp -afv $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(build_DESTDIR)$(build_prefix)$(GARTARGET)/lib/libgcc_eh.a   ),cp -afv $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(build_DESTDIR)$(build_prefix)$(GARTARGET)/lib/libgcc_eh.so  ),cp -afv $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(build_DESTDIR)$(build_prefix)$(GARTARGET)/lib/libgcc_eh.so.*),cp -afv $(file) $(DESTDIR)$(elibdir) ; )
	@$(foreach file,$(wildcard $(build_DESTDIR)$(build_prefix)$(GARTARGET)/lib/libstdc++.so  ),cp -afv $(file) $(DESTDIR)$(libdir) ; )

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
