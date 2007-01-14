PWD := `pwd`

WORKSRC = $(WORKDIR)/minimyth-$(mm_VERSION)

GAR_EXTRA_CONF += kernel/linux/package-api.mk devel/build-system-bins/package-api.mk
include ../../gar.mk

mm_NAME       := minimyth-$(mm_VERSION)
mm_SOURCENAME := gar-minimyth-$(mm_VERSION)
mm_KERNELNAME := kernel
mm_ROOTFSNAME := rootfs
mm_EXTRASNAME := extras
mm_EXTRASNAME := themes

# Directory where files are initaially assembled.
mm_STAGEDIR := $(WORKSRC)/stage
# Directory containing files that are for local (private) use (directories with extras).
mm_LOCALDIR := $(WORKSRC)/local
# Directory containing files that are for shared (public) use (tarballs without extras).
mm_SHAREDIR := $(WORKSRC)/share

mm_ROOTFSDIR := $(mm_STAGEDIR)/rootfs
mm_EXTRASDIR := $(mm_STAGEDIR)/extras
mm_THEMESDIR := $(mm_STAGEDIR)/themes

MM_BIN_FILES    := $(strip \
	$(if $(wildcard               minimyth-bin-list   ),               minimyth-bin-list   ) \
	$(if $(wildcard    ../../extras/extras-bin-list   ),    ../../extras/extras-bin-list   ) \
	$(filter $(patsubst %,minimyth-bin-list.%,$(mm_CHIPSETS)),$(wildcard minimyth-bin-list.*)))
MM_LIB_FILES    := $(strip \
	$(if $(wildcard               minimyth-lib-list   ),               minimyth-lib-list   ) \
	$(if $(wildcard    ../../extras/extras-lib-list   ),    ../../extras/extras-lib-list   ) \
	$(filter $(patsubst %,minimyth-lib-list.%,$(mm_CHIPSETS)),$(wildcard minimyth-lib-list.*)))
MM_ETC_FILES    := $(strip \
	$(if $(wildcard               minimyth-etc-list   ),               minimyth-etc-list   ) \
	$(if $(wildcard    ../../extras/extras-etc-list   ),    ../../extras/extras-etc-list   ) \
	$(filter $(patsubst %,minimyth-etc-list.%,$(mm_CHIPSETS)),$(wildcard minimyth-etc-list.*)))
MM_SHARE_FILES  := $(strip \
	$(if $(wildcard               minimyth-share-list ),               minimyth-share-list ) \
	$(if $(wildcard    ../../extras/extras-share-list ),    ../../extras/extras-share-list ) \
	$(filter $(patsubst %,minimyth-share-list.%,$(mm_CHIPSETS)),$(wildcard minimyth-share-list.*)))
MM_REMOVE_FILES := $(strip \
	$(if $(wildcard               minimyth-remove-list),               minimyth-remove-list) \
	$(filter-out $(patsubst %,minimyth-remove-list.%,$(mm_CHIPSETS)),$(wildcard minimyth-remove-list.*)))

MM_BIN_DEBUG    := $(strip $(if $(filter yes,$(mm_DEBUG)), \
	gdb \
	strace \
	xdpyinfo \
	valgrind \
	valgrind-listener \
	cg_annotate \
	callgrind_control \
	callgrind_annotate \
	))
MM_LIB_DEBUG    := $(strip $(if $(filter yes,$(mm_DEBUG)), \
	valgrind \
	))
MM_ETC_DEBUG    := $(strip $(if $(filter yes,$(mm_DEBUG)), \
	))
MM_SHARE_DEBUG  := $(strip $(if $(filter yes,$(mm_DEBUG)), \
	))
MM_REMOVE_DEBUG := $(strip $(if $(filter yes,$(mm_DEBUG)), \
	))

MM_BINS    := $(sort $(if $(MM_BIN_FILES),    $(shell cat $(MM_BIN_FILES)    | sed 's%[ \t]*\#.*%%')) $(MM_BIN_DEBUG)    $(mm_USER_BIN_LIST))
MM_LIBS    := $(sort $(if $(MM_LIB_FILES),    $(shell cat $(MM_LIB_FILES)    | sed 's%[ \t]*\#.*%%')) $(MM_LIB_DEBUG)    $(mm_USER_LIB_LIST))
MM_ETCS    := $(sort $(if $(MM_ETC_FILES),    $(shell cat $(MM_ETC_FILES)    | sed 's%[ \t]*\#.*%%')) $(MM_ETC_DEBUG)    $(mm_USER_ETC_LIST))
MM_SHARES  := $(sort $(if $(MM_SHARE_FILES),  $(shell cat $(MM_SHARE_FILES)  | sed 's%[ \t]*\#.*%%')) $(MM_SHARE_DEBUG)  $(mm_USER_SHARE_LIST))
MM_REMOVES := $(sort $(if $(MM_REMOVE_FILES), $(shell cat $(MM_REMOVE_FILES) | sed 's%[ \t]*\#.*%%')) $(MM_REMOVE_DEBUG) $(mm_USER_REMOVE_LIST))

build_vars := $(filter-out mm_HOME mm_TFTP_ROOT mm_NFS_ROOT,$(sort $(shell cat $(GARDIR)/minimyth.conf.mk | grep -e '^mm_' | sed -e 's%[ =].*%%')))

bindirs := \
	$(esbindir) \
	$(ebindir) \
	$(sbindir) \
	$(bindir) \
	$(qtbindir) \
	$(extras_sbindir) \
	$(extras_bindir)
libdirs_base := \
	$(elibdir) \
	$(libdir) \
	$(libdir)/mysql \
	$(qtlibdir) \
	$(extras_libdir)
libdirs := \
	$(libdir)/xorg/modules \
	$(if $(filter $(mm_CHIPSETS),nvidia),$(libdir)/nvidia) \
	$(if $(filter $(mm_CHIPSETS),nvidia),$(libdir)/nvidia/xorg/modules) \
	$(libdirs_base)
etcdirs :=  \
	$(extras_sysconfdir) \
	$(sysconfdir)
sharedirs :=  \
	$(extras_sharedstatedir) \
	$(sharedstatedir)

MAKE_PATH = \
	$(patsubst @%@,%,$(subst @ @,:, $(strip $(patsubst %,@%@,$(1)))))

GET_UID = \
	$(shell cat ./dirs/etc/passwd | grep -e '^$1' | cut -d':' -f 3)
GET_GID = \
	$(shell cat ./dirs/etc/group  | grep -e '^$1' | cut -d':' -f 3)


