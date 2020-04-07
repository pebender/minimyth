GARNAME        = perl-PerlMagick
GARVERSION     = 6.89-1
MASTER_SITES   = https://cpan.metacpan.org/authors/id/J/JC/JCRISTY/
DEPENDS        = utils/ImageMagick
PERL_MODULE_SO = true

include ../../perl/perl/perl-module.mk

post-extract:
	@mv -v $(WORKDIR)/$(patsubst perl-%,%,$(GARNAME))-$(word 1,$(subst -, ,$(GARVERSION))) $(WORKSRC)
	$(MAKECOOKIE)
