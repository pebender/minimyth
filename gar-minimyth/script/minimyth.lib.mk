# $(call FIX_LIBTOOL_HARDCODE,<file_name>)
# $(call FIX_LIBTOOL_HARDCODE,<dir_name>,<file_basename>)
# Libtool hardcodes library paths. sed lines (1) and (2) disable this.
# Once hardcoding is disabled, libtool uses LD_RUN_PATH. sed ine (3) disables this.
# If the package is being built for the build environement, then hardcoding is not disabled,
# since the build environment files are never relocated.
FIX_LIBTOOL_HARDCODE = \
	if [ ! "x$(DESTIMG)" = "zxbuild" ] ; then                                                             \
		if [ "x$(strip $(1))" = "x" ] ; then                                                         \
			exit 1                                                                             ; \
		fi                                                                                         ; \
		if [ ! -e $(strip $(1)) ] ; then                                                             \
			exit 1                                                                             ; \
		fi                                                                                         ; \
		if [ ! -f $(strip $(1)) ] && [ ! -d $(strip $(1)) ] ; then                                   \
			exit 1                                                                             ; \
		fi                                                                                         ; \
		if [ -d $(strip $(1)) ] && [ "x$(strip $(2))" = "x" ] ; then                                 \
			exit 1                                                                             ; \
		fi                                                                                         ; \
		file_name_list=''                                                                          ; \
		if [ -f $(strip $(1)) ] ; then                                                               \
			file_name_list=$(strip $(1))                                                       ; \
		fi                                                                                         ; \
		if [ -d $(strip $(1)) ] ; then                                                               \
        		file_name_list=`find $(strip $(1)) -name $(strip $(2))`                            ; \
		fi                                                                                         ; \
		if [ "x$${file_name_list}" = "x" ] ; then                                                    \
			exit 1                                                                             ; \
		fi                                                                                         ; \
		for file_name in $${file_name_list} ; do                                                     \
			sed -i 's%^[ \t]*hardcode_into_libs=.*%hardcode_into_libs=no%'             $${file_name} ; \
			sed -i 's%^[ \t]*hardcode_libdir_flag_spec=.*%hardcode_libdir_flag_spec=%' $${file_name} ; \
			sed -i 's%^[ \t]*runpath_var=.*%runpath_var=%'                             $${file_name} ; \
		done                                                                                       ; \
	fi