# $1 = file type label plural.
# $2 = file type label singular.
# $3 = file directories.
# $4 = files.
COPY_FILES = \
	echo "copying $(strip $(1))" ; \
	for dir in $(strip $(3)) ; do \
		mkdir -p $(mm_ROOTFSDIR)$${dir} ; \
	done ; \
	for file_item in $(strip $(4)) ; do \
		found="" ; \
		for dir in $(strip $(3)) ; do \
			file_list="" ; \
			if test -e $(DESTDIR)/$${dir} ; then \
				file_list=`cd $(DESTDIR)/$${dir} ; ls -1d $${file_item} 2> /dev/null` ; \
			fi ; \
			for file in $${file_list} ; do \
				if test -e $(DESTDIR)/$${dir}/$${file} ; then \
					found="true" ; \
					source_file="$(DESTDIR)/$${dir}/$${file}" ; \
					target_file="$(mm_ROOTFSDIR)/$${dir}/$${file}" ; \
					if test ! -e $${target_file} ; then \
						if test -d $${source_file} ; then \
                                       			target_dir=`dirname $${target_file}` ; \
                                       			mkdir -p $${target_dir} ; \
							cp -fa  $${source_file} $${target_file} ; \
						else \
                                       			target_dir=`dirname $${target_file}` ; \
                                       			mkdir -p $${target_dir} ; \
							cp -f  $${source_file} $${target_file} ; \
						fi ; \
					fi ; \
				fi ; \
			done ; \
		done ; \
		if test -z $${found} ; then \
			echo "warning: $(strip $(2)) \"$${file_item}\" not found." ; \
		fi ; \
	done

mm-all:

mm-build: mm-check mm-clean mm-make-busybox mm-copy mm-make-conf mm-remove-pre mm-copy-libs mm-remove-post mm-strip mm-gen-files mm-make-udev mm-make-other mm-make-extras mm-make-themes mm-make-rootfs mm-make-distro

mm-check:
	@# Check build environment.
	@for bin in $(build_system_bins) ; do \
		which $${bin} > /dev/null 2>&1 ; \
		if [ ! "$$?" = "0" ] ; then \
			echo "error: the build system does not contain the program '$${bin}'." ; \
			exit 1 ; \
		fi ; \
	done
	@if [ `id -u` -eq 0 ] || [ `id -g` -eq 0 ] ; then \
		echo "error: gar-minimyth cannot be run by the user 'root'." ; \
		exit 1 ; \
	fi
	@for dir in /          /lib                              /bin           /sbin \
	            /usr       /usr/lib       /usr/libexec       /usr/bin       /usr/sbin \
	            /usr/local /usr/local/lib /usr/local/libexec /usr/local/bin /usr/local/sbin\
	            /opt ; do \
		if [ -e "$${dir}" ] && [ -w "$${dir}" ] ; then \
			echo "error: gar-minimyth cannot be run by a user with write access to '$${dir}'." ; \
			exit 1 ; \
		fi ; \
	done
	@# Check for obsolete parameters and parameter values.
	@if [ -n "$(mm_INSTALL_TFTP_BOOT)" ] ; then \
		echo "error: mm_INSTALL_TFTP_BOOT should be replaced with mm_INSTALL_RAM_BOOT." ; \
		exit 1 ; \
	fi
	@if [ -n "$(mm_INSTALL_CRAMFS)" ] ; then \
		echo "error: mm_INSTALL_CRAMFS should be replaced with mm_INSTALL_RAM_BOOT." ; \
		exit 1 ; \
	fi
	@if [ -n "$(mm_INSTALL_NFS)" ] ; then \
		echo "error: mm_INSTALL_NFS should be replaced with mm_INSTALL_NFS_BOOT." ; \
		exit 1 ; \
	fi
	@if [ "$(mm_XORG_VERSION)" = "old" ] ; then \
		echo "error: mm_XORG_VERSION=\"old\" should be replaced with mm_XORG_VERSION=\"6.8\"." ; \
		exit 1 ; \
	fi
	@if [ "$(mm_XORG_VERSION)" = "new" ] ; then \
		echo "error: mm_XORG_VERSION=\"new\" should be replaced with mm_XORG_VERSION=\"7.0\"." ; \
		exit 1 ; \
	fi
	@# Check build parameters.
	@if [ ! -e $(HOME)/.minimyth/minimyth.conf.mk ] ; then \
		echo "error: configuration file '$(HOME)/.minimyth/minimyth.conf.mk' is missing." ; \
		exit 1 ; \
	fi
	@if [ ! "$(mm_GARCH)" = "athlon64"    ] && \
	    [ ! "$(mm_GARCH)" = "c3"          ] && \
	    [ ! "$(mm_GARCH)" = "c3-2"        ] && \
	    [ ! "$(mm_GARCH)" = "pentium-mmx" ] ; then \
		echo "error: mm_GARCH=\"$(mm_GARCH)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@if [ ! "$(mm_HOME)" = "`cd $(GARDIR)/.. ; pwd`" ] ; then \
		echo "error: mm_HOME must be set to \"`cd $(GARDIR)/.. ; pwd`\" but has been set to \"$(mm_HOME)\"."; \
		exit 1 ; \
	fi
	@if [ "$(firstword $(strip $(subst /, ,$(mm_HOME))))" = "$(firstword $(strip $(subst /, ,$(qtprefix))))" ] ; then \
		echo "error: MiniMyth cannot be built in a subdirectory of \"/$(firstword $(strip $(subst /, ,$(qtprefix))))\"."; \
		exit 1 ; \
	fi
	@if [ ! "$(mm_DEBUG)" = "yes" ] && [ ! "$(mm_DEBUG)" = "no" ] ; then \
		echo "error: mm_DEBUG=\"$(mm_DEBUG)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@if [ ! "$(mm_MYTH_VERSION)" = "stable18" ] && \
	    [ ! "$(mm_MYTH_VERSION)" = "stable19" ] && \
	    [ ! "$(mm_MYTH_VERSION)" = "stable20" ] && \
	    [ ! "$(mm_MYTH_VERSION)" = "svn"      ] ; then \
		echo "error: mm_MYTH_VERSION=\"$(mm_MYTH_VERSION)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@if [ ! "$(mm_NVIDIA_VERSION)" = "8178" ] && \
	    [ ! "$(mm_NVIDIA_VERSION)" = "8774" ] && \
	    [ ! "$(mm_NVIDIA_VERSION)" = "8776" ] && \
	    [ ! "$(mm_NVIDIA_VERSION)" = "9625" ] ; then \
		echo "error: mm_NVIDIA_VERSION=\"$(mm_NVIDIA_VERSION)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@if [ ! "$(mm_XORG_VERSION)" = "6.8" ] && \
	    [ ! "$(mm_XORG_VERSION)" = "7.0" ] ; then \
		echo "error: mm_XORG_VERSION=\"$(mm_XORG_VERSION)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@# Check install parameters.
	@if [ ! "$(mm_INSTALL_RAM_BOOT)" = "yes" ] && [ ! "$(mm_INSTALL_RAM_BOOT)" = "no" ] ; then \
		echo "error: mm_INSTALL_RAM_BOOT=\"$(mm_INSTALL_RAM_BOOT)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@if [ ! "$(mm_INSTALL_NFS_BOOT)" = "yes" ] && [ ! "$(mm_INSTALL_NFS_BOOT)" = "no" ] ; then \
		echo "error: mm_INSTALL_NFS_BOOT=\"$(mm_INSTALL_NFS_BOOT)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@if [ ! "$(mm_INSTALL_LATEST)"   = "yes" ] && [ ! "$(mm_INSTALL_LATEST)"   = "no" ] ; then \
		echo "error: mm_INSTALL_LATEST=\"$(mm_INSTALL_LATEST)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@if [ "$(mm_INSTALL_RAM_BOOT)" = "yes" ] && [ ! -d "$(mm_TFTP_ROOT)" ] ; then \
		echo "error: the directory specified by mm_TFTP_ROOT=\"$(mm_TFTP_ROOT)\" does not exist." ; \
		exit 1 ; \
	fi
	@if [ "$(mm_INSTALL_NFS_BOOT)" = "yes" ] && [ ! -d "$(mm_TFTP_ROOT)" ] ; then \
		echo "error: the directory specified by mm_TFTP_ROOT=\"$(mm_TFTP_ROOT)\" does not exist." ; \
		exit 1 ; \
	fi
	@if [ "$(mm_INSTALL_NFS_BOOT)" = "yes" ] && [ ! -d "$(mm_NFS_ROOT)"  ] ; then \
		echo "error: the directory specified by mm_NFS_ROOT=\"$(mm_NFS_ROOT)\" does not exist." ; \
		exit 1 ; \
	fi
	@if [ "$(mm_INSTALL_LATEST)"   = "yes" ] && [ ! -d "$(mm_TFTP_ROOT)" ] ; then \
		echo "error: the directory specified by mm_TFTP_ROOT=\"$(mm_TFTP_ROOT)\" does not exist." ; \
		exit 1 ; \
	fi

