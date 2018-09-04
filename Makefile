# http://localhost:4215/
# http://localhost:4215/announce.html

# http://Bio1M.github.io

# https://avenue.cllmcmaster.ca/d2l/home/251005
# https://avenue.cllmcmaster.ca/d2l/lms/news/newedit.d2l?ou=251005&global=0

######################################################################

### Hooks for the editor to set the default target
Ignore += target.mk
current: target
target = Makefile
-include target.mk
target: $(target)

##################################################################

Sources += Makefile .ignore README.md sub.mk LICENSE.md
include sub.mk
-include $(ms)/perl.def

##################################################################

## Content

# index.md

Sources += $(wildcard *.md) updates.html

######################################################################

## Posts

# Posts are made from drafts as a side effect of making *.post
Sources += $(wildcard _posts/*.*)
Sources += post.pl key.pl

%.post: %.md post.pl
	$(PUSH)
	$(shell_execute)

announce.post: announce.md

######################################################################

## Text questions and keys
## This is probably stupid; move to pdf once things are sorted
## Notice that _ques.md is _not_ a source file, but _is_ on the repo

answers = $(wildcard *_ans.md)
questions = $(answers:_ans.md=_ques.md)
questions: $(questions)

intro_ques.md: intro_ans.md key.pl
%_ques.md: %_ans.md key.pl
	$(PUSH)

######################################################################

## Decoration

Ignore += ngorongoro*.jpg
Sources += ngorongoro.crop.jpg

ngorongoro.jpg: 
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/e/e5/Ngorongoro_Crater%2C_Tanzania.jpg"

ngorongoro.crop.jpg: ngorongoro.jpg
	convert -crop 960x240+0+500 $< $@

######################################################################

# Jekyll

Sources += _config.yml $(wildcard Gemfile_*)

Sources += _includes/* _layouts/* css/* _sass/*

## cp -r _config.yml Gemfile_* _includes _layouts css _sass ~/gitroot/labPages ##

Gemfile_orig.set Gemfile_sb.set: /proc/uptime
	/bin/ln -fs $(basename $@)  Gemfile

######################################################################

Sources += $(wildcard materials/*)
commit.time: materials
materials:
	mkdir $@

Sources += $(wildcard tests/*)
commit.time: tests
tests:
	mkdir $@

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
