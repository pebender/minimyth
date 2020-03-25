build-wrappers:
	@mkdir -p $(WORKSRC)
	@$(foreach tool,cpp gcc gxx ld.bfd, \
		rm -fv $(WORKSRC)/$(GARHOST)-$(tool) && \
		cat -v $(WORKDIR)/$(DESTIMG)-$(tool) \
		| sed "s%@CPP_HASH@%$(shell cat $(build_DESTDIR)$(build_bindir)/$(tool) | md5sum)%g" \
		| sed 's%@GAR_build_DESTDIR@%$(build_DESTDIR)%g' \
		| sed 's%@GAR_build_prefix@%$(build_prefix)%g' \
		| sed 's%@GAR_build_bindir@%$(build_bindir)%g' \
		| sed 's%@GAR_DESTDIR@%$(DESTDIR)%g' \
		| sed 's%@GAR_rootdir@%$(rootdir)%g' \
		| sed 's%@GAR_includedir@%$(includedir)%g' \
		| sed 's%@GAR_GARHOST@%$(GARHOST)%g' \
		> $(WORKSRC)/$(GARHOST)-$(tool) ; \
	)
	@$(MAKECOOKIE)

install-wrappers:
	@install -v --mode=0755 $(WORKSRC)/$(GARHOST)-cpp $(build_DESTDIR)$(build_bindir)/$(GARHOST)-cpp
	@install -v --mode=0755 $(WORKSRC)/$(GARHOST)-gcc $(build_DESTDIR)$(build_bindir)/$(GARHOST)-gcc
	@install -v --mode=0755 $(WORKSRC)/$(GARHOST)-gxx $(build_DESTDIR)$(build_bindir)/$(GARHOST)-g++
	@install -v --mode=0755 $(WORKSRC)/$(GARHOST)-ld.bfd $(build_DESTDIR)$(build_bindir)/$(GARHOST)-ld.bfd
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/$(GARHOST)-gcc
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/$(GARHOST)-g++
	@ln -sfv objdump $(build_DESTDIR)$(build_bindir)/$(GARHOST)-objdump
	@ln -sfv objcopy $(build_DESTDIR)$(build_bindir)/$(GARHOST)-objcopy
	@ln -sfv strip $(build_DESTDIR)$(build_bindir)/$(GARHOST)-strip
	@ln -sfv ranlib $(build_DESTDIR)$(build_bindir)/$(GARHOST)-ranlib
	@ln -sfv readelf $(build_DESTDIR)$(build_bindir)/$(GARHOST)-readelf
	@ln -sfv nm $(build_DESTDIR)$(build_bindir)/$(GARHOST)-nm
	@ln -sfv as $(build_DESTDIR)$(build_bindir)/$(GARHOST)-as
	@ln -sfv ar $(build_DESTDIR)$(build_bindir)/$(GARHOST)-ar
	@$(MAKECOOKIE)
