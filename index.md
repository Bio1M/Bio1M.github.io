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

{% comment %} 
* [Dushoff office hours](/office.html)
{% endcomment %} 

* [This course on Avenue](https://avenue.cllmcmaster.ca/d2l/home/251005)
* [About note-taking](http://www.vox.com/2014/6/4/5776804/note-taking-by-hand-versus-laptop)
* [Course outline](/materials/outline.pdf)
* [Classroom announcements](/announcements.html)

# Course content

* [Course co-ordinator's introduction](materials/tracey.pdf)
* [Introductory unit](intro.html)
* [Evolution by natural selection](ns.html)
{% comment %} 
* [Evolutionary processes](processes.html)
* [Speciation](speciation.html)
* [Phylogeny and the history of life](phylogeny.html)
* [The evolution of apes](apes.html)
* [Hominins](homo.html)

	intro.md
	ns.md
	processes.md
	speciation.md
	phylogeny.md
	apes.md
	homo.md
{% endcomment %} 

{% comment %} 
# Tests 

* [Practice questions](practice.html)
* [Midterm 1](midterm1.html)
* [Midterm 2](midterm2.html)
* [Final exam](final.html) 
practice.md
midterm1.md
{% endcomment %} 

{% comment %} 
# Policies

* [Tutorial policy](Tutorials.html)
* [Excuses for missed tests and missed work](Excuses.html)
* [Access to the course](Access.html)
* [Collaboration guidelines](Collaboration.html)
* [Regrades](Regrades.html)

# Links
* [This course on Avenue](https://avenue.cllmcmaster.ca/d2l/home/201446)
{% endcomment %} 
