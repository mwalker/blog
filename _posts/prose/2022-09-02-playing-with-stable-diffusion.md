---
layout: post
title: Playing with stable diffusion
permalink: "/playing-with-stable-diffusion"
date: '2022-09-02'
tags:
- stable-diffusion
- ai
- art
---

I've noticed a fair bit of AI generated artwork over the last few months, and in the past week some called Stable Diffusion, which open source and can be run locally has been popular. Then I saw this [blog post from Replicate](https://replicate.com/blog/run-stable-diffusion-on-m1-mac) on how to get it running locally on an M1 Mac, which I happen to have. As a break from [extracting data from old backup DVDs](/using-catcli-and-sqlite-to-process-old-backup-disks) I thought I would have a play.

I followed the instructions in that post, including signing up on [Hugging Face](https://huggingface.co/) to get access to download the model. My first generations were pretty crap, it took me until attempt 45 to get something I kind of liked.

#### 00045 – artificial cow, neon, sigma 35mm [#](#00045--artificial-cow-neon-sigma-35mm)

![artificial cow, neon, sigma 35mm](https://live.staticflickr.com/65535/52330443030_505ec6b3ee_o.png)

by [gunzel](https://www.flickr.com/photos/35237091718@N01/), on [Flickr](https://www.flickr.com/photos/35237091718@N01/52330443030/in/dateposted-public/)

It takes about a minute per generation on a MacBook Pro with the M1 Max and a 24 core GPU. Occasionally things crash, a bit more often it detects possible NSFW in the output and rick-rolls me. I haven't been able to work out how to make the images larger, any change from the defaults as listed in the blog post seems to result in crashing.

More to come tomorrow.

