# http://localhost:4215/
# http://localhost:4215/announce.html

# new announcement
# https://avenue.cllmcmaster.ca/d2l/lms/news/newedit.d2l?ou=251005
# http://Bio1M.github.io

######################################################################

# home
#	https://avenue.cllmcmaster.ca/d2l/home/251005 

# announcements (new and list)
# https://avenue.cllmcmaster.ca/d2l/lms/news/newedit.d2l?ou=251005&global=0
#	https://avenue.cllmcmaster.ca/d2l/lms/news/main.d2l?ou=251005

# forum
#	https://avenue.cllmcmaster.ca/d2l/le/251005/discussions/List

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

_posts:
	$(mkdir)

Ignore += 2017_post.list
2017_post.list:
	ls 2017_p*/* > 2017_post.list ##

# announce.post: announce.md
# Title is taken from slug (if it exists) or else from filename (usually announce, so bad)
Ignore += announce.post
%.post: %.md post.pl
	$(MAKE) _posts
	$(PUSH)
	$(shell_execute)

######################################################################

## Text questions and keys
## This is probably stupid; move to pdf once things are sorted
## Notice that _ques.md is _not_ a source file, but _is_ on the repo
## because jekyll

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

baobab.jpg:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Adansonia_grandidieri04.jpg/180px-Adansonia_grandidieri04.jpg"

baobab.crop.jpg: baobab.jpg
	convert -crop 140x140+20+30 $< $@

Sources += favicon.ico
Ignore += *.ico baobab.*
favicon.ico: baobab.crop.jpg
	convert -resize x16 -gravity center -crop 16x16+0+0 -flatten -colors 256 $< 16.ico
	convert -resize x32 -gravity center -crop 32x32+0+0 -flatten -colors 256 $< 32.ico
	convert 16.ico 32.ico $@

######################################################################

# Jekyll

Sources += _config.yml $(wildcard Gemfile_*)

Sources += _includes/* _layouts/* css/* _sass/*

Ignore +=	.sass-cache/ _site/
## cp -r _config.yml Gemfile_* _includes _layouts css _sass ~/gitroot/labPages ##

Ignore += Gemfile Gemfile.lock
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
