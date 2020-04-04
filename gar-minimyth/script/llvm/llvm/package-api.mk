LLVM_VERSION = 10.0.0

install-config:
	@rm -fv $(DESTDIR)$(bindir)/config/llvm-config
	@rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-llvm-config
	@mkdir -pv $(DESTDIR)$(bindir)/config
	@$(if $(filter build,$(DESTIMG)), \
		cp -afv $(WORKSRC)_build/bin/llvm-config                    $(DESTDIR)$(bindir)/config/llvm-config, \
		cp -afv $(WORKSRC)_build/BuildTools/Release/bin/llvm-config $(DESTDIR)$(bindir)/config/llvm-config \
	)
	@$(MAKECOOKIE)

install-links:
	@ln -sfv llvm-config $(DESTDIR)$(bindir)/config/$(GARHOST)-llvm-config
	@$(if $(filter build,$(DESTIMG)), \
		$(if $(wildcard $(DESTDIR)$(bindir)/clang), \
			rm -fv $(DESTDIR)$(bindir)/cc ; \
			ln -sfv clang $(DESTDIR)$(bindir)/cc ; \
		) \
		$(if $(wildcard $(DESTDIR)$(bindir)/clang++), \
			rm -fv $(DESTDIR)$(bindir)/c++ ; \
			ln -sfv clang++ $(DESTDIR)$(bindir)/c++ ; \
		), \
	)
	@ln -sfv clang $(DESTDIR)$(bindir)/$(GARHOST)-clang
	@ln -sfv clang++ $(DESTDIR)$(bindir)/$(GARHOST)-clang++
	@ln -sfv clang-cpp $(DESTDIR)$(bindir)/$(GARHOST)-clang++
	@ln -sfv ld.lld $(DESTDIR)$(bindir)/$(GARHOST)-ld.lld
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/$(GARHOST)-clang
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/$(GARHOST)-clang++
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/clang
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/clang++
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/cc
	@ln -sfv ../ccache $(build_DESTDIR)$(build_bindir)/ccache.d/c++
	@$(MAKECOOKIE)
