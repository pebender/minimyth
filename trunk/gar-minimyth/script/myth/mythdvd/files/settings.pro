#CONFIG += debug
CONFIG += release

PREFIX = @PREFIX@

INCLUDEPATH += @DESTDIR@@INCLUDEDIR@

DEFINES += _GNU_SOURCE
DEFINES += PREFIX=\"$${PREFIX}\"
release {
        QMAKE_CXXFLAGS_RELEASE = @CFLAGS@
}
