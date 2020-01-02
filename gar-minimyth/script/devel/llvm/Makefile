GARNAME = llvm
GARVERSION = 9.0.1
CATEGORIES = devel
MASTER_SITES  = https://www.llvm.org/releases/$(GARVERSION)/
MASTER_SITES += https://github.com/llvm/llvm-project/releases/download/llvmorg-$(GARVERSION)/
DISTFILES = $(DISTNAME).src.tar.xz
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.TXT

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lang/cxx
BUILDDEPS = python/python

PWD := $(shell pwd)

WORKSRC = $(WORKDIR)/$(DISTNAME).src
WORKBLD = $(WORKSRC)_build

#CONFIGURE_SCRIPTS  = $(WORKBLD)/cmake
#BUILD_SCRIPTS      = $(WORKBLD)/Makefile
#INSTALL_SCRIPTS    = $(WORKBLD)/Makefile

CONFIGURE_ARGS  = \
	-DCMAKE_FIND_ROOT_PATH="$(DESTDIR)$(prefix)" \
	-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="NEVER" \
	-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="ONLY" \
	-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="ONLY" \
	-DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE="ONLY" \
	-DCMAKE_SYSTEM_PROCESSOR="$(GARCH_FAMILY)" \
	-DCMAKE_C_COMPILER="$(build_DESTDIR)$(build_bindir)/$(CC)" \
	-DCMAKE_CXX_COMPILER="$(build_DESTDIR)$(build_bindir)/$(CXX)" \
	-DCMAKE_AR="$(build_DESTDIR)$(build_bindir)/$(AR)" \
	-DCMAKE_LINKER="$(build_DESTDIR)$(build_bindir)/$(LD)" \
	-DCMAKE_NM="$(build_DESTDIR)$(build_bindir)/$(NM)" \
	-DCMAKE_OBJCOPY="$(build_DESTDIR)$(build_bindir)/$(OBJCOPY)" \
	-DCMAKE_OBJDUMP="$(build_DESTDIR)$(build_bindir)/$(OBJDUMP)" \
	-DCMAKE_RANLIB="$(build_DESTDIR)$(build_bindir)/$(RANLIB)" \
	-DCMAKE_STRIP="$(build_DESTDIR)$(build_bindir)/$(STRIP)" \
	-DCMAKE_INSTALL_PREFIX="$(DESTDIR)$(prefix)" \
	-DCMAKE_STAGING_PREFIX="$(DESTDIR)$(prefix)" \
	-DCMAKE_VERBOSE_MAKEFILE:BOOLEAN=ON \
	-DPYTHON_EXECUTABLE="$(build_DESTDIR)$(build_bindir)/python3" \
	-DLLVM_TARGETS_TO_BUILD="X86;AMDGPU"
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	-DCMAKE_CROSSCOMPILING:BOOLEAN=ON \
	-DCMAKE_SYSTEM_NAME="Linux"
endif
xBUILD_ARGS     = \
	VERBOSE="1"

include ../../gar.mk

ifeq ($(DESTDIR),/)
DESTDIR :=
endif
ifeq ($(build_DESTDIR),/)
build_DESTDIR :=
endif

# llvm 9.0.0 fails to compile with gcc 9.2.0 with link time optimization enabled.
CFLAGS   := $(filter-out -flto, $(CFLAGS)  ) -fno-lto
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS)) -fno-lto
LDFLAGS  := $(filter-out -flto, $(LDFLAGS) ) -fno-lto


configure-%/cmake: 
	@echo " ==> Running configure in $*"
	@rm -rf $*
	@mkdir -p $*
	cd $* && $(CONFIGURE_ENV) cmake $(CONFIGURE_ARGS) ../$(patsubst %_build,%,$(notdir $*))
	@$(MAKECOOKIE)

x-post-install:
	@rm -f $(DESTDIR)$(bindir)-config/llvm-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)llvm-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@$(if $(filter build, $(DESTIMG)), \
		cp $(WORKBLD)/bin/llvm-config            $(DESTDIR)$(bindir)-config/llvm-config, \
		cp $(WORKBLD)/BuildTools/Release/bin/llvm-config $(DESTDIR)$(bindir)-config/llvm-config  )
	@$(if $(compiler_prefix), ln -s llvm-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)llvm-config)
	@$(MAKECOOKIE)
