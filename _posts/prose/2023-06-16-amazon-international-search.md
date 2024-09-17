---
layout: post
title: Amazon International Search
permalink: "/amazon-international-search"
date: '2023-06-16'
description: Amazon JP items (not everything, especially not DVD and BluRay) are now available through Amazon AU with Prime shipping, but it can be hard to search for what you want, thanks to a comment from ohdear on OzBargain there is a way to set up a nifty form to search the overseas Amazon of your choice, in my case Japan.
tags:
- amazon
---

## Search Amazon JP via Amazon AU [#](#search-amazon-jp-via-amazon-au)

Amazon JP items (not everything, especially not DVD and BluRay) are now available through Amazon AU with Prime shipping, but it can be hard to search for what you want, thanks to [a comment from ohdear on OzBargain](https://www.ozbargain.com.au/node/780346) there is a way to set up a nifty form to search the overseas Amazon of your choice, in my case Japan.

Try it:

<form action="http://www.amazon.com.au/gp/search" method="get">
  <input type="text" name="k" value="" />
  <input type="hidden" name="rh" value="p_6:A2K69GP4EI3XWZ" />
  <input type="submit" value="Search" />
</form>

If you want to embed it somewhere else the code looks like:

``` html
<form action="http://www.amazon.com.au/gp/search" method="get">
  <input type="text" name="k" value="" />
  <input type="hidden" name="rh" value="p_6:A2K69GP4EI3XWZ" />
  <input type="submit" value="Search" />
</form>
```

There's more in ohdear's comment about other Amazons, and multiple Amazons at once.

