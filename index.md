---
layout: base
pagination:
  enabled: true
title: Further Notes…
---

{% for post in paginator.posts %}
  <div class="blog-item">
    <p class="meta">{{ post.date | date_to_string }}</p>
    <a class="post-link" href="{{ post.url }}">{{ post.title }}</a>
    <p class="meta"><i>{% if post.description %}{{ post.description }}{% else %}{{ post.excerpt }}{% endif %}</i></p>
    <p class="meta">{% for tag in post.tags %}<a href="/tag/{{ tag | slugify }}/">{{ tag | replace: " ", "&nbsp;" }}</a> {% endfor %}</p>
  </div>
{% endfor %}

{% if paginator.page_trail %}
  <ul class="page-trail">
  {% for trail in paginator.page_trail %}
    <li>
      {% if page.url == trail.path %}
        {{ trail.num }}
      {% else %}
        <a href="{{ trail.path | prepend: site.baseurl }}" title="{{trail.title}}">{{ trail.num }}</a>
      {% endif %}
    </li>
  {% endfor %}
  </ul>
{% endif %}
