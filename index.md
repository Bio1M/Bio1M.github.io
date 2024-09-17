---
layout: page
title: Main page
---

{% comment %} 

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
{% endcomment %} 

{% comment %} 
# Course information

* [This course on Avenue](https://avenue.cllmcmaster.ca/d2l/home/412000)
* [Class Teams team](https://teams.microsoft.com/l/team/19%3aabqC9ao2ShWYbTbQeLP8RRHnyxcB4aNF9vLL9S4OUbA1%40thread.tacv2/conversations?groupId=8fcfe17f-757c-4740-9b51-ac5be14bc8a9&tenantId=44376307-b429-42ad-8c25-28cd496f4772)
* [About note-taking](http://www.vox.com/2014/6/4/5776804/note-taking-by-hand-versus-laptop)
* [Dushoff office hours](/office.html)
* [Unofficial textbook notes](books.html)
* [Thoughts on Teams lectures](teams.html)

* [Classroom announcements policy](/announcements.html)
* [Course outline](/materials/outline.pdf)
{% endcomment %} 

{% comment %} 
# Course content

* [Course co-ordinator's introduction](materials/outline.pdf)
* [Introductory unit](intro.html)
* [Evolution by natural selection](ns.html)
* [Evolutionary processes](processes.html)
* [Speciation](speciation.html)
* [Phylogeny and the history of life](phylogeny.html)
* [Human evolution](humans.html)
{% endcomment %} 

{% comment %} 
2018 version, compressed for time into humans
* [Primate evolution](primates.html)
* [Hominin evolution](hominins.html)
HHE content units
* [The evolution of apes](apes.html)
* [Hominins](homo.html)
{% endcomment %} 

* [Practice questions](practice.html)

{% comment %} 
# Tests 

* [General info](tests.html)
* [Midterm 1](midterm1.html)
* [Midterm 2](midterm2.html)

* [Final exam](final.html) 
{% endcomment %} 
