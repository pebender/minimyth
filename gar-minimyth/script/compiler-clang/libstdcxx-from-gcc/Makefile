GARNAME = libstdcxx
GARVERSION = $(GCC_VERSION)
CATEGORIES = compiler-clang
LICENSE = GPL2/GPL3/LGPL2_1/LGPL3

DESCRIPTION =
define BLURB
endef

BUILDDEPS = \
	native/native \
	ccache/ccache \
	compiler-gcc/compiler-gcc

INSTALL_SCRIPTS = custom

GAR_EXTRA_CONF += compiler-clang/compiler-clang/toolchain.mk
GAR_EXTRA_CONF += compiler-gcc/gcc/package-api.mk
include ../../gar.mk

install-custom:
	@mkdir -pv $(DESTDIR)$(elibdir)
	$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc.a   ),echo $(file) ; )
	$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc.a   ),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc.so  ),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc.so.*),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_s.so  ),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_s.so.*),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_eh.a   ),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_eh.so  ),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libgcc_eh.so.*),cp -af $(file) $(DESTDIR)$(elibdir) ; )
	@mkdir -pv $(DESTDIR)$(libdir)
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libstdc++.so  ),cp -af $(file) $(DESTDIR)$(libdir) ; )
	@$(foreach file,$(wildcard $(CROSS_GCC_LIBDIR)/libstdc++.so.*),cp -af $(file) $(DESTDIR)$(libdir) ; )
	@$(MAKECOOKIE)