mm-clean:
	@rm -rf $(mm_DESTDIR)

mm-make-busybox:
	@main_DESTDIR=$(PWD)/$(mm_ROOTFSDIR) make -C $(GARDIR)/utils/busybox DESTIMG=$(DESTIMG) install
	@rm -rf $(mm_ROOTFSDIR)/var

mm-copy:
	@# Copy versions.
	@mkdir -p $(mm_ROOTFSDIR)$(versiondir)-build
	@cp -fa $(build_DESTDIR)$(build_versiondir)/* $(mm_ROOTFSDIR)$(versiondir)-build
	@mkdir -p $(mm_ROOTFSDIR)$(versiondir)
	@cp -fa $(DESTDIR)$(versiondir)/* $(mm_ROOTFSDIR)$(versiondir)
	@rm -rf $(mm_ROOTFSDIR)$(versiondir)/minimyth
	@mkdir -p $(mm_ROOTFSDIR)$(extras_versiondir)
	@cp -fa $(DESTDIR)$(extras_versiondir)/* $(mm_ROOTFSDIR)$(extras_versiondir)
	@# Copy licenses.
	@mkdir -p $(mm_ROOTFSDIR)$(licensedir)
	@cp -fa $(DESTDIR)$(licensedir)/* $(mm_ROOTFSDIR)$(licensedir)
	@rm -rf $(mm_ROOTFSDIR)$(licensedir)/minimyth
	@mkdir -p $(mm_ROOTFSDIR)$(extras_licensedir)
	@cp -fa $(DESTDIR)$(extras_licensedir)/* $(mm_ROOTFSDIR)$(extras_licensedir)
	@# Copy QT mysql plugin.
	@mkdir -p $(mm_ROOTFSDIR)$(qtprefix)/plugins
	@cp -fa $(DESTDIR)$(qtprefix)/plugins/sqldrivers $(mm_ROOTFSDIR)$(qtprefix)/plugins
	@mkdir -p $(mm_ROOTFSDIR)$(bindir)
	@cp -fa ./dirs/usr/bin/*                         $(mm_ROOTFSDIR)$(bindir)
	@# Copy binaries, etcs, shares, and libraries.
	@$(call COPY_FILES, "binaries" , "binary" , $(bindirs)  , $(MM_BINS)  )
	@$(call COPY_FILES, "etcs"     , "etc"    , $(etcdirs)  , $(MM_ETCS)  )
	@$(call COPY_FILES, "shares"   , "share"  , $(sharedirs), $(MM_SHARES))
	@$(call COPY_FILES, "libraries", "library", $(libdirs)  , $(MM_LIBS)  )

mm-make-conf:
	@mkdir -p $(mm_ROOTFSDIR)$(sysconfdir)
	@mkdir -p $(mm_ROOTFSDIR)$(sysconfdir)/fonts
	@echo -n                                         >  $(mm_ROOTFSDIR)$(sysconfdir)/fonts/local.conf
	@echo '<?xml version="1.0"?>'                    >> $(mm_ROOTFSDIR)$(sysconfdir)/fonts/local.conf
	@echo '<!DOCTYPE fontconfig SYSTEM "fonts.dtd">' >> $(mm_ROOTFSDIR)$(sysconfdir)/fonts/local.conf
	@echo '<fontconfig>'                             >> $(mm_ROOTFSDIR)$(sysconfdir)/fonts/local.conf
	@echo '<dir>$(libdir)/X11/fonts/misc</dir>'      >> $(mm_ROOTFSDIR)$(sysconfdir)/fonts/local.conf
	@echo '<dir>$(libdir)/X11/fonts/TTF</dir>'       >> $(mm_ROOTFSDIR)$(sysconfdir)/fonts/local.conf
	@echo '</fontconfig>'                            >> $(mm_ROOTFSDIR)$(sysconfdir)/fonts/local.conf
	@cp -r ./dirs/etc/* $(mm_ROOTFSDIR)$(sysconfdir)
	@sed -i 's%@PATH@%$(call MAKE_PATH,$(bindirs))%'          $(mm_ROOTFSDIR)$(sysconfdir)/conf.d/core
	@sed -i 's%@MM_VERSION@%$(mm_VERSION)%'                   $(mm_ROOTFSDIR)$(sysconfdir)/conf.d/core
	@sed -i 's%@MM_VERSION_MYTH@%$(mm_VERSION_MYTH)%'         $(mm_ROOTFSDIR)$(sysconfdir)/conf.d/core
	@sed -i 's%@MM_VERSION_MINIMYTH@%$(mm_VERSION_MINIMYTH)%' $(mm_ROOTFSDIR)$(sysconfdir)/conf.d/core
	@rm -rf   $(mm_ROOTFSDIR)$(versiondir)/minimyth.conf.mk
	@mkdir -p $(mm_ROOTFSDIR)$(versiondir)
	@$(foreach build_var,$(build_vars),echo "$(build_var)='$($(build_var))'" >> $(mm_ROOTFSDIR)$(versiondir)/minimyth.conf.mk ; )
	@sed -i 's%@EXTRAS_ROOTDIR@%$(extras_rootdir)%'  $(mm_ROOTFSDIR)$(sysconfdir)/rc.d/init.d/extras
	@rm -f $(mm_ROOTFSDIR)$(sysconfdir)/ld.so.conf
	@$(foreach dir, $(libdirs_base), echo $(dir) >> $(mm_ROOTFSDIR)$(sysconfdir)/ld.so.conf ; )
	@rm -f $(mm_ROOTFSDIR)$(sysconfdir)/ld.so.cache{,~}
	@rm -rf $(mm_ROOTFSDIR)/root ; cp -r ./dirs/root $(mm_ROOTFSDIR)
	@rm -rf $(mm_ROOTFSDIR)/srv  ; cp -r ./dirs/srv  $(mm_ROOTFSDIR)
	@mkdir -p $(mm_ROOTFSDIR)/srv/www/css
	@cp -r  $(mm_HOME)/html/css/*             $(mm_ROOTFSDIR)/srv/www/css/
	@mkdir -p $(mm_ROOTFSDIR)/srv/www/include
	@cp -r  $(mm_HOME)/html/include/*         $(mm_ROOTFSDIR)/srv/www/include/
	@mkdir -p $(mm_ROOTFSDIR)/srv/www/script
	@cp -r  $(mm_HOME)/html/script/*          $(mm_ROOTFSDIR)/srv/www/script/
	@cp -r  $(mm_HOME)/html/minimyth          $(mm_ROOTFSDIR)/srv/www/
	@ln -sf $(sysconfdir)/lircrc              $(mm_ROOTFSDIR)/root/.lircrc
	@ln -sf $(sysconfdir)/lircrc              $(mm_ROOTFSDIR)/root/.mythtv/lircrc
	@ln -sf $(sysconfdir)/X11/xinit/xinitrc   $(mm_ROOTFSDIR)/root/.xinitrc
	@ln -sf $(sysconfdir)/X11/xinit/xserverrc $(mm_ROOTFSDIR)/root/.xserverrc
	@mkdir -p $(mm_ROOTFSDIR)$(datadir)/X11 ; \
		rm -rf $(mm_ROOTFSDIR)$(datadir)/X11/app-defaults ; \
		cp -r ./dirs/usr/share/X11/app-defaults $(mm_ROOTFSDIR)$(datadir)/X11

mm-remove-pre:
	@# Remove unwanted binaries, etc, shares and libraries.
	@echo 'removing unwanted files'
	@for remove in $(addprefix $(mm_ROOTFSDIR),$(MM_REMOVES)) ; do \
		rm -rf $${remove} ; \
	done

mm-remove-post:
	@# Remove unwanted binaries, etc, shares and libraries.
	@echo 'removing unwanted files'
	@for remove in $(addprefix $(mm_ROOTFSDIR),$(MM_REMOVES)) ; do \
		rm -rf $${remove} ; \
	done

mm-copy-libs:
	@# Copy dependent libraries.
	@echo 'copying dependent libraries'
	new_filter_path="\(`echo $(strip $(libdirs)) | sed -e 's%//*%/%g' | sed -e 's% /% %g' | sed -e 's%^/%%' | sed -e 's%  *%\\\\|%g'`\)" ; \
	pass=0 ; \
	lib_count=1 ; \
	bin_list="`find $(mm_ROOTFSDIR) -exec file '{}' \; \
		| grep -i 'ELF ..-bit LSB executable' \
		| sed -e 's%:.*%%'`" ; \
	bin_list=`echo $${bin_list}` ; \
	while test $${lib_count} -gt 0 ; do \
		pass=$$((pass+1)) ; \
		lib_list="`find $(mm_ROOTFSDIR) -exec file '{}' \; \
			| grep -i 'ELF ..-bit LSB shared object' \
			| sed -e 's%:.*%%'`" ; \
		lib_list=`echo $${lib_list}` ; \
		new_list="`$(OBJDUMP) -x $${bin_list} $${lib_list} 2> /dev/null \
			| grep -e '^ *NEEDED  *' \
			| sed -e 's%^ *%%' -e 's% *$$%%' -e 's%  *% %' \
			| cut -d' ' -f 2 \
			| sort \
			| uniq`" ; \
		new_list=`echo $${new_list}` ; \
		old_list="`echo $${lib_list} \
			| sed -e 's%[^ ]*/%%g' \
			| sort \
			| uniq`" ; \
		old_list=`echo $${old_list}` ; \
		old_filter="\(`echo $${old_list} | sed -e 's%\([.+]\)%\\1%g' | sed -e 's%  *%\\\\|%g'`\)" ; \
		new_list=`echo " $${new_list} " \
			| sed -e 's%  *%  %g' \
			| sed -e "s% $${old_filter} % %g"` ; \
		new_list=`echo $${new_list} | sed -e 's%  *% %g' | sed -e 's%^  *%%' | sed -e 's%  *$$%%'` ; \
		lib_count=`echo "$${new_list}" | wc -w` ; \
		echo "  pass $${pass} found $${lib_count} libraries to copy" ; \
		if test $${lib_count} -gt 0 ; then \
		        new_filter_file="\(`echo $${new_list} | sed -e 's%\([.+]\)%\\\\\\1%g' | sed -e 's%  *%\\\\|%g'`\)" ; \
		        new_filter="$${new_filter_path}/$${new_filter_file}" ; \
			new_list=`cd $(DESTDIR) ; find * -regex "$${new_filter}"` ; \
			for lib in $${new_list} ; do \
				dir=`echo $${lib} | sed -e 's%[^/]*$$%%'` ; \
				mkdir -p $(mm_ROOTFSDIR)/$${dir} ; \
				cp -f $(DESTDIR)/$${lib} $(mm_ROOTFSDIR)/$${dir} ; \
			done ; \
		fi ; \
		bin_list= ; \
		lib_list= ; \
	done

