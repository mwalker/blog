---
layout: post
title: Playing with docquery
permalink: "/playing-with-docquery"
date: '2022-09-03'
tags:
- docquery
- ai
- ocr
---

I seem to be on an AI kick lately. I came across [DocQuery](https://www.impira.com/blog/hey-machine-whats-my-invoice-total), an open source AI tool for asking questions about documents. I thought I'd give it a go.

The instructions in the github repo worked fine, although if you're doing other AI stuff I think it is worth setting up a virtualenv for it to livein:

    python3 -m virtualenv venv
    source venv/bin/activate

I also found I needed to install poppler via homebrew as various python librarries rely on some of popplers utils (and poppler specifically, xpdf is not enough):

    brew install poppler

Running queries on modern documents it was pretty good, although it did struggle to understand GST. When I used some historical documents it struggled, partly I think because of a difficult OCR problem, and partly that the structure of the ones I tried differs from the modern kind of business document.

The integration with [Donut](https://arxiv.org/abs/2111.15664) looks very interesting, but I struggled to get it to work due to dependency issues. I suspect I need to set up containers or VMs to run this stuff in so system level libraries can be isolated as well.

Definitely something to keep an eye on.

