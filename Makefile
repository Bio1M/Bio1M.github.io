## This is Bio1M/Bio1M.github.io.git,  a screens project directory
## makestuff/project.Makefile

# killall jekyll
# make serve ## jekyll.log ##
# http://localhost:4215/
# http://localhost:4215/announce.html

# new announcement
## https://cap.mcmaster.ca/mcauth/login.jsp?app_id=1505&app_name=Avenue
# https://teams.microsoft.com/_#/school/conversations/General?threadId=19:abqC9ao2ShWYbTbQeLP8RRHnyxcB4aNF9vLL9S4OUbA1@thread.tacv2&ctx=channel
# https://avenue.cllmcmaster.ca/d2l/lms/news/newedit.d2l?ou=412000
# http://Bio1M.github.io/announce.html
# http://Bio1M.github.io/

Ignore += .jekyll-cache

######################################################################

# Other avenue

# Main
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

vim_session:
	bash -cl "vmt index.md announce.md 2019_post.list jekyll.log"

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
# Title is taken from slug (if it exists) or else from filename (usually announce, so use slug)
Sources += announce.post ## Why?? 2021 Sep 10 (Fri)
%.post: %.md post.pl
	$(MAKE) _posts
	$(PUSH)
	$(shell_execute)

## Reboot
Ignore += *_post.list
%_post.list:
	ls $*_p*/* > $*_post.list ##

## git mv _posts 2019_posts ##
## git mv materials 2019_materials ##

## Do we need a material archive?
## Probably helpful, but would contain < half of the test material
## make 2019_post.list ##
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
Gemfile_orig.set Gemfile_sb.set: Gemfile_%.set: Gemfile.%
	/bin/ln -fs $< Gemfile

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

