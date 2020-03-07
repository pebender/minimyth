include script/gar.conf.mk

build:
	@echo "error: 'make build' must be run in directory 'script/meta/minimyth'."
	@exit 1

clean: 
	@rm -rf images
	@$(MAKE) -C script clean

clean-all:
	@rm -rf images
	@$(MAKE) -C script clean
	@rm -rf ccache

clean-main:
	@rm -rf images/main
	@$(MAKE) -C script DESTIMG=main clean-image

clean-build:
	@rm -rf images/build
	@$(MAKE) -C script DESTIMG=build clean-image

clean-ccache:
	@rm -rf ccache

garchive:
	@$(MAKE) -C script garchive

install:
	@echo "error: 'make install' must be run in directory 'script/meta/minimyth'."
	@exit 1

update-gar:
	@cd devel ; ./update-gar
