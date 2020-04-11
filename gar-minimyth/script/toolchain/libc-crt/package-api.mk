native_libs = $(strip $(sort \
	libc \
))

native_libs_libc = \
	crt1.o \
	crti.o \
	crtn.o \
	gcrt1.o \
	Scrt1.o
x_native_libs_libc = \
	crt1.o \
	crti.o \
	crtn.o \
	gcrt1.o \
	Mcrt1.o \
	rcrt1.o \
	Scrt1.o \
	libc.so \
	libdl.so \
	libm.so \
	libpthread.so \
	libresolv.so \
	librt.so \
	libutil.so

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
