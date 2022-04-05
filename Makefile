## This is Stochasticity_chapter

current: target
-include target.mk
Ignore = target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

Sources += $(wildcard *.bib)
%.bib: | resources/%.bib
	$(CP) $| $@

Sources += inputs/*.pdf
inputs/%.pdf: resources/%.eps
	$(convert)

Sources += README.md

Sources += $(wildcard *.tex)
chapter.pdf: chapter.tex

######################################################################

## Can delete the Dropbox when the repo seems ok
Makefile: | resources
Ignore += resources
resources:
	/bin/ln -s ~/Dropbox/Stochasticity_chapter $@

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff

Makefile: makestuff/00.stamp
makestuff/%.stamp:
	- $(RM) makestuff/*.stamp
	(cd makestuff && $(MAKE) pull) || git clone $(msrepo)/makestuff
	touch $@

-include makestuff/os.mk

-include makestuff/oldtexi.mk
-include makestuff/texi.mk

-include makestuff/git.mk
-include makestuff/visual.mk