mm-strip:
	@if test ! $(mm_DEBUG) == yes ; then \
		echo 'stripping binaries' ; \
		$(STRIP) --strip-all -R .note -R .comment \
			`find $(mm_ROOTFSDIR) -exec file '{}' \; | grep -i 'ELF ..-bit LSB executable'    | sed -e 's%:.*%%'` ; \
		echo 'stripping shared libraries' ; \
		$(STRIP) --strip-all -R .note -R .comment \
			`find $(mm_ROOTFSDIR) -exec file '{}' \; | grep -i 'ELF ..-bit LSB shared object' | sed -e 's%:.*%%'` ; \
	fi

mm-gen-files:
	@depmod -b "$(mm_ROOTFSDIR)$(rootdir)" "$(KERNEL_FULL_VERSION)"
	@cd $(mm_ROOTFSDIR)$(libdir)/X11/fonts/misc ; mkfontscale . ; mkfontdir .
	@cd $(mm_ROOTFSDIR)$(libdir)/X11/fonts/TTF  ; mkfontscale . ; mkfontdir .
	@rm -rf $(mm_ROOTFSDIR)$(datadir)/mythtv/*.ttf
	@for font in `cd $(mm_ROOTFSDIR)$(libdir)/X11/fonts/TTF ; ls -1 *.ttf` ; do \
		ln -sf ./$(call DIRSTODOTS,$(datadir)/mythtv)/$(libdir)/X11/fonts/TTF/$${font} $(mm_ROOTFSDIR)$(datadir)/mythtv/$${font} ; \
	done

mm-make-udev:
	$(foreach file, $(shell cd ./dirs/udev/scripts.d ; ls -1 *      ), \
		install -m 755 -D  ./dirs/udev/scripts.d/$(file) $(mm_ROOTFSDIR)$(elibdir)/udev/$(file) ; )
	$(foreach file, $(shell cd ./dirs/udev/rules.d   ; ls -1 *.rules *.rules.disabled), \
		install -m 644 -D  ./dirs/udev/rules.d/$(file)   $(mm_ROOTFSDIR)$(sysconfdir)/udev/rules.d/$(file) ; )
	@mkdir -p $(mm_ROOTFSDIR)$(elibdir)/udev/devices

mm-make-other:
	@# Get version.
	@mkdir -p $(mm_STAGEDIR)
	@rm -rf $(mm_STAGEDIR)/version
	@echo "$(mm_VERSION)" > $(mm_STAGEDIR)/version
	@# Get html documentation.
	@rm -rf $(mm_STAGEDIR)/html
	@cp -r $(mm_HOME)/html $(mm_STAGEDIR)
	@# Get scripts
	@rm -rf   $(mm_STAGEDIR)/scripts
	@mkdir -p $(mm_STAGEDIR)/scripts
	@cp ./files/mm_local_install $(mm_STAGEDIR)/scripts/mm_local_install
	@cp ./files/mm_local_update  $(mm_STAGEDIR)/scripts/mm_local_update
	@cp ./files/mm_local_helper  $(mm_STAGEDIR)/scripts/mm_local_helper
	@# Get kernel.
	@rm -rf $(mm_STAGEDIR)/kernel
	@cp $(DESTDIR)/$(KERNEL_DIR)/vmlinuz $(mm_STAGEDIR)/kernel
	@# Get local helper.
	@rm -rf   $(mm_STAGEDIR)/helper
	@mkdir -p $(mm_STAGEDIR)/helper
	@cp ./files/mm_local_helper $(mm_STAGEDIR)/helper/mm_local_helper
	@cd ${mm_STAGEDIR}/helper ; md5sum mm_local_helper > mm_local_helper.md5
	@# Get /usr/bin MiniMyth scripts.
	@cp ./files/mm_local_update $(mm_ROOTFSDIR)/usr/bin/mm_local_update
	@chmod 755 $(mm_ROOTFSDIR)/usr/bin/mm_local_update
	@cp ./files/mm_local_helper $(mm_ROOTFSDIR)/usr/bin/mm_local_helper_old

mm-make-extras:
	@rm -rf $(mm_EXTRASDIR) ; mkdir -p $(mm_EXTRASDIR)
	@mv $(mm_ROOTFSDIR)/$(extras_rootdir)/* $(mm_EXTRASDIR)
	@rm -rf $(mm_ROOTFSDIR)/$(extras_rootdir) ; mkdir -p $(mm_ROOTFSDIR)/$(extras_rootdir)

mm-make-themes:
	@rm -rf   $(mm_THEMESDIR) 
	@mkdir -p $(mm_THEMESDIR)
	@mv       $(mm_ROOTFSDIR)/usr/share/mythtv/themes/* $(mm_THEMESDIR)
	@rm -rf   $(mm_ROOTFSDIR)/usr/share/mythtv/themes
	@mkdir -p $(mm_ROOTFSDIR)/usr/share/mythtv/themes
	@mv       $(mm_THEMESDIR)/default*                  $(mm_ROOTFSDIR)/usr/share/mythtv/themes/

mm-make-rootfs:
	@if test -e $(mm_ROOTFSDIR).ro ; then rm -rf $(mm_ROOTFSDIR).ro ; fi
	@mv $(mm_ROOTFSDIR) $(mm_ROOTFSDIR).ro
	@mkdir -p                           $(mm_ROOTFSDIR)
	@mkdir -p                           $(mm_ROOTFSDIR)/rootfs
	@mv $(mm_ROOTFSDIR).ro              $(mm_ROOTFSDIR)/rootfs-ro
	@mkdir -p                           $(mm_ROOTFSDIR)/rw
	@mkdir -p                           $(mm_ROOTFSDIR)/bin
	@ln -s rootfs-ro/dev                $(mm_ROOTFSDIR)/dev
	@ln -s rootfs-ro/lib                $(mm_ROOTFSDIR)/lib
	@mkdir -p                           $(mm_ROOTFSDIR)/sbin
	@ln -s ../rootfs-ro/bin/mkdir       $(mm_ROOTFSDIR)/bin/mkdir
	@ln -s ../rootfs-ro/sbin/modprobe   $(mm_ROOTFSDIR)/sbin/modprobe
	@ln -s ../rootfs-ro/bin/mount       $(mm_ROOTFSDIR)/bin/mount
	@ln -s ../rootfs-ro/sbin/pivot_root $(mm_ROOTFSDIR)/sbin/pivot_root
	@ln -s ../rootfs-ro/bin/sh          $(mm_ROOTFSDIR)/bin/sh
	@cp -r ./dirs/initrd/sbin/init      $(mm_ROOTFSDIR)/sbin/init

mm-make-distro:
	@echo 'making minimyth distribution'
	@rm -rf   $(mm_STAGEDIR)/ram-$(mm_NAME)
	@rm -rf   $(mm_STAGEDIR)/nfs-$(mm_NAME)
	@mkdir -p $(mm_STAGEDIR)/ram-$(mm_NAME)
	@mkdir -p $(mm_STAGEDIR)/nfs-$(mm_NAME)
	@# Get version.
	@cp -r $(mm_STAGEDIR)/version $(mm_STAGEDIR)/ram-$(mm_NAME)/
	@cp -r $(mm_STAGEDIR)/version $(mm_STAGEDIR)/nfs-$(mm_NAME)/
	@# Get documentation 
	@cp -r $(mm_STAGEDIR)/html    $(mm_STAGEDIR)/ram-$(mm_NAME)/
	@cp -r $(mm_STAGEDIR)/html    $(mm_STAGEDIR)/nfs-$(mm_NAME)/
	@# Get scripts
	@cp -r $(mm_STAGEDIR)/scripts $(mm_STAGEDIR)/ram-$(mm_NAME)/
	@cp -r $(mm_STAGEDIR)/scripts $(mm_STAGEDIR)/nfs-$(mm_NAME)/
	@# Get kernel.
	@cp -r $(mm_STAGEDIR)/kernel  $(mm_STAGEDIR)/ram-$(mm_NAME)/
	@cp -r $(mm_STAGEDIR)/kernel  $(mm_STAGEDIR)/nfs-$(mm_NAME)/
	@# Make source tarball file.
	@echo "  making source tarball file"
	@make -f minimyth.mk mm-make-source DESTIMG=$(DESTIMG)           \
		SOURCE_DIR_HEAD=`echo $(mm_HOME)  | sed 's%/[^/]*$$%%g'` \
		SOURCE_DIR_TAIL=`echo  $(mm_HOME) | sed 's%[^/]*/%%g'`
	@chmod 644 $(mm_STAGEDIR)/$(mm_SOURCENAME).tar.bz2
	@# Make documentation tarball file.
	@echo "  making documentation tarball file"
	@rm -rf $(mm_STAGEDIR)/html.tar.bz2
	@fakeroot sh -c                                                                " \
		chown -R $(call GET_UID,root):$(call GET_GID,root) $(mm_STAGEDIR)/html ; \
		chmod -R go-w $(mm_STAGEDIR)/html                                      ; \
		tar -C $(mm_STAGEDIR) -jcf $(mm_STAGEDIR)/html.tar.bz2 html            "
	@chmod 644 $(mm_STAGEDIR)/html.tar.bz2
	@# Make helper tarball file.
	@echo "  making helper tarball file"
	@rm -rf $(mm_STAGEDIR)/helper.tar.bz2
	@fakeroot sh -c                                                                  " \
		chown -R $(call GET_UID,root):$(call GET_GID,root) $(mm_STAGEDIR)/helper ; \
		chmod -R go-w $(mm_STAGEDIR)/helper                                      ; \
		tar -C $(mm_STAGEDIR) -jcf $(mm_STAGEDIR)/helper.tar.bz2 helper          "
	@chmod 644 $(mm_STAGEDIR)/helper.tar.bz2
	@# Make root file system squashfs image file.
	@echo "  making root file system squashfs image file"
	@rm -rf $(mm_STAGEDIR)/ram-$(mm_NAME)/rootfs
	@fakeroot sh -c                                                                          " \
		rm -rf $(mm_ROOTFSDIR)/rootfs-ro/$(rootdir)/dev                                  ; \
		mkdir -p $(mm_ROOTFSDIR)/rootfs-ro/$(rootdir)/dev                                ; \
		mknod -m 600 $(mm_ROOTFSDIR)/rootfs-ro/$(rootdir)/dev/console c 5 1              ; \
		mknod -m 600 $(mm_ROOTFSDIR)/rootfs-ro/$(rootdir)/dev/initctl p                  ; \
		chown -R $(call GET_UID,root):$(call GET_GID,root) $(mm_ROOTFSDIR)               ; \
		chmod -R go-w $(mm_ROOTFSDIR)                                                    ; \
		mksquashfs $(mm_ROOTFSDIR) $(mm_STAGEDIR)/ram-$(mm_NAME)/rootfs > /dev/null 2>&1 "
	@chmod 644 $(mm_STAGEDIR)/ram-$(mm_NAME)/rootfs
	@# Make root file system tarball.
	@echo "  making root file system tarball file"
	@rm -rf $(mm_STAGEDIR)/nfs-$(mm_NAME)/rootfs.tar.bz2
	@fakeroot sh -c                                                                        " \
		rm -rf $(mm_ROOTFSDIR)/rootfs-ro/$(rootdir)/dev                                ; \
		mkdir -p $(mm_ROOTFSDIR)/rootfs-ro/$(rootdir)/dev                              ; \
		mknod -m 600 $(mm_ROOTFSDIR)/rootfs-ro/$(rootdir)/dev/console c 5 1            ; \
		mknod -m 600 $(mm_ROOTFSDIR)/rootfs-ro/$(rootdir)/dev/initctl p                ; \
		chown -R $(call GET_UID,root):$(call GET_GID,root) $(mm_ROOTFSDIR)             ; \
		chmod -R go-w $(mm_ROOTFSDIR)                                                  ; \
		tar -C $(mm_STAGEDIR) -jcf $(mm_STAGEDIR)/nfs-$(mm_NAME)/rootfs.tar.bz2 rootfs "
	@chmod 644 $(mm_STAGEDIR)/nfs-$(mm_NAME)/rootfs.tar.bz2
	@# Make extras squashfs image file.
	@echo "  making extras squashfs image file"
	@rm -rf $(mm_STAGEDIR)/ram-$(mm_NAME)/extras.sfs
	@fakeroot sh -c                                                                              " \
		chown -R $(call GET_UID,root):$(call GET_GID,root) $(mm_EXTRASDIR)                   ; \
		chmod -R go-w $(mm_EXTRASDIR)                                                        ; \
		mksquashfs $(mm_EXTRASDIR) $(mm_STAGEDIR)/ram-$(mm_NAME)/extras.sfs > /dev/null 2>&1 "
	@chmod 644 $(mm_STAGEDIR)/ram-$(mm_NAME)/extras.sfs
	@# Make extras tarball file.
	@echo "  making extras tarball file"
	@rm -rf $(mm_STAGEDIR)/nfs-$(mm_NAME)/extras.tar.bz2
	@fakeroot sh -c                                                                        " \
		chown -R $(call GET_UID,root):$(call GET_GID,root) $(mm_EXTRASDIR)             ; \
		chmod -R go-w $(mm_EXTRASDIR)                                                  ; \
		tar -C $(mm_STAGEDIR) -jcf $(mm_STAGEDIR)/nfs-$(mm_NAME)/extras.tar.bz2 extras "
	@chmod 644 $(mm_STAGEDIR)/nfs-$(mm_NAME)/extras.tar.bz2
	@# Make themes squashfs image files.
	@echo "  making themes squashfs image files"
	@rm -rf    $(mm_STAGEDIR)/ram-$(mm_NAME)/themes
	@mkdir -p  $(mm_STAGEDIR)/ram-$(mm_NAME)/themes
	@for theme in `cd $(mm_THEMESDIR) ; ls -1` ; do                                                                              \
		fakeroot sh -c                                                                                                   "   \
			chown -R $(call GET_UID,root):$(call GET_GID,root) $(mm_THEMESDIR)/$${theme}                             ;   \
			chmod -R go-w $(mm_THEMESDIR)/$${theme}                                                                  ;   \
			mksquashfs $(mm_THEMESDIR)/$${theme} $(mm_STAGEDIR)/ram-$(mm_NAME)/themes/$${theme}.sfs > /dev/null 2>&1 " ; \
		chmod 644 $(mm_STAGEDIR)/ram-$(mm_NAME)/themes/$${theme}.sfs                                                       ; \
	done
	@# Make themes tarball file.
	@echo "  making themes tarball file"
	@rm -rf $(mm_STAGEDIR)/nfs-$(mm_NAME)/themes.tar.bz2
	@fakeroot sh -c                                                                        " \
		chown -R $(call GET_UID,root):$(call GET_GID,root) $(mm_THEMESDIR)             ; \
		chmod -R go-w $(mm_THEMESDIR)                                                  ; \
		tar -C $(mm_STAGEDIR) -jcf $(mm_STAGEDIR)/nfs-$(mm_NAME)/themes.tar.bz2 themes "
	@chmod 644 $(mm_STAGEDIR)/nfs-$(mm_NAME)/themes.tar.bz2
	@# Make local (private) distribution
	@echo "  making local (private) distribution"
	@rm -rf   $(mm_LOCALDIR)
	@mkdir -p $(mm_LOCALDIR)
	@cp -r  $(mm_STAGEDIR)/version                $(mm_LOCALDIR)/version
	@cp -r  $(mm_STAGEDIR)/html.tar.bz2           $(mm_LOCALDIR)/html.tar.bz2
	@cp -r  $(mm_STAGEDIR)/gar-$(mm_NAME).tar.bz2 $(mm_LOCALDIR)/gar-$(mm_NAME).tar.bz2
	@cp -r  $(mm_STAGEDIR)/ram-$(mm_NAME)         $(mm_LOCALDIR)/ram-$(mm_NAME)
	@cp -r  $(mm_STAGEDIR)/nfs-$(mm_NAME)         $(mm_LOCALDIR)/nfs-$(mm_NAME)
	@cp -r  $(mm_STAGEDIR)/helper.tar.bz2         $(mm_LOCALDIR)/helper.tar.bz2
	@cp -r  $(mm_STAGEDIR)/scripts                $(mm_LOCALDIR)/scripts
	@make -f minimyth.mk mm-checksum-create DESTIMG=$(DESTIMG)     \
		_MM_CHECKSUM_CREATE_BASE=$(mm_LOCALDIR)/ram-$(mm_NAME) \
		_MM_CHECKSUM_CREATE_FILE=minimyth.md5
	@make -f minimyth.mk mm-checksum-create DESTIMG=$(DESTIMG)     \
		_MM_CHECKSUM_CREATE_BASE=$(mm_LOCALDIR)/nfs-$(mm_NAME) \
		_MM_CHECKSUM_CREATE_FILE=minimyth.md5
	@tar -C $(mm_LOCALDIR) -jcf $(mm_LOCALDIR)/ram-$(mm_NAME).tar.bz2 ram-$(mm_NAME)
	@tar -C $(mm_LOCALDIR) -jcf $(mm_LOCALDIR)/nfs-$(mm_NAME).tar.bz2 nfs-$(mm_NAME)
	@rm -rf $(mm_LOCALDIR)/ram-$(mm_NAME)
	@rm -rf $(mm_LOCALDIR)/nfs-$(mm_NAME)
	@cd $(mm_LOCALDIR) ; md5sum version                > version.md5
	@cd $(mm_LOCALDIR) ; md5sum helper.tar.bz2         > helper.tar.bz2.md5
	@cd $(mm_LOCALDIR) ; md5sum gar-$(mm_NAME).tar.bz2 > gar-$(mm_NAME).tar.bz2.md5
	@cd $(mm_LOCALDIR) ; md5sum ram-$(mm_NAME).tar.bz2 > ram-$(mm_NAME).tar.bz2.md5
	@cd $(mm_LOCALDIR) ; md5sum nfs-$(mm_NAME).tar.bz2 > nfs-$(mm_NAME).tar.bz2.md5
	@cd $(mm_LOCALDIR) ; md5sum html.tar.bz2           > html.tar.bz2.md5
	@# Make share (public) distribution
	@echo "  making share (public) distribution"
	@rm -rf   $(mm_SHAREDIR)
	@mkdir -p $(mm_SHAREDIR)
	@cp -r  $(mm_STAGEDIR)/version                $(mm_SHAREDIR)/version
	@cp -r  $(mm_STAGEDIR)/html.tar.bz2           $(mm_SHAREDIR)/html.tar.bz2
	@cp -r  $(mm_STAGEDIR)/gar-$(mm_NAME).tar.bz2 $(mm_SHAREDIR)/gar-$(mm_NAME).tar.bz2
	@cp -r  $(mm_STAGEDIR)/ram-$(mm_NAME)         $(mm_SHAREDIR)/ram-$(mm_NAME)
	@cp -r  $(mm_STAGEDIR)/nfs-$(mm_NAME)         $(mm_SHAREDIR)/nfs-$(mm_NAME)
	@cp -r  $(mm_STAGEDIR)/helper.tar.bz2         $(mm_SHAREDIR)/helper.tar.bz2
	@cp -r  $(mm_STAGEDIR)/scripts                $(mm_SHAREDIR)/scripts
	@rm -rf $(mm_SHAREDIR)/ram-$(mm_NAME)/extras.sfs
	@rm -rf $(mm_SHAREDIR)/nfs-$(mm_NAME)/extras.tar.bz2
	@make -f minimyth.mk mm-checksum-create DESTIMG=$(DESTIMG)     \
		_MM_CHECKSUM_CREATE_BASE=$(mm_SHAREDIR)/ram-$(mm_NAME) \
		_MM_CHECKSUM_CREATE_FILE=minimyth.md5
	@make -f minimyth.mk mm-checksum-create DESTIMG=$(DESTIMG)     \
		_MM_CHECKSUM_CREATE_BASE=$(mm_SHAREDIR)/nfs-$(mm_NAME) \
		_MM_CHECKSUM_CREATE_FILE=minimyth.md5
	@tar -C $(mm_SHAREDIR) -jcf $(mm_SHAREDIR)/ram-$(mm_NAME).tar.bz2 ram-$(mm_NAME)
	@tar -C $(mm_SHAREDIR) -jcf $(mm_SHAREDIR)/nfs-$(mm_NAME).tar.bz2 nfs-$(mm_NAME)
	@rm -rf $(mm_SHAREDIR)/ram-$(mm_NAME)
	@rm -rf $(mm_SHAREDIR)/nfs-$(mm_NAME)
	@cd $(mm_SHAREDIR) ; md5sum version                > version.md5
	@cd $(mm_SHAREDIR) ; md5sum helper.tar.bz2         > helper.tar.bz2.md5
	@cd $(mm_SHAREDIR) ; md5sum gar-$(mm_NAME).tar.bz2 > gar-$(mm_NAME).tar.bz2.md5
	@cd $(mm_SHAREDIR) ; md5sum ram-$(mm_NAME).tar.bz2 > ram-$(mm_NAME).tar.bz2.md5
	@cd $(mm_SHAREDIR) ; md5sum nfs-$(mm_NAME).tar.bz2 > nfs-$(mm_NAME).tar.bz2.md5
	@cd $(mm_SHAREDIR) ; md5sum html.tar.bz2           > html.tar.bz2.md5
	@cp -r ./files/share-readme.txt $(mm_SHAREDIR)/readme.txt

