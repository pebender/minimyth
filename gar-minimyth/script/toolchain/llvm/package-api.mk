LLVM_VERSION = 10.0.0

WORKSRC = $(WORKDIR)/llvm-project-$(LLVM_VERSION)/$(GARNAME)

LLVM_CONFIGURE_ARGS  = \
	-DCMAKE_BUILD_TYPE=RELEASE \
	-DCMAKE_VERBOSE_MAKEFILE=ON \
	-DCMAKE_SYSROOT="$(DESTDIR)" \
	-DCMAKE_INSTALL_PREFIX="$(prefix)" \
	-DCMAKE_STAGING_PREFIX="$(DESTDIR)$(prefix)" \
	-DCMAKE_INSTALL_LIBDIR="lib" \
	-DCMAKE_C_COMPILER="$(CC)" \
	-DCMAKE_CXX_COMPILER="$(CXX)" \
	-DCMAKE_ASM_COMPILER="$(CC)" \
	-DCMAKE_C_COMPILER_TARGET="$(GARHOST)" \
	-DCMAKE_CXX_COMPILER_TARGET="$(GARHOST)" \
	-DCMAKE_ASM_COMPILER_TARGET="$(GARHOST)" \
	-DCMAKE_LINKER="$(LD)" \
	-DCMAKE_C_FLAGS="$(CFLAGS)" \
	-DCMAKE_CXX_FLAGS="$(CXXFLAGS)" \
	-DCMAKE_EXE_LINKER_FLAGS="$(LDFLAGS)" \
	-DCMAKE_SHARED_LINKER_FLAGS="$(LDFLAGS)" \
	-DCMAKE_AR="$(AR)" \
	-DCMAKE_AS="$(AS)" \
	-DCMAKE_NM="$(NM)" \
	-DCMAKE_OBJCOPY="$(OBJCOPY)" \
	-DCMAKE_OBJDUMP="$(OBJDUMP)" \
	-DCMAKE_RANLIB="$(RANLIB)" \
	-DCMAKE_STRIP="$(STRIP)" \
	-DPYTHON_EXECUTABLE="$(build_DESTDIR)$(build_bindir)/python"
ifneq ($(DESTIMG),build)
LLVM_CONFIGURE_ARGS += \
	-DCMAKE_CROSSCOMPILING=ON \
	-DCMAKE_SYSTEM_NAME="Linux"
endif

install-config-build:
	@rm -fv $(DESTDIR)$(bindir)/config/llvm-config
	@rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-llvm-config
	@mkdir -pv $(DESTDIR)$(bindir)/config
	@cp -afv $(WORKSRC)_build/bin/llvm-config $(DESTDIR)$(bindir)/config/llvm-config
	@$(MAKECOOKIE)

install-config-main:
	@rm -fv $(DESTDIR)$(bindir)/config/llvm-config
	@rm -fv $(DESTDIR)$(bindir)/config/$(GARHOST)-llvm-config
	@mkdir -pv $(DESTDIR)$(bindir)/config
	@$(MAKECOOKIE)

install-links-build:
	@ln -sfv llvm-config $(DESTDIR)$(bindir)/config/$(GARHOST)-llvm-config
	@$(if $(wildcard $(DESTDIR)$(bindir)/clang), \
		rm -fv $(DESTDIR)$(bindir)/cc ; \
		ln -sfv clang $(DESTDIR)$(bindir)/cc ; \
	)
	@$(if $(wildcard $(DESTDIR)$(bindir)/clang++), \
		rm -fv $(DESTDIR)$(bindir)/c++ ; \
		ln -sfv clang++ $(DESTDIR)$(bindir)/c++ ; \
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

install-links-main:
	@ln -sfv llvm-config $(DESTDIR)$(bindir)/config/$(GARHOST)-llvm-config
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
