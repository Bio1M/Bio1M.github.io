## This is Bio1M web
## Am I dropping it? 2023 Sep 03 (Sun)
## Mostly dropped for this year; sharing old midterms here, though.

# http://localhost:4215/
# http://localhost:4215/midterm2

## https://bio1m.github.io/practice
## https://bio1m.github.io/midterm1
## https://bio1m.github.io/midterm2

######################################################################

# Avenue

# Main (2021)
## https://avenue.cllmcmaster.ca/d2l/home/412000

# announcements (list)
#	https://avenue.cllmcmaster.ca/d2l/lms/news/main.d2l?ou=412000

# forum
## https://avenue.cllmcmaster.ca/d2l/le/412000/discussions/List

######################################################################

current: target
-include target.mk

-include makestuff/perl.def

######################################################################

## Trying to track which tests are which in notes.md

vim_session:
	bash -cl "vmt notes.md index.md announce.md"

##################################################################

# killall jekyll ##
## serve: jekyll.log
Ignore += .jekyll-cache

## Content

# index.md

Sources = Makefile README.md

Sources += $(wildcard *.md) updates.html

######################################################################

## Posts

# Posts are made from drafts as a side effect of making *.post
Sources += $(wildcard _posts/*.*)
Sources += post.pl key.pl

_posts:
	$(mkdir)

# http://localhost:4215/announce.html
# announce.post: announce.md
# Title is taken from slug (if it exists) or else from filename (usually announce, so use slug)

## This is probably to stop auto-reposts from each machine
Sources += announce.post
%.post: %.md post.pl
	$(MAKE) _posts
	$(PUSH)
	$(shell_execute)

## Reboot
Ignore += *_post.list
%_post.list:
	ls $*_p*/* > $*_post.list ##

## Use last time you taught!
## git mv _posts 2023_posts ##
## git mv materials 2023_materials ##

## Do we need a material archive?
## Probably helpful, but would contain < half of the test material
## make 2023_post.list ##
## mkdir archive ##
## git mv 2018_posts/ archive ##

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

Sources += _config.yml
Sources += _includes/* _layouts/* css/* _sass/*

Ignore +=	.sass-cache/ _site/
## cp -r _config.yml Gemfile_* _includes _layouts css _sass ~/gitroot/labPages ##

Ignore += Gemfile Gemfile.lock
Sources += $(wildcard Gemfile.*)
## Gemfile_sb.set:
Gemfile_%.set: Gemfile.%
	/bin/ln -fs $< Gemfile

jinstall: Gemfile
	sudo bundle install

######################################################################

Sources += $(wildcard materials/*)
commit.time: materials
materials:
	mkdir $@

Sources += $(wildcard tests/* wildcard tests/*/*)
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