mm-make-source:
	@rm -rf   $(mm_STAGEDIR)/source
	@mkdir -p $(mm_STAGEDIR)/source
	@tar  -C $(SOURCE_DIR_HEAD) \
		--exclude '$(SOURCE_DIR_TAIL)/images/*' \
		--exclude '$(SOURCE_DIR_TAIL)/source/*' \
		--exclude '$(SOURCE_DIR_TAIL)/script/*/*/cookies' \
		--exclude '$(SOURCE_DIR_TAIL)/script/*/*/cookies/*' \
		--exclude '$(SOURCE_DIR_TAIL)/script/*/*/download' \
		--exclude '$(SOURCE_DIR_TAIL)/script/*/*/download/*' \
		--exclude '$(SOURCE_DIR_TAIL)/script/*/*/tmp' \
		--exclude '$(SOURCE_DIR_TAIL)/script/*/*/tmp/*' \
		--exclude '$(SOURCE_DIR_TAIL)/script/*/*/work' \
		--exclude '$(SOURCE_DIR_TAIL)/script/*/*/work/*' \
		--exclude '$(SOURCE_DIR_TAIL)/*.log' \
		--exclude '$(SOURCE_DIR_TAIL)/script/*.log' \
		--exclude '$(SOURCE_DIR_TAIL)/script/*/*.log' \
		--exclude '$(SOURCE_DIR_TAIL)/script/*/*/*.log' \
		-jcf $(mm_STAGEDIR)/source/$(SOURCE_DIR_TAIL).tar.bz2 \
		$(SOURCE_DIR_TAIL)
	@cd $(mm_STAGEDIR)/source ; tar -jxf $(SOURCE_DIR_TAIL).tar.bz2
	@cd $(mm_STAGEDIR)/source ; test "$(SOURCE_DIR_TAIL)" = "gar-$(mm_NAME)" || mv $(SOURCE_DIR_TAIL) gar-$(mm_NAME)
	@tar -C $(mm_STAGEDIR)/source -jcf $(mm_STAGEDIR)/gar-$(mm_NAME).tar.bz2 gar-$(mm_NAME)
	@rm -fr $(mm_STAGEDIR)/source
	@chmod 644 $(mm_STAGEDIR)/$(mm_SOURCENAME).tar.bz2

