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
	$(foreach tool,clang clang++ clang-cpp ld.lld, \
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
	@mkdir -pv $(build_DESTDIR)$(build_bindir)/wrapper
	@mkdir -pv $(ccache_DESTDIR)$(cccache_bindir)
	@install -v --mode=0755 $(WORKSRC)/$(GARHOST)-clang $(build_DESTDIR)$(build_bindir)/wrapper/$(GARHOST)-clang
	@install -v --mode=0755 $(WORKSRC)/$(GARHOST)-clang++ $(build_DESTDIR)$(build_bindir)/wrapper/$(GARHOST)-clang++
	@install -v --mode=0755 $(WORKSRC)/$(GARHOST)-clang-cpp $(build_DESTDIR)$(build_bindir)/wrapper/$(GARHOST)-clang-cpp
	@install -v --mode=0755 $(WORKSRC)/$(GARHOST)-ld.lld $(build_DESTDIR)$(build_bindir)/wrapper/$(GARHOST)-ld.lld
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/$(GARHOST)-clang
	@ln -sfv ccache $(ccache_DESTDIR)$(ccache_bindir)/$(GARHOST)-clang++
	@ln -sfv ../llvm-objdump $(build_DESTDIR)$(build_bindir)/wrapper/$(GARHOST)-llvm-objdump
	@ln -sfv ../llvm-objcopy $(build_DESTDIR)$(build_bindir)/wrapper/$(GARHOST)-llvm-objcopy
	@ln -sfv ../llvm-strip $(build_DESTDIR)$(build_bindir)/wrapper/$(GARHOST)-llvm-strip
	@ln -sfv ../llvm-ranlib $(build_DESTDIR)$(build_bindir)/wrapper/$(GARHOST)-llvm-ranlib
	@ln -sfv ../llvm-readelf $(build_DESTDIR)$(build_bindir)/wrapper/$(GARHOST)-llvm-readelf
	@ln -sfv ../llvm-nm $(build_DESTDIR)$(build_bindir)/wrapper/$(GARHOST)-llvm-nm
	@ln -sfv ../llvm-as $(build_DESTDIR)$(build_bindir)/wrapper/$(GARHOST)-llvm-as
	@ln -sfv ../llvm-ar $(build_DESTDIR)$(build_bindir)/wrapper/$(GARHOST)-llvm-ar
	@$(MAKECOOKIE)
