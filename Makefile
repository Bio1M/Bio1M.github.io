# Bio1M.github.io
# http://Bio1M.github.io
# http://localhost:4000/

######################################################################

### Hooks for the editor to set the default target
current: target
target = Makefile
-include target.mk
target: $(target)

##################################################################


Sources = Makefile .gitignore README.md sub.mk LICENSE.md
include sub.mk
# include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.md) updates.html

######################################################################

## Decoration

ngorongoro.jpg: 
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/e/e5/Ngorongoro_Crater%2C_Tanzania.jpg"

ngorongoro.crop.jpg: ngorongoro.jpg Makefile
	convert -crop 960x240+0+500 $< $@

######################################################################

# Jekyll

Sources += _config.yml $(wildcard Gemfile_*)

Sources += _includes/* _layouts/* css/* _sass/*

Gemfile:
	/bin/ln -s Gemfile_orig $@
# Gemfile_sb

######################################################################


-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
