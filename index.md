---
layout: page
title: Main page
---

_This page has links to all announcements and resources related to material controlled by Dushoff, available even if you have trouble with Avenue access._

# Updates (newest at top)
<!-- # [Updates](updates.html) -->

<ul class="post-list">
	{% for post in site.posts limit:4 %}
		<li>
			<span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}: </span>
				<a class="post-mini" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
		</li>
	{% endfor %}
</ul>

{% comment %} 
# [Older updates](updates.html)
{% endcomment %} 

# Course information

* [This course on Avenue](https://avenue.cllmcmaster.ca/d2l/home/289069)
* [About note-taking](http://www.vox.com/2014/6/4/5776804/note-taking-by-hand-versus-laptop)
* [Classroom announcements policy](/announcements.html)
{% comment %} 
* [Course outline](/materials/outline.pdf)
* [Dushoff office hours](/office.html)
* [Unofficial textbook notes](books.html)
{% endcomment %} 

# Course content

{% comment %} 
* [Course co-ordinator's introduction](materials/outline.pdf)
* [Introductory unit](intro.html)
* [Evolution by natural selection](ns.html)
* [Evolutionary processes](processes.html)
* [Speciation](speciation.html)
* [Phylogeny and the history of life](phylogeny.html)
* [Human evolution](humans.html)
{% endcomment %} 

{% comment %} 
Apparently not taught 2019?
* [Primate evolution](primates.html)
* [Hominin evolution](hominins.html)
HHE content units
* [The evolution of apes](apes.html)
* [Hominins](homo.html)
{% endcomment %} 

# Tests 

* [Practice questions](practice.html)
* [Midterm 1](midterm1.html)
* [Midterm 2](midterm2.html)

{% comment %} 
* [Final exam](final.html) 
{% endcomment %} 
