GARNAME = ffmpeg
GARVERSION = 4.2.2
CATEGORIES = lib
MASTER_SITES = https://ffmpeg.org/releases/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c build-tool/make lib/fontconfig lib/freetype lib/zlib utils/bzip2 utils/xz X11/libva X11/libvdpau xorg/Mesa
BUILDDEPS = devel/nasm

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

# --enable-devices is not supported (only --disable-devices).
CONFIGURE_ARGS = \
	--enable-logging \
	--fatal-warnings \
	--prefix=$(prefix) \
	--bindir=$(bindir) \
	--datadir=$(datadir)/ffmpeg \
	--docdir=$(docdir)/ffmpeg \
	--libdir=$(libdir) \
	--shlibdir=$(libdir) \
	--incdir=$(includedir) \
	--mandir=$(mandir) \
	--disable-rpath \
	--enable-gpl \
	--disable-version3 \
	--disable-nonfree \
	--disable-static \
	--enable-shared \
	$(if $(filter -Os,$(CFLAGS)),--enable-small) \
	--enable-runtime-cpudetect \
	--disable-gray \
	--enable-swscale-alpha \
	--disable-all \
	--enable-autodetect \
	--disable-programs \
	--disable-doc \
	--disable-htmlpages \
	--disable-manpages \
	--disable-podpages \
	--disable-txtpages \
	--enable-avdevice \
	--enable-avcodec \
	--enable-avformat \
	--enable-swresample \
	--enable-swscale \
	--enable-postproc \
	--enable-avfilter \
	--disable-avresample \
	--enable-pthreads \
	--disable-w32threads \
	--disable-os2threads \
	--enable-network \
	--enable-dct \
	--disable-dwt \
	--enable-error-resilience \
	--disable-lsp \
	--enable-lzo \
	--enable-mdct \
	--enable-rdft \
	--enable-fft \
	--enable-faan \
	--enable-pixalutils \
	--disable-dxva2 \
	--enable-vaapi \
	--enable-vdpau \
	\
	--disable-everything \
	--disable-encoders \
	--enable-decoders \
	--enable-hwaccels \
	--disable-muxers \
	--enable-demuxers \
	--enable-parsers \
	--enable-bsfs \
	--enable-protocols \
	--enable-indevs \
	--enable-outdevs \
	--enable-filters \
	\
	--enable-alsa \
	--disable-appkit \
	--disable-avfoundation \
	--disable-avisynth \
	--enable-bzlib \
	--disable-coreimapge \
	--disable-chromaprint \
	--disable-frei0r \
	--disable-gcrypt \
	--disable-gmp \
	--disable-gnutls \
	--disable-iconv \
	--disable-jni \
	--disable-ladspa \
	--disable-libaribb24 \
	--disable-libass \
	--disable-libbluray \
	--disable-libbbs2d \
	--disable-libcaca \
	--disable-libcelt \
	--disable-libcdio \
	--disable-libcodec2 \
	--disable-libdav1d \
	--disable-libdc1394 \
	--disable-libfdk-aac \
	--disable-libflite \
	--enable-fontconfig \
	--enable-libfreetype \
	--disable-libfribidi \
	--disable-libgse \
	--disable-libgsm \
	--disable-libiec61883 \
	--disable-libilbc \
	--disable-libjack \
	--disable-libklvanc \
	--disable-libvazaar \
	--disable-liblensfun \
	--disable-libmodplug \
	--disable-libmp3lame \
	--disable-libopencore-amrnb \
	--disable-libopencore-amrwb \
	--disable-libopencv \
	--disable-libopenh264 \
	--disable-libopenjpeg \
	--disable-libopenmpt \
	--disable-libopus \
	--disable-libpulse \
	--disable-rsvg \
	--disable-librubberband \
	--disable-librtmp \
	--disable-libshine \
	--disable-libsmbclient \
	--disable-libsnappy \
	--disable-libsoxr \
	--disable-libspeex \
	--disable-libsrt \
	--disable-libssh \
	--disable-libtensorflow \
	--disable-libtesseract \
	--disable-libtheora \
	--disable-libtls \
	--disable-libtwolame \
	--disable-libv4l2 \
	--disable-libvidstab \
	--disable-libvmaf \
	--disable-libvo-armwbenc \
	--disable-libvorbis \
	--disable-libvpx \
	--disable-libx264 \
	--disable-libx265 \
	--disable-libxavs \
	--disable-libxavs2 \
	--enable-libxcb \
	--enable-libxcb-shm \
	--enable-libxcb-xfixes \
	--enable-libxcb-shap \
	--disable-libxvid \
	--disable-libxml2 \
	--disable-libzing \
	--disable-libzmq \
	--disable-libzvbi \
	--disable-lv2 \
	--enable-lzma \
	--disable-decklink \
	--disable-mbettls \
	--disable-mediacodec \
	--disable-libmysofa \
	--disable-openal \
	--disable-opencl \
	--enable-opengl \
	--enable-openssl \
	--disable-pocketsphinx \
	--disable-sndio \
	--disable-schannel \
	--disable-sdl2 \
	--disable-securetransport \
	--disable-vapoursynth \
	--disable-xlib \
	--enable-zlib \
	\
	--disable-amf \
	--disable-audiotoolbox \
	--disable-cuda-nvcc \
	--disable-d3d11va \
	--disable-dxva \
	--disable-ffnvcodec \
	--enable-libdrm \
	--disable-libmfx \
	--disable-libnpp \
	--disable-mmal \
	--disable-nvdec \
	--disable-nvenc \
	--disable-omx \
	--disable-omx-rpi \
	--disable-rkmpp \
	--disable-v4l2-m2m \
	--enable-vaapi \
	--enable-vdpau \
	--disable-videotoolbox \
	\
	--arch=$(GARCH_FAMILY) \
	--cpu=$(GARCH) \
	--enable-cross-compile \
	--sysroot="$(DESTDIR)$(rootdir)" \
	--sysinclude="$(DESTDIR)$(includedir)" \
	--target-os="linux" \
	--nm="$(NM)" \
	--ar="$(AR)" \
	--as="$(CC)" \
	--ln_s="ln -sfv" \
	--strip="$(STRIP)" \
	--x86asmexe="nasm" \
	--cc="$(CC)" \
	--cxx="$(CXX)" \
	--ld="$(CC)" \
	--pkg-config="$(build_DESTDIR)$(build_bindir)/pkg-config" \
	--ranlib="$(RANLIB)" \
	--host-cc="$(build_CC)" \
	--host-cflags="$(build_CFLAGS)" \
	--host-cppflags="$(build_CFPPLAGS)" \
	--host-ld="$(build_CC)" \
	--host-ldflags="$(build_LDFLAGS)" \
	--host-extralibs="" \
	--host-os="linux" \
	--extra-cflags="$(CFLAGS)" \
	--extra-cxxflags="$(CXXFLAGS)" \
	--extra-ldflags="$(LDFLAGS)" \
	--extra-libs="" \
	--extra-version="" \
	--optflags="" \
	--nvccflags="" \
	--build-suffix="" \
	--enable-pic \
	--disable-thumb \
	--enable-lto \
	--disable-symver \
	--disable-hardcoded-tables \
	--enable-safe-bitstream-reader \
	\
	--enable-asm \
	--disable-altivec \
	--disable-vsx \
	--disable-power8 \
	--enable-amd3dnow \
	--enable-amd3dnowext \
	--enable-mmx \
	--enable-mmxext \
	--enable-sse \
	--enable-sse2 \
	--enable-sse3 \
	--enable-ssse3 \
	--disable-sse4 \
	--disable-sse42 \
	--disable-avx \
	--disable-xop \
	--disable-fma3 \
	--disable-fma4 \
	--disable-avx2 \
	--disable-avx512 \
	--disable-aesni \
	--disable-armv5te \
	--disable-armv6 \
	--disable-armv6t2 \
	--disable-vfp \
	--disable-neon \
	--enable-inline-asm \
	--enable-x86asm \
	--disable-mipsdsp \
	--disable-mipsdsp2 \
	--disable-msa \
	--disable-msa2 \
	--disable-mipsfpu \
	--disable-mmi \
	--enable-fast-unaligned \
	--disable-debug \
	--enable-optimizations \
	--disable-extra-warnings \
	--disable-stripping
