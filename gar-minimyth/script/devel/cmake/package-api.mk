CMAKE_VERSION = 3.17.0

configure-%/cmake: 
	@echo " ==> Running configure in $*"
	@rm -rfv $*_build
	@mkdir -pv $*_build
	$(CONFIGURE_ENV) DESTDIR= cmake $(CONFIGURE_ARGS) -G Ninja -S $* -B $*_build
	@$(MAKECOOKIE)

build-%/cmake:
	@echo " ==> Running build in $*_build"
	@$(BUILD_ENV) DESTDIR= cmake --build $*_build $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/cmake: 
	@echo " ==> Running install in $*_build"
	@$(INSTALL_ENV) DESTDIR= cmake --install $*_build $(INSTALL_ARGS)
	@$(MAKECOOKIE)
