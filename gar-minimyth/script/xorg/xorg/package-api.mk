XORG_VERSION      = 7.3
XORG_MASTER_SITES = \
	$(foreach                                                       \
		dir,                                                    \
		app data doc driver font lib proto util xserver,        \
	        https://xorg.freedesktop.org/releases/individual/$(dir)/ \
	) \
	https://xcb.freedesktop.org/dist/
