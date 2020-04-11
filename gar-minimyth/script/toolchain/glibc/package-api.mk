# 2.31 fails to compile.
GLIBC_VERSION = 2.30

GLIBC_ADD_LIB_PATH = \
	mkdir -p $(DESTDIR)$(sysconfdir) ; \
	$(if $(shell test -e $(DESTDIR)$(sysconfdir)/ld.so.conf && grep -e '$(strip $(1))' $(DESTDIR)$(sysconfdir)/ld.so.conf),, \
		echo '$(strip $(1))' >> $(DESTDIR)$(sysconfdir)/ld.so.conf ; \
		test ! -e $(build_DESTDIR)/$(build_esbindir)/ldconfig || $(build_DESTDIR)/$(build_esbindir)/ldconfig )

WORKBLD = $(WORKSRC)_build

ifneq ($(DESTIMG),build)
GLIBC_CONFIGURE_SCRIPTS = cache fix-configs custom
GLIBC_BUILD_SCRIPTS = $(WORKBLD)/Makefile
GLIBC_INSTALL_SCRIPTS = $(WORKBLD)/Makefile extract-charmaps remove-static-libs
endif

GLIBC_CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--enable-bind-now \
	--enable-kernel=5.6.0 \
	--disable-obsolete-rpc \
	--with-headers=$(DESTDIR)$(includedir) \
	--enable-add-ons=nptl \
	--with-tls \
	--with-__thread
ifneq ($(DESTIMG),build)
GLIBC_CONFIGURE_ARGS +=
endif
GLIBC_INSTALL_ARGS = \
	cross-compiling=yes
ifneq ($(DESTIMG),build)
GLIBC_INSTALL_ARGS += \
	install_root=$(DESTDIR)
endif

CONFIGURE_ENV += \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"
BUILD_ENV += \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"
INSTALL_ENV += \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"

# glibc 2.30 fails to compile with gcc 9.2.0's link time optimization enabled.
build_CFLAGS  += -fno-lto
build_LDFLAGS += -fno-lto
main_CFLAGS  += -fno-lto
main_LDFLAGS += -fno-lto

build_CFLAGS += -fno-fast-math -O3
main_CFLAGS += -fno-fast-math -O3

configure-custom:
	@mkdir -p $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

configure-cache:
	@mkdir -p $(WORKBLD)
	@rm -rf $(WORKBLD)/configparms
	@echo "slibdir=$(elibdir)"        >> $(WORKBLD)/configparms
	@rm -rf $(WORKBLD)/config.cache
	@echo "libc_cv_386_tls=yes"       >> $(WORKBLD)/config.cache
	@echo "libc_cv_forced_unwind=yes" >> $(WORKBLD)/config.cache
	@echo "libc_cv_c_cleanup=yes"     >> $(WORKBLD)/config.cache
	@echo "libc_cv_ctors_header=yes"  >> $(WORKBLD)/config.cache
	@$(MAKECOOKIE)

configure-fix-configs:
	@mkdir -p $(WORKBLD)
	@rm -rf $(WORKBLD)/configparms

install-extract-charmaps:
	@cd $(DESTDIR)$(datadir)/i18n/charmaps ; gzip -df *.gz
	@$(MAKECOOKIE)

install-remove-static-libs:
	@rm -fv $(DESTDIR)$(libdir)/libc.a
	@$(MAKECOOKIE)