mm-checksum-create:
	@rm -rf $(_MM_CHECKSUM_CREATE_BASE)/$(_MM_CHECKSUM_CREATE_FILE)              ; \
	for file in `cd $(_MM_CHECKSUM_CREATE_BASE) ; ls -1` ; do                      \
		make -f minimyth.mk DESTIMG=$(DESTIMG)                                 \
			mm-$${file}/checksum-create                                    \
				_MM_CHECKSUM_CREATE_BASE=$(_MM_CHECKSUM_CREATE_BASE)   \
				_MM_CHECKSUM_CREATE_FILE=$(_MM_CHECKSUM_CREATE_FILE) ; \
	done

mm-%/checksum-create:
	@if   test -d $(_MM_CHECKSUM_CREATE_BASE)/$* ; then                                     \
		for file in `cd $(_MM_CHECKSUM_CREATE_BASE)/$* ; ls -1` ; do                    \
			make -f minimyth.mk mm-$*/$${file}/checksum-create DESTIMG=$(DESTIMG)   \
				_MM_CHECKSUM_CREATE_BASE=$(_MM_CHECKSUM_CREATE_BASE)            \
				_MM_CHECKSUM_CREATE_FILE=$(_MM_CHECKSUM_CREATE_FILE)          ; \
		done                                                                          ; \
	elif test -f $(_MM_CHECKSUM_CREATE_BASE)/$* ; then                                      \
		cd $(_MM_CHECKSUM_CREATE_BASE)                                                ; \
		md5sum $* >> $(_MM_CHECKSUM_CREATE_FILE)                                      ; \
	fi

