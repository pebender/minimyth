RPATH_FLAG = -rpath,
RPATH_LINK_FLAG = -rpath-link,
COMPILER_RPATH_FLAG = -Wl,-rpath,
COMPILER_RPATH_LINK_FLAG = -Wl,-rpath-link,
ifeq ($(DESTIMG),build)
GAR_LIBRARY = $(subst :, -L,:$(BUILD_LINKTIME_PATH):$(NATIVE_LINKTIME_PATH))
GAR_RPATH_LINK = $(subst :, $(RPATH_LINK_FLAG),:$(BUILD_LINKTIME_PATH):$(NATIVE_LINKTIME_PATH))
GAR_RPATH = $(subst :, $(RPATH_FLAG),:$(BUILD_LINKTIME_PATH):$(NATIVE_LINKTIME_PATH))
GAR_COMPILER_RPATH_LINK = $(subst :, $(COMPILER_RPATH_LINK_FLAG),:$(BUILD_LINKTIME_PATH):$(NATIVE_LINKTIME_PATH))
GAR_COMPILER_RPATH = $(subst :, $(COMPILER_RPATH_FLAG),:$(BUILD_LINKTIME_PATH):$(NATIVE_LINKTIME_PATH))
else
GAR_LIBRARY = $(subst :, -L,:$(TARGET_LINKTIME_PATH))
GAR_RPATH_LINK =
GAR_RPATH =
GAR_COMPILER_RPATH_LINK =
GAR_COMPILER_RPATH =
endif

build-wrappers:
	@mkdir -p $(WORKSRC)
	$(foreach tool,cpp gcc g++ ld.bfd, \
		rm -fv $(WORKSRC)/$(GARHOST)-$(tool) ; \
		cat -v $(WORKDIR)/$(DESTIMG)-$(tool) \
		| sed 's%@TOOL_HASH@%$(shell cat $(build_DESTDIR)$(build_bindir)/$(GARHOST)-$(tool) | md5sum)%g' \
		| sed 's%@GAR_build_DESTDIR@%$(build_DESTDIR)%g' \
		| sed 's%@GAR_build_prefix@%$(build_prefix)%g' \
		| sed 's%@GAR_build_bindir@%$(build_bindir)%g' \
		| sed 's%@GAR_LIBRARY@%$(GAR_LIBRARY)%g' \
		| sed 's%@GAR_RPATH_LINK@%$(GAR_RPATH_LINK)%g' \
		| sed 's%@GAR_RPATH@%$(GAR_RPATH)%g' \
		| sed 's%@GAR_COMPILER_RPATH@%$(GAR_COMPILER_RPATH)%g' \
		| sed 's%@GAR_COMPILER_RPATH_LINK@%$(GAR_COMPILER_RPATH_LINK)%g' \
		| sed 's%@GAR_DESTDIR@%$(DESTDIR)%g' \
		| sed 's%@GAR_rootdir@%$(rootdir)%g' \
		| sed 's%@GAR_includedir@%$(includedir)%g' \
		| sed 's%@GAR_GARHOST@%$(GARHOST)%g' \
		> $(WORKSRC)/$(GARHOST)-$(tool) ; \
	)
	@$(MAKECOOKIE)

install-wrappers:
	@mkdir -pv $(build_DESTDIR)$(build_bindir)/wrapper.d
	@mkdir -pv $(build_DESTDIR)$(build_bindir)/ccache.d
	@install -v --mode=0755 $(WORKSRC)/$(GARHOST)-cpp $(build_DESTDIR)$(build_bindir)/wrapper.d/$(GARHOST)-cpp
	@install -v --mode=0755 $(WORKSRC)/$(GARHOST)-gcc $(build_DESTDIR)$(build_bindir)/wrapper.d/$(GARHOST)-gcc
	@install -v --mode=0755 $(WORKSRC)/$(GARHOST)-g++ $(build_DESTDIR)$(build_bindir)/wrapper.d/$(GARHOST)-g++
	@install -v --mode=0755 $(WORKSRC)/$(GARHOST)-ld.bfd $(build_DESTDIR)$(build_bindir)/wrapper.d/$(GARHOST)-ld.bfd
	@install -v --mode=0755 $(WORKSRC)/$(GARHOST)-ld.bfd $(build_DESTDIR)$(build_bindir)/wrapper.d/$(GARHOST)-ld
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/$(GARHOST)-gcc
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/$(GARHOST)-g++
	@$(MAKECOOKIE)
