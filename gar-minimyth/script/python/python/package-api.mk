PYTHON_VERSION_MAJOR = 3
PYTHON_VERSION_MINOR = 8
PYTHON_VERSION_TEENY = 0
PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR).$(PYTHON_VERSION_TEENY)

PYTHON_includedir = $(includedir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)
PYTHON_libdir = $(libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)
build_PYTHON_includedir = $(build_includedir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)
build_PYTHON_libdir = $(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)
