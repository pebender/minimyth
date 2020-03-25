XORG_VERSION      = 7.3
XORG_MASTER_SITES = \
	$(foreach                                                       \
		dir,                                                    \
		app data doc driver font lib proto util xserver,        \
	        https://xorg.freedesktop.org/releases/individual/$(dir)/ \
	) \
	https://xcb.freedesktop.org/dist/

CONFIGURE_ENV += \
	CC_FOR_BUILD="$(build_CC)" \
	CPPFLAGS_FOR_BUILD="$(build_CPPFLAGS)" \
	CFLAGS_FOR_BUILD="$(build_CFLAGS)" \
	LDFLAGS_FOR_BUILD="$(build_LDFLAGS)" \
	PKG_CONFIG="$(build_DESTDIR)$(build_bindir)/$(GARHOST)-pkg-config" \
	ac_cv_path_RAWCPP="$(build_DESTDIR)$(build_bindir)/cpp"
