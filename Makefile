# http://Bio1M.github.io

# http://localhost:4000/
# http://localhost:4000/announce.html

# https://avenue.cllmcmaster.ca/d2l/lms/news/newedit.d2l?ou=213068&global=0
# https://avenue.cllmcmaster.ca/d2l/home/213068

######################################################################

### Hooks for the editor to set the default target
current: target
target = Makefile
-include target.mk
target: $(target)

##################################################################

Sources += Makefile .gitignore README.md sub.mk LICENSE.md
include sub.mk
include $(ms)/perl.def

##################################################################

## Content

# index.md

Sources += $(wildcard *.md) updates.html

######################################################################

## Posts

# Posts are made from drafts as a side effect of making *.post
Sources += $(wildcard _posts/*.*)
Sources += post.pl

%.post: %.md post.pl
	$(PUSH)
	$(shell_execute)

announce.post: announce.md

######################################################################

## Decoration

Sources += ngorongoro.crop.jpg

ngorongoro.jpg: 
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/e/e5/Ngorongoro_Crater%2C_Tanzania.jpg"

ngorongoro.crop.jpg: ngorongoro.jpg Makefile
	convert -crop 960x240+0+500 $< $@

######################################################################

# Jekyll

Sources += _config.yml $(wildcard Gemfile_*)

Sources += _includes/* _layouts/* css/* _sass/*

Gemfile:
	/bin/ln -s Gemfile_sb $@
# Gemfile_sb
# Gemfile_orig

######################################################################

Sources += $(wildcard materials/*)
commit.time: materials
materials:
	mkdir $@

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
