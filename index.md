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

# [Older updates](updates.html)
{% comment %} 
{% endcomment %} 

# Course information

{% comment %} 
{% endcomment %} 

* [This course on Avenue](https://avenue.cllmcmaster.ca/d2l/home/213068)
* [Dushoff office hours](/office.html)
* [Facebook group](https://www.facebook.com/groups/103090283767508/)
* [About note-taking](http://www.vox.com/2014/6/4/5776804/note-taking-by-hand-versus-laptop)
* [Announcements](/announcements.html)

# Course content

* [Introductory unit](intro.html)
* [Evolution by natural selection](ns.html)
* [Evolutionary processes](processes.html)
* [Speciation](speciation.html)
* [Phylogeny and the history of life](phylogeny.html)
* [The evolution of apes](apes.html)

{% comment %} 
	intro.md
	ns.md
	processes.md
	speciation.md
	phylogeny.md
	apes.md
{% endcomment %} 

{% comment %} 
# Tests and assignments
* [Assignments](assignments.html)
* [Midterm 1](midterm1.html)
* [Midterm 2](midterm2.html)
* [Final exam](final.html)
{% endcomment %} 

{% comment %} 
assignments.md
midterm1.md
midterm2.md
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
* [Facebook group](https://www.facebook.com/groups/681998368640256/)
{% endcomment %} 