BUILD_ARGS     = \
	V='1'
INSTALL_ARGS   = \
	V='1'

include ../../gar.mk

xclean-all:
	@$(MAKE) clean
	@rm -rf $(DESTDIR)$(includedir)/libavcodec
	@rm -rf $(DESTDIR)$(includedir)/libavdevice
	@rm -rf $(DESTDIR)$(includedir)/libavfilter
	@rm -rf $(DESTDIR)$(includedir)/libavformat
	@rm -rf $(DESTDIR)$(includedir)/libavutil
	@rm -rf $(DESTDIR)$(includedir)/libpostproc
	@rm -rf $(DESTDIR)$(includedir)/libswscale
	@rm -rf $(DESTDIR)$(libdir)/libavcodec.*
	@rm -rf $(DESTDIR)$(libdir)/libavdevice.*
	@rm -rf $(DESTDIR)$(libdir)/libavfilter.*
	@rm -rf $(DESTDIR)$(libdir)/libavformat.*
	@rm -rf $(DESTDIR)$(libdir)/libavutil.*
	@rm -rf $(DESTDIR)$(libdir)/libpostproc.*
	@rm -rf $(DESTDIR)$(libdir)/libswscale.*
	@rm -rf $(DESTDIR)$(datadir)/ffmpeg
	@rm -rf $(DESTDIR)$(bin)/ffmpeg
