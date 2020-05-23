GARNAME = cc
GARVERSION =
CATEGORIES = toolchain-dirty
LICENSE =

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	toolchain-dirty/libc-crt
BUILDDEPS = \
	native/native

INSTALL_SCRIPTS = compiler linker

GAR_EXTRA_CONF += toolchain-dirty/toolchain-dirty/toolchain.mk
include ../../gar.mk

PATH := $(BUILD_SYSTEM_PATH)

install-compiler:
	@mkdir -pv $(DESTDIR)$(bindir)
	@ln -sfv `which false` $(DESTDIR)$(bindir)/cc
	@ln -sfv `which false` $(DESTDIR)$(bindir)/c++
	@ln -sfv `which false` $(DESTDIR)$(bindir)/cpp
	@$(foreach bin,cc c++ cpp, \
		which $(bin) > /dev/null 2>&1 ; \
		if [ ! "$$?" = "0" ] ; then \
			echo "error: your system does not contain the compiler program '$(bin)'." ; \
			exit 1 ; \
		fi ; \
		ln -sfv `which $(bin)` $(DESTDIR)$(bindir)/$(bin) ; \
	)
	@$(MAKECOOKIE)

install-linker:
	@mkdir -pv $(DESTDIR)$(bindir)
	@ln -sfv `which false` $(DESTDIR)$(bindir)/ld
	@ln -sfv `which false` $(DESTDIR)$(bindir)/objdump
	@ln -sfv `which false` $(DESTDIR)$(bindir)/objcopy
	@ln -sfv `which true` $(DESTDIR)$(bindir)/ranlib
	@ln -sfv `which true` $(DESTDIR)$(bindir)/strip
	@ln -sfv `which false` $(DESTDIR)$(bindir)/readelf
	@ln -sfv `which false` $(DESTDIR)$(bindir)/nm
	@ln -sfv `which false` $(DESTDIR)$(bindir)/as
	@ln -sfv `which false` $(DESTDIR)$(bindir)/ar
	@$(foreach bin,ld nm ar as, \
		which $(bin) > /dev/null 2>&1 ; \
		if [ ! "$$?" = "0" ] ; then \
			echo "error: your system does not contain the linker program '$(bin)'." ; \
			exit 1 ; \
		fi ; \
		ln -sfv `which $(bin)` $(DESTDIR)$(bindir)/$(bin) ; \
	)
	@$(MAKECOOKIE)
