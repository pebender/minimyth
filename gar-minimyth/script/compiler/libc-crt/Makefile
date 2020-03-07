GARNAME = libc-crt
GARVERSION =
CATEGORIES = compiler
LICENSE =

DESCRIPTION =
define BLURB
endef

INSTALL_SCRIPTS = libs

GAR_EXTRA_CONF += compiler/compiler/toolchain.mk
GAR_EXTRA_CONF += compiler-clang/libc-crt/package-api.mk
include ../../gar.mk

install-libs:
	@mkdir -pv $(DESTDIR)$(libdir)
	@$(foreach pkg,$(native_libs), \
		$(foreach lib,$(sort $(native_libs_$(subst -,_,$(pkg)))), \
			$(foreach path,$(subst :, ,$(NATIVE_LINKTIME_PATH)), \
				$(if $(filter %.so,$(lib)), \
					$(foreach file, $(wildcard $(path)/$(lib) $(path)/$(lib).*), \
						ln -sfv $(file) $(DESTDIR)$(libdir)/$(notdir $(file)) ;  \
					) , \
					$(foreach file, $(wildcard $(path)/$(lib)), \
						cp -fv $(path)/$(lib) $(DESTDIR)$(libdir)/$(notdir $(file)) ; \
					) \
				) \
			) \
			if [ ! -e $(DESTDIR)$(libdir)/$(lib) ] ; then \
				echo "error: your system does not contain the libc '$(lib)'." ; \
				exit 1 ; \
			fi ; \
		) \
	)
	@$(MAKECOOKIE)
