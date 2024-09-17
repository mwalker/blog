---
layout: post
title: Transitioning from prose.sh to jekyll
tags:
- prose.sh
- jekyll
- blog software
- tools
---

While I liked [prose.sh](https://prose.sh) as a blog provider I have found that the workflow doesn't quite suit me. I would prefer something less magical and a bit more [boring](https://boringtechnology.club). As the basis of [Github Pages](https://pages.github.com) and written in ruby, a language I keep coming back to, I decided that [jekyll](https://jekyllrb.com) qualified for me.

There's no way to extract the raw blog posts from prose.sh without asking them, thanksully jekyll has a fairly well developed import plugin, and I was able to crib from the existing one for tumblr to create a simple one for prose.sh posts retrieved by spidering the site. I could use the "permalink" configuaration item in the frontmatter in order to keep the old URL structure for each post.

Setting up jekyll it seems like the github-pages version is a bit behind the latest, and I wasn't sure I wanted to get too locked into github either, so I went with the current latest, jekyll 4.3.3. I struggled to find a them that I liked so I ended up doing my own, heavily cribbed from [no style please](https://riggraz.dev/no-style-please/) and [Jekyll Simple.css Template](https://github.com/kevquirk/jekyll-simplecss-template).

I also made use of the [Jekyll::Paginate V2](https://github.com/sverrirs/jekyll-paginate-v2) plugin in order to paginate the posts so the front page doesn't get unwieldy, and then discovered with its [AutoPages](https://github.com/sverrirs/jekyll-paginate-v2/blob/master/README-AUTOPAGES.md) feature it can also generate pages for each tag (and potentially category). To get them to sort nicely I had to install the [jekyll_sort_natural](https://github.com/mslinn/jekyll_sort_natural) plugin, because the liquid sort_natural doesn't work for reasons I can't quite fathom.


