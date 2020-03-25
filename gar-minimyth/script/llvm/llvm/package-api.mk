LLVM_VERSION = 9.0.1

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
	@$(if $(wildcard $(DESTDIR)$(bindir)/clang), \
		rm -fv $(DESTDIR)$(bindir)/cc ; \
		ln -sfv clang $(DESTDIR)$(bindir)/cc \
	)
	@$(if $(wildcard $(DESTDIR)$(bindir)/clang++), \
		rm -fv $(DESTDIR)$(bindir)/c++ ; \
		ln -sfv clang++ $(DESTDIR)$(bindir)/c++ \
	)
	@$(if $(wildcard $(DESTDIR)$(bindir)/lld), \
		rm -fv $(DESTDIR)$(bindir)/ld ; \
		ln -sfv lld $(DESTDIR)$(bindir)/ld \
	)
	@$(MAKECOOKIE)
