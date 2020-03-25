GARNAME = libstdcxx-from-gcc
GARVERSION = $(GCC_VERSION)
CATEGORIES = clang-build
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION =
define BLURB
endef

BUILDDEPS = \
	native/native \
	cc-build/ccache \
	gcc-build/gcc-build

INSTALL_SCRIPTS = custom

GAR_EXTRA_CONF += clang-build/clang-build/toolchain.mk
GAR_EXTRA_CONF += gcc-build/gcc/package-api.mk
include ../../gar.mk

install-custom:
	@mkdir -pv $(DESTDIR)$(elibdir)
	$(foreach file,$(wildcard $(gcc_build_DESTDIR)$(gcc_build_elibdir)/libgcc.a   ),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	$(foreach file,$(wildcard $(gcc_build_DESTDIR)$(gcc_build_elibdir)/libgcc.so  ),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	$(foreach file,$(wildcard $(gcc_build_DESTDIR)$(gcc_build_elibdir)/libgcc.so.*),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	$(foreach file,$(wildcard $(gcc_build_DESTDIR)$(gcc_build_elibdir)/libgcc_s.so  ),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	$(foreach file,$(wildcard $(gcc_build_DESTDIR)$(gcc_build_elibdir)/libgcc_s.so.*),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	$(foreach file,$(wildcard $(gcc_build_DESTDIR)$(gcc_build_elibdir)/libgcc_eh.a   ),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	$(foreach file,$(wildcard $(gcc_build_DESTDIR)$(gcc_build_elibdir)/libgcc_eh.so  ),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	$(foreach file,$(wildcard $(gcc_build_DESTDIR)$(gcc_build_elibdir)/libgcc_eh.so.*),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	@mkdir -pv $(DESTDIR)$(libdir)
	@$(foreach file,$(wildcard $(gcc_build_DESTDIR)$(gcc_build_libdir)/libstdc++.so  ),cp -af $(file) $(DESTDIR)$(libdir) ; )
	@$(foreach file,$(wildcard $(gcc_build_DESTDIR)$(gcc_build_libdir)/libstdc++.so.*),cp -af $(file) $(DESTDIR)$(libdir) ; )
	@$(MAKECOOKIE)