# $(call FIX_LIBTOOL_LIBPATH,<file_name>)
# $(call FIX_LIBTOOL_LIBPATH,<dir_name>,<file_basename>)
# Libtool assumes a library search path that is wrong. sed line (1) fixes this.
# Libtool assumes a library dlsearch path that is wrong. sed line (2) fixes this.
FIX_LIBTOOL_LIBPATH = \
	if [ "x$(strip $(1))" = "x" ] ; then                                                                                      \
		exit 1                                                                                                          ; \
	fi                                                                                                                      ; \
	if [ ! -e $(strip $(1)) ] ; then                                                                                          \
		exit 1                                                                                                          ; \
	fi                                                                                                                      ; \
	if [ ! -f $(strip $(1)) ] && [ ! -d $(strip $(1)) ] ; then                                                                \
		exit 1                                                                                                          ; \
	fi                                                                                                                      ; \
	if [ -d $(strip $(1)) ] && [ "x$(strip $(2))" = "x" ] ; then                                                              \
		exit 1                                                                                                          ; \
	fi                                                                                                                      ; \
	file_name_list=''                                                                                                       ; \
	if [ -f $(strip $(1)) ] ; then                                                                                            \
		file_name_list=$(strip $(1))                                                                                    ; \
	fi                                                                                                                      ; \
	if [ -d $(strip $(1)) ] ; then                                                                                            \
        	file_name_list=`find $(strip $(1)) -name $(strip $(2))`                                                         ; \
	fi                                                                                                                      ; \
	if [ "x$${file_name_list}" = "x" ] ; then                                                                                 \
		exit 1                                                                                                          ; \
	fi                                                                                                                      ; \
	libpath_l=`LANG=C $(CC) -print-search-dirs                                                                                \
		| grep -e '^libraries:'                                                                                           \
		| sed -e 's%^libraries: *%%' -e 's%=/%/%g' -e 's%:% %g'`                                                        ; \
	libpath_l=`echo $${libpath_l} | sed -e 's%  *% %g' -e 's%^ %%' -e 's% $$%%' -e 's%//*%/%g'`                             ; \
	libpath_r=""                                                                                                            ; \
	libpath_r="$${libpath_r} $(elibdir)"                                                                                    ; \
	libpath_r="$${libpath_r} $(libdir)"                                                                                     ; \
	libpath_r="$${libpath_r} $(qt5libdir)"                                                                                  ; \
	libpath_r="$${libpath_r} $(libdir)/mysql"                                                                               ; \
	libpath_r="$${libpath_r} $(if $(filter build       ,$(DESTIMG))                ,/lib/$(GARBUILD) /usr/lib/$(GARBUILD))" ; \
	libpath_r="$${libpath_r} $(if $(filter build+i386  ,$(DESTIMG)+$(GARCH_FAMILY)),/lib32 /usr/lib32 /lib /usr/lib)"       ; \
	libpath_r="$${libpath_r} $(if $(filter build+x86_64,$(DESTIMG)+$(GARCH_FAMILY)),/lib64 /usr/lib64 /lib /usr/lib)"       ; \
	libpath_r=`echo $${libpath_r} | sed -e 's%  *% %g' -e 's%^ %%' -e 's% $$%%' -e 's%//*%/%g'`                             ; \
	for file_name in $${file_name_list} ; do                                                                                  \
		sed -i "s%^sys_lib_search_path_spec=.*%sys_lib_search_path_spec=\'$${libpath_l}\'%"     $${file_name}           ; \
		sed -i "s%^sys_lib_dlsearch_path_spec=.*%sys_lib_dlsearch_path_spec=\'$${libpath_r}\'%" $${file_name}           ; \
	done
# $(call FIX_LIBTOOL,<file_name>)
# $(call FIX_LIBTOOL,<dir_name>,<file_basename>)
FIX_LIBTOOL = \
	$(call FIX_LIBTOOL_HARDCODE,$(strip $(1)),$(strip $(2))) ; \
	$(call FIX_LIBTOOL_LIBPATH,$(strip $(1)),$(strip $(2)))

# $(call FETCH_CVS, <cvs_root>, <cvs_module>, <cvs_date>, <file_base>)
FETCH_CVS = \
	mkdir -p $(PARTIALDIR)                                                                  ; \
	cd $(PARTIALDIR)                                                                        ; \
	rm -rf $(strip $(4))                                                                    ; \
	rm -rf $(strip $(4)).tar.bz2                                                            ; \
	cvs -z9 -d:pserver:$(strip $(1)) co -D $(strip $(3)) -d $(strip $(4)) $(strip $(2))     ; \
	if [ ! -d $(strip $(4)) ] ; then                                                          \
		rm -rf $(strip $(4))                                                            ; \
		rm -rf $(strip $(4)).tar.bz2                                                    ; \
		exit 1                                                                          ; \
	fi                                                                                      ; \
	tar --exclude '*/CVS' --exclude '*/.cvsignore' -jcf $(strip $(4)).tar.bz2 $(strip $(4)) ; \
	rm -rf $(strip $(4))


# $(call FETCH_GIT, <git_url>, <git_objectid>, <file_base>)
FETCH_GIT = \
	mkdir -p $(PARTIALDIR)                                                                                             ; \
	cd $(PARTIALDIR)                                                                                                   ; \
	rm -rf $(strip $(3))                                                                                               ; \
	rm -rf $(strip $(3)).tar.bz2                                                                                       ; \
	git clone git://$(strip $(1)) $(strip $(3))                                                                        ; \
	if [ ! -d $(strip $(3)) ] ; then                                                                                     \
		rm -rf $(strip $(3))                                                                                       ; \
		rm -rf $(strip $(3)).tar.bz2                                                                               ; \
		exit 1                                                                                                     ; \
	fi                                                                                                                 ; \
	cd $(strip $(3))                                                                                                   ; \
	git checkout -b $(strip $(2)) $(strip $(2))                                                                        ; \
	cd ..                                                                                                              ; \
	tar --exclude '*/.git' --exclude '*/.gitignore' --exclude '*/.gitmodules' -jcf $(strip $(3)).tar.bz2 $(strip $(3)) ; \
	rm -rf $(strip $(3))

