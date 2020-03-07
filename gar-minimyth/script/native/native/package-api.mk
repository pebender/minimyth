native_bins = $(strip $(sort \
	bash \
	bison \
	bzip2 \
	coreutils \
	diffutils \
	file \
	findutils \
	flex \
	gawk \
	git \
	glibc \
	grep \
	gzip \
	m4 \
	make \
	patch \
	sed \
	tar \
	wget \
	which \
	xz \
))

# Overridden by binaries from package utils/bash.
native_bins_bash = \
	sh

# Overridden by binaries from package devel/bison.
native_bins_bison = \
	bison

# Overridden by binaries from package utils/bzip2.
native_bins_bzip2 = \
	bzip2

# Overridden by binaries from package utils/coreutils, except 'su'.
native_bins_coreutils = \
	basename \
	cat \
	chmod \
	cp \
	comm \
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
	split \
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
native_bins_coreutils += \
	chown

# Overridden by binaries from package utils/diffutils.
native_bins_diffutils = \
	cmp \
	diff

# Overridden by binaries from package utils/file.
native_bins_file = \
	file

# Overridden by binaries from package utils/findutils.
native_bins_findutils = \
	find

# Overridden by binaries from package utils/flex.
native_bins_flex = \
	flex

# Overridden by binaries from package utils/gawk.
native_bins_gawk = \
	awk \
	gawk

native_bins_git = \
	git

native_bins_glibc = \
	getconf \
	iconv \
	ldconfig \
	ldd

# Overridden by binaries from package utils/grep.
native_bins_grep = \
	egrep \
	fgrep \
	grep

# Overridden by binaries from package utils/gzip.
native_bins_gzip = \
	gzip \
	gunzip \

# Overridden by binaries from package utils/m4.
native_bins_m4 = \
	m4

# Overridden by binaries from package devel/make.
native_bins_make = \
	make

# Overridden by binaries from package devel/patch.
native_bins_patch = \
	patch

# Overridden by binaries from package utils/sed.
native_bins_sed = \
	sed

# Overridden by binaries from package utils/tar.
native_bins_tar = \
	tar

# Overridden by binaries from package doc/texinfo.
native_bins_texinfo = \
	makeinfo

native_bins_wget = \
	wget

native_bins_which = \
	which

# Overridden by binaries from package utils/xz.
native_bins_xz = \
	xz
