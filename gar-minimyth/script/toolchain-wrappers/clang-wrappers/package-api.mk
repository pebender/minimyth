BUILD_SCRIPTS += wrappers
INSTALL_SCRIPTS += wrappers

build-wrappers:
	@mkdir -p $(WORKSRC)
	@$(foreach tool,cpp clang clangxx ld.lld, \
		rm -fv $(WORKSRC)/$(GARHOST)-$(tool) && \
		cat -v $(WORKDIR)/$(DESTIMG)-$(tool) \
		| sed "s%@TOOL_HASH@%$(shell cat $(build_DESTDIR)$(build_bindir)/clang-$(tool) | md5sum)%g" \
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
	@install -v --mode=0755 $(WORKSRC)/$(GARHOST)-clang $(build_DESTDIR)$(build_bindir)/$(GARHOST)-clang
	@install -v --mode=0755 $(WORKSRC)/$(GARHOST)-clangxx $(build_DESTDIR)$(build_bindir)/$(GARHOST)-clang++
	@install -v --mode=0755 $(WORKSRC)/$(GARHOST)-ld.lld $(build_DESTDIR)$(build_bindir)/$(GARHOST)-ld.lld
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/$(GARHOST)-clang
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/$(GARHOST)-clang++
	@ln -sfv llvm-objdump $(build_DESTDIR)$(build_bindir)/$(GARHOST)-objdump
	@ln -sfv llvm-objcopy $(build_DESTDIR)$(build_bindir)/$(GARHOST)-objcopy
	@ln -sfv llvm-strip $(build_DESTDIR)$(build_bindir)/$(GARHOST)-strip
	@ln -sfv llvm-ranlib $(build_DESTDIR)$(build_bindir)/$(GARHOST)-ranlib
	@ln -sfv llvm-readelf $(build_DESTDIR)$(build_bindir)/$(GARHOST)-readelf
	@ln -sfv llvm-nm $(build_DESTDIR)$(build_bindir)/$(GARHOST)-nm
	@ln -sfv llvm-as $(build_DESTDIR)$(build_bindir)/$(GARHOST)-as
	@ln -sfv llvm-ar $(build_DESTDIR)$(build_bindir)/$(GARHOST)-ar
	@$(MAKECOOKIE)