# $(call FETCH_HG, <git_url>, <git_objectid>, <file_base>)
FETCH_HG = \
	mkdir -p $(PARTIALDIR)                                                                                             ; \
	cd $(PARTIALDIR)                                                                                                   ; \
	rm -rf $(strip $(3))                                                                                               ; \
	rm -rf $(strip $(3)).tar.bz2                                                                                       ; \
	hg clone http://$(strip $(1)) $(strip $(3))                                                                        ; \
	if [ ! -d $(strip $(3)) ] ; then                                                                                     \
		rm -rf $(strip $(3))                                                                                       ; \
		rm -rf $(strip $(3)).tar.bz2                                                                               ; \
		exit 1                                                                                                     ; \
	fi                                                                                                                 ; \
	cd $(strip $(3))                                                                                                   ; \
	hg update $(strip $(2))                                                                                            ; \
	cd ..                                                                                                              ; \
	tar --exclude '*/.hg' --exclude '*/.hgignore' --exclude '*/.hgsigs' --exclude='*/.hgtags'                            \
            -jcf $(strip $(3)).tar.bz2 $(strip $(3))                                                                       ; \
	rm -rf $(strip $(3))

# $(call FETCH_SVN, <svn_url>, <svn_revision>, <file_base>)
FETCH_SVN = \
	mkdir -p $(PARTIALDIR)                                          ; \
	cd $(PARTIALDIR)                                                ; \
	rm -rf $(strip $(3))                                            ; \
	rm -rf $(strip $(3)).tar.bz2                                    ; \
	svn co -r $(strip $(2)) $(strip $(1)) $(strip $(3))             ; \
	if [ $$? -ne 0 ] ; then                                           \
		rm -rf $(strip $(3))                                    ; \
	fi                                                              ; \
	ls -l . ; \
	if [ ! -d $(strip $(3)) ] ; then                                  \
		rm -rf $(strip $(3))                                    ; \
		rm -rf $(strip $(3)).tar.bz2                            ; \
		exit 1                                                  ; \
	fi                                                              ; \
	tar --exclude '*/.svn' -jcf $(strip $(3)).tar.bz2 $(strip $(3)) ; \
	rm -rf $(strip $(3))

# $(call RUN_AUTOTOOLS)
# $(call RUN_AUTOTOOLS, <autotools-command>)
RUN_AUTOTOOLS = \
	if [ -e $(build_DESTDIR)$(build_bindir)/autoreconf  ] &&                                     \
	   [ -e $(build_DESTDIR)$(build_bindir)/autoconf    ] &&                                     \
	   [ -e $(build_DESTDIR)$(build_bindir)/automake    ] &&                                     \
	   [ -e $(build_DESTDIR)$(build_bindir)/libtoolize  ] &&                                     \
	   [ -e $(build_DESTDIR)$(build_bindir)/intltoolize ] ; then                                 \
		$(if $(strip $(1)),                                                              \
			$(strip $(1)) ,                                                          \
			mkdir -p $(DESTDIR)$(datadir)/aclocal                                  ; \
			cd $(WORKSRC)                                                          ; \
			autoreconf --verbose --install --force -I $(DESTDIR)$(datadir)/aclocal   \
		)                                                                                   ; \
	fi

# $(call RUN_GETTEXTIZE)
# $(call RUN_GETTEXTIZE, <gettextize-command>)
RUN_GETTEXTIZE = \
	if [ -e $(build_DESTDIR)$(build_bindir)/gettextize ] ; then        \
		$(if $(strip $(1)),                                     \
			$(strip $(1)) ,                                 \
			mkdir -p $(DESTDIR)$(datadir)/aclocal         ; \
			cd $(WORKSRC)                                 ; \
			gettextize --force                              \
		)                                                         ; \
	fi

