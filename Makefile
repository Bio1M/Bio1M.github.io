
## This is XXX, a screens project directory
## makestuff/project.Makefile

current: target
-include target.mk

######################################################################

# Content

vim_session:
	bash -cl "vm target.mk"

Sources += content.mk

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk

