## This is Bio1M/Bio1M.github.io.git,  a screens project directory
## makestuff/project.Makefile

# http://localhost:4215/
# http://localhost:4215/announce.html

# new announcement
# https://avenue.cllmcmaster.ca/d2l/lms/news/newedit.d2l?ou=289069
# http://Bio1M.github.io

# killall jekyll
# make serve ## jekyll.log ##

Ignore += .jekyll-cache

######################################################################

# Other avenue

# Main
## https://avenue.cllmcmaster.ca/d2l/home/289069

# announcements (list)
#	https://avenue.cllmcmaster.ca/d2l/lms/news/main.d2l?ou=289069

# forum
## https://avenue.cllmcmaster.ca/d2l/le/289069/discussions/List

######################################################################

current: target
-include target.mk

-include makestuff/perl.def

######################################################################

vim_session:
	bash -cl "vm index.md"

##################################################################

## Content

# index.md

Sources = Makefile

Sources += $(wildcard *.md) updates.html

######################################################################

## Posts

# Posts are made from drafts as a side effect of making *.post
Sources += $(wildcard _posts/*.*)
Sources += post.pl key.pl

_posts:
	$(mkdir)

# announce.post: announce.md
# Title is taken from slug (if it exists) or else from filename (usually announce, so bad, use slug)
Ignore += announce.post
%.post: %.md post.pl
	$(MAKE) _posts
	$(PUSH)
	$(shell_execute)

## Reboot
Ignore += *_post.list
%_post.list:
	ls $*_p*/* > $*_post.list ##

## git mv _posts 2018_posts ##

## Do we need a material archive?
## Probably helpful, but would contain < half of the test material
## make 2018_post.list ##
## mkdir archive ##
## git mv 2017_materials/ 2017_posts/ archive

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
## Gemfile_sb.set:
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

######################################################################

### Makestuff

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