clean-image:
	@rm -rf $(COOKIEROOTDIR)/$(DESTIMG).d
	@rm -rf $(WORKROOTDIR)/$(DESTIMG).d
	@rm -rf $(SCRATCHDIR)/$(DESTIMG).d
	@rm -rf $(WORKROOTDIR)/$(DESTIMG).d

garchive-touch:
	@if test -d files ; then \
		duplicates=`find files/* -maxdepth 0 -type f -exec basename '{}' \;` ; \
	 	for duplicate in $${duplicates} ; do                                   \
			find $(GARCHIVEROOT) -name $${duplicate} -exec rm '{}' \;    ; \
		done                                                                 ; \
	fi
	@$(if $(strip $(ALLFILES)), $(if $(wildcard $(GARCHIVEDIR)), touch $(GARCHIVEDIR)))

patch-%.gar: gar-patch-%.gar
	@$(MAKECOOKIE)

gar-patch-%:
	@echo " ==> Applying patch $(DOWNLOADDIR)/$*"
	@cat $(DOWNLOADDIR)/$* \
		| sed 's%@GAR_GARBUILD@%$(GARBUILD)%g' \
		| sed 's%@GAR_GARHOST@%$(GARHOST)%g' \
		| sed 's%@GAR_compiler_dir@%$(compiler_dir)%g' \
		| sed 's%@GAR_build_DESTDIR@%$(build_DESTDIR)%g' \
		| sed 's%@GAR_build_rootdir@%$(build_rootdir)%g' \
		| sed 's%@GAR_build_prefix@%$(build_prefix)%g' \
		| sed 's%@GAR_build_bindir@%$(build_bindir)%g' \
		| sed 's%@GAR_build_datadir@%$(build_datadir)%g' \
		| sed 's%@GAR_build_docdir@%$(build_docdir)%g' \
		| sed 's%@GAR_build_ebindir@%$(build_ebindir)%g' \
		| sed 's%@GAR_build_elibdir@%$(build_elibdir)%g' \
		| sed 's%@GAR_build_esbindir@%$(build_esbindir)%g' \
		| sed 's%@GAR_build_includedir@%$(build_includedir)%g' \
		| sed 's%@GAR_build_infodir@%$(build_infodir)%g' \
		| sed 's%@GAR_build_libdir@%$(build_libdir)%g' \
		| sed 's%@GAR_build_libexecdir@%$(build_libexecdir)%g' \
		| sed 's%@GAR_build_localstatedir@%$(build_localstatedir)%g' \
		| sed 's%@GAR_build_mandir@%$(build_mandir)%g' \
		| sed 's%@GAR_build_sbindir@%$(build_sbindir)%g' \
		| sed 's%@GAR_build_sharedstatedir@%$(build_sharedstatedir)%g' \
		| sed 's%@GAR_build_sourcedir@%$(build_sourcedir)%g' \
		| sed 's%@GAR_build_sysconfdir@%$(build_sysconfdir)%g' \
		| sed 's%@GAR_build_qt5prefix@%$(build_qt5prefix)%g' \
		| sed 's%@GAR_build_qt5bindir@%$(build_qt5bindir)%g' \
		| sed 's%@GAR_build_qt5includedir@%$(build_qt5includedir)%g' \
		| sed 's%@GAR_build_qt5libdir@%$(build_qt5libdir)%g' \
		| sed 's%@GAR_build_qt5elibdir@%$(build_qt5elibdir)%g' \
		| sed 's%@GAR_DESTDIR@%$(DESTDIR)%g' \
		| sed 's%@GAR_rootdir@%$(rootdir)%g' \
		| sed 's%@GAR_prefix@%$(prefix)%g' \
		| sed 's%@GAR_bindir@%$(bindir)%g' \
		| sed 's%@GAR_datadir@%$(datadir)%g' \
		| sed 's%@GAR_docdir@%$(docdir)%g' \
		| sed 's%@GAR_ebindir@%$(ebindir)%g' \
		| sed 's%@GAR_elibdir@%$(elibdir)%g' \
		| sed 's%@GAR_esbindir@%$(esbindir)%g' \
		| sed 's%@GAR_includedir@%$(includedir)%g' \
		| sed 's%@GAR_infodir@%$(infodir)%g' \
		| sed 's%@GAR_libdir@%$(libdir)%g' \
		| sed 's%@GAR_libexecdir@%$(libexecdir)%g' \
		| sed 's%@GAR_localstatedir@%$(localstatedir)%g' \
		| sed 's%@GAR_mandir@%$(mandir)%g' \
		| sed 's%@GAR_sbindir@%$(sbindir)%g' \
		| sed 's%@GAR_sharedstatedir@%$(sharedstatedir)%g' \
		| sed 's%@GAR_sourcedir@%$(sourcedir)%g' \
		| sed 's%@GAR_sysconfdir@%$(sysconfdir)%g' \
		| sed 's%@GAR_qt5prefix@%$(qt5prefix)%g' \
		| sed 's%@GAR_qt5bindir@%$(qt5bindir)%g' \
		| sed 's%@GAR_qt5includedir@%$(qt5includedir)%g' \
		| sed 's%@GAR_qt5libdir@%$(qt5libdir)%g' \
		| sed 's%@GAR_qt5elibdir@%$(qt5elibdir)%g' \
		| sed 's%@GAR_GARCH@%$(GARCH)%g' \
		| sed 's%@GAR_GARCH_FAMILY@%$(GARCH_FAMILY)%g' \
		| sed 's%@GAR_build_CPP@%$(build_CPP)%g' \
		| sed 's%@GAR_build_CC@%$(build_CC)%g' \
		| sed 's%@GAR_build_CXX@%$(build_CXX)%g' \
		| sed 's%@GAR_build_LD@%$(build_LD)%g' \
		| sed 's%@GAR_build_AS@%$(build_AS)%g' \
		| sed 's%@GAR_build_AR@%$(build_AR)%g' \
		| sed 's%@GAR_build_RANLIB@%$(build_RANLIB)%g' \
		| sed 's%@GAR_build_OBJCOPY@%$(build_OBJCOPY)%g' \
		| sed 's%@GAR_build_NM@%$(build_NM)%g' \
		| sed 's%@GAR_build_STRIP@%$(build_STRIP)%g' \
		| sed 's%@GAR_build_CPPLAGS@%$(build_CPPFLAGS)%g' \
		| sed 's%@GAR_build_CFLAGS@%$(build_CFLAGS)%g' \
		| sed 's%@GAR_build_CXXFLAGS@%$(build_CXXFLAGS)%g' \
		| sed 's%@GAR_build_LDFLAGS@%$(build_LDFLAGS)%g' \
		| sed 's%@GAR_CPP@%$(CPP)%g' \
		| sed 's%@GAR_CC@%$(CC)%g' \
		| sed 's%@GAR_CXX@%$(CXX)%g' \
		| sed 's%@GAR_LD@%$(LD)%g' \
		| sed 's%@GAR_AS@%$(AS)%g' \
		| sed 's%@GAR_AR@%$(AR)%g' \
		| sed 's%@GAR_RANLIB@%$(RANLIB)%g' \
		| sed 's%@GAR_OBJCOPY@%$(OBJCOPY)%g' \
		| sed 's%@GAR_NM@%$(NM)%g' \
		| sed 's%@GAR_STRIP@%$(STRIP)%g' \
		| sed 's%@GAR_CPPLAGS@%$(CPPFLAGS)%g' \
		| sed 's%@GAR_CFLAGS@%$(CFLAGS)%g' \
		| sed 's%@GAR_CXXFLAGS@%$(CXXFLAGS)%g' \
		| sed 's%@GAR_LDFLAGS@%$(LDFLAGS)%g' \
		| sed 's%@GAR_LIBRARY_DIRS@%$(LIBRARY_DIRS)%g' \
		| $(GARPATCH)
	@$(MAKECOOKIE)
