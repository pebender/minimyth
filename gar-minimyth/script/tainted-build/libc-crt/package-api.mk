native_libs = $(strip $(sort \
	libc \
))

native_libs_libc = \
	crt1.o \
	crti.o \
	crtn.o \
	Scrt1.o
x_native_libs_libc = \
	crt1.o \
	crti.o \
	crtn.o \
	gcrt1.o \
	gcrt1.o \
	Mcrt1.o \
	rcrt1.o \
	Scrt1.o \
	libc.so \
	libdl.so \
	libm.so \
	libpthread.so \
	libresolv.so \
	librt.so \
	libutil.so
