---
layout: base
title: Further Notes…
---

{% for post in page.posts %}
  <div class="blog-item">
    <p class="meta">{{ post.date | date_to_string }}</p>
    <a class="post-link" href="{{ post.url }}">{{ post.title }}</a>
    <p class="meta"><i>{% if post.description %}{{ post.description }}{% else %}{{ post.excerpt }}{% endif %}</i></p>
    <p class="meta">{% for tag in post.tags %}<a href="/tag/{{ tag | slugify }}/">#{{ tag | replace: " ", "&nbsp;" }}</a> {% endfor %}</p>
  </div>
{% endfor %}