mm-install: mm-check
	@rm -rf   $(mm_DESTDIR)
	@mkdir -p $(mm_DESTDIR)
	@cp -rf $(mm_LOCALDIR) $(mm_DESTDIR)/
	@cp -rf $(mm_SHAREDIR) $(mm_DESTDIR)/
	@if [ $(mm_INSTALL_RAM_BOOT) = yes ] || [ $(mm_INSTALL_NFS_BOOT) = yes ] || [ $(mm_INSTALL_LATEST) = yes ] ; then \
		su -c " \
			if [ $(mm_INSTALL_RAM_BOOT) = yes ] ; then \
				rm -rf   $(mm_TFTP_ROOT)/$(mm_NAME) ; \
			fi ; \
			\
			if [ $(mm_INSTALL_NFS_BOOT) = yes ] ; then \
				rm -rf   $(mm_TFTP_ROOT)/$(mm_NAME) ; \
				rm -rf   $(mm_NFS_ROOT)/$(mm_NAME)  ; \
			fi ; \
			\
			if [ $(mm_INSTALL_LATEST)           = yes ] ; then \
				rm -rf   $(mm_TFTP_ROOT)/latest ; \
			fi ; \
			\
			if [ $(mm_INSTALL_RAM_BOOT) = yes ] ; then \
				mkdir -p $(mm_TFTP_ROOT)/                                                                               ; \
				rm -rf   $(mm_TFTP_ROOT)/$(mm_NAME).tmp                                                                 ; \
				mkdir -p $(mm_TFTP_ROOT)/$(mm_NAME).tmp                                                                 ; \
				tar -jxf $(mm_LOCALDIR)/ram-$(mm_NAME).tar.bz2 -C $(mm_TFTP_ROOT)/$(mm_NAME).tmp                        ; \
				\
				mkdir -p $(mm_TFTP_ROOT)/$(mm_NAME)                                                                     ; \
				cp -rf   $(mm_TFTP_ROOT)/$(mm_NAME).tmp/ram-$(mm_NAME)/version    $(mm_TFTP_ROOT)/$(mm_NAME)/version    ; \
				cp -rf   $(mm_TFTP_ROOT)/$(mm_NAME).tmp/ram-$(mm_NAME)/kernel     $(mm_TFTP_ROOT)/$(mm_NAME)/kernel     ; \
				cp -rf   $(mm_TFTP_ROOT)/$(mm_NAME).tmp/ram-$(mm_NAME)/rootfs     $(mm_TFTP_ROOT)/$(mm_NAME)/rootfs     ; \
				cp -rf   $(mm_TFTP_ROOT)/$(mm_NAME).tmp/ram-$(mm_NAME)/themes     $(mm_TFTP_ROOT)/$(mm_NAME)/themes     ; \
				cp -rf   $(mm_TFTP_ROOT)/$(mm_NAME).tmp/ram-$(mm_NAME)/extras.sfs $(mm_TFTP_ROOT)/$(mm_NAME)/extras.sfs ; \
				\
				rm -rf   $(mm_TFTP_ROOT)/$(mm_NAME).tmp                                                                 ; \
			fi ; \
			\
			if [ $(mm_INSTALL_NFS_BOOT) = yes ] ; then \
				mkdir -p $(mm_TFTP_ROOT)/                                                                                    ; \
				rm -rf   $(mm_TFTP_ROOT)/$(mm_NAME).tmp                                                                      ; \
				mkdir -p $(mm_TFTP_ROOT)/$(mm_NAME).tmp                                                                      ; \
				tar -jxf $(mm_LOCALDIR)/nfs-$(mm_NAME).tar.bz2 -C $(mm_TFTP_ROOT)/$(mm_NAME).tmp                             ; \
				\
				mkdir -p $(mm_TFTP_ROOT)/                                                                                    ; \
				mkdir -p $(mm_TFTP_ROOT)/$(mm_NAME)                                                                          ; \
				cp -rf   $(mm_TFTP_ROOT)/$(mm_NAME).tmp/nfs-$(mm_NAME)/version $(mm_TFTP_ROOT)/$(mm_NAME)/version            ; \
				cp -rf   $(mm_TFTP_ROOT)/$(mm_NAME).tmp/nfs-$(mm_NAME)/kernel  $(mm_TFTP_ROOT)/$(mm_NAME)/kernel             ; \
				\
				tar -jxf $(mm_TFTP_ROOT)/$(mm_NAME).tmp/nfs-$(mm_NAME)/rootfs.tar.bz2  -C $(mm_TFTP_ROOT)/$(mm_NAME).tmp     ; \
				tar -jxf $(mm_TFTP_ROOT)/$(mm_NAME).tmp/nfs-$(mm_NAME)/extras.tar.bz2  -C $(mm_TFTP_ROOT)/$(mm_NAME).tmp     ; \
				tar -jxf $(mm_TFTP_ROOT)/$(mm_NAME).tmp/nfs-$(mm_NAME)/themes.tar.bz2  -C $(mm_TFTP_ROOT)/$(mm_NAME).tmp     ; \
				mkdir -p $(mm_NFS_ROOT)                                                                                      ; \
				mv       $(mm_TFTP_ROOT)/$(mm_NAME).tmp/rootfs   $(mm_NFS_ROOT)/$(mm_NAME)                                   ; \
				mv       $(mm_TFTP_ROOT)/$(mm_NAME).tmp/themes/* $(mm_NFS_ROOT)/$(mm_NAME)/rootfs-ro/usr/share/mythtv/themes ; \
				mv       $(mm_TFTP_ROOT)/$(mm_NAME).tmp/extras/* $(mm_NFS_ROOT)/$(mm_NAME)/rootfs-ro/$(extras_rootdir)       ; \
				\
				rm -rf   $(mm_TFTP_ROOT)/$(mm_NAME).tmp                                                                      ; \
			fi ; \
			\
			if [ $(mm_INSTALL_LATEST)  = yes ] ; then \
				mkdir -p $(mm_TFTP_ROOT)/latest                    ; \
				cp -rf   $(mm_LOCALDIR)/* $(mm_TFTP_ROOT)/latest/  ; \
			fi ; \
		" ; \
	fi
