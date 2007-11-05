build_system_bins = $(strip $(sort \
	binutils \
	bison \
	bzip2 \
	coreutils \
	cvs \
	diffutils \
	file \
	findutils \
	flex \
	gawk \
	gcc \
	git \
	glibc \
	grep \
	gzip \
	m4 \
	make \
	patch \
	perl \
	sed \
	subversion \
	tar \
	texinfo \
	util-linux \
	wget \
))

# Overridden by binaries from package devel/binutils.
build_system_bins_binutils = \
	ar \
	as \
	ld \
	nm \
	ranlib

# Overridden by binaries from package devel/bison.
build_system_bins_bison = \
	bison

# Overridden by binaries from package utils/bzip2.
build_system_bins_bzip2 = \
	bzip2

# Overridden by binaries from package utils/coreutils, except 'su'.
build_system_bins_coreutils = \
	basename \
	cat \
	chmod \
	cp \
	cut \
	date \
	dirname \
	echo \
	env \
	expr \
	false \
	head \
	id \
	install \
	ln \
	ls \
	md5sum \
	mkdir \
	mv \
	od \
	rm \
	rmdir \
	sleep \
	sort \
	su \
	tail \
	test \
	touch \
	tr \
	true \
	uname \
	uniq \
	wc
# This is included because of 'chown' problem described in 'utils/coreutils/Makefile'.
# Once the described problem is fixed, it can be removed.
build_system_bins_coreutils += \
	chown

build_system_bins_cvs = \
	cvs

# Overridden by binaries from package utils/diffutils.
build_system_bins_diffutils = \
	cmp \
	diff

# Overridden by binaries from package utils/file.
build_system_bins_file = \
	file

# Overridden by binaries from package utils/findutils.
build_system_bins_findutils = \
	find

# Overridden by binaries from package utils/flex.
build_system_bins_flex = \
	flex

# Overridden by binaries from package utils/gawk.
build_system_bins_gawk = \
	awk \
	gawk

# Overridden by binaries from package devel/gcc.
build_system_bins_gcc = \
	cpp \
	gcc

build_system_bins_git = \
	git

build_system_bins_glibc = \
	getconf \
	iconv \
	ldconfig

# Overridden by binaries from package utils/grep.
build_system_bins_grep = \
	egrep \
	fgrep \
	grep

# Overridden by binaries from package utils/gzip.
build_system_bins_gzip = \
	gzip

# Overridden by binaries from package utils/m4.
build_system_bins_m4 = \
	m4

# Overridden by binaries from package devel/make.
build_system_bins_make = \
	make

# Overridden by binaries from package devel/patch.
build_system_bins_patch = \
	patch

build_system_bins_perl = \
	perl

# Overridden by binaries from package utils/sed.
build_system_bins_sed = \
	sed

build_system_bins_subversion = \
	svn

# Overridden by binaries from package utils/tar.
build_system_bins_tar = \
	tar

# Overridden by binaries from package doc/texinfo.
build_system_bins_texinfo = \
	makeinfo

# Overridden by binaries from package utils/util-linux.
build_system_bins_util_linux = \
	arch

build_system_bins_wget = \
	wget
