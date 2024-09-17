---
layout: post
title: Setting up prose.sh
permalink: "/setting-up-prose.sh"
date: '2022-08-16'
tags:
- blog software
- ssh
- tools
---

I needed a low effort blogging platform as a way to keep and share notes and I came across [prose.sh](https://prose.sh/). These are some notes on the set up that I did.

Create a new ssh keypair (prose doesn't yet support SHA-2 keys):

    ssh-keygen -t ed25519 -C "your_email@example.com"

Set up the `~/.ssh/config` file to use this keypair for prose.sh:

    # prose.sh
    Host prose.sh
    IdentityFile /Users/<username>/.ssh/id_ed25519
    IdentitiesOnly yes

Connect to prose.sh as the user new and set up your account:

    ssh new@prose.sh

Add the username you created into the `~/.ssh/config` file:

    # prose.sh
    Host prose.sh
    User <username>
    IdentityFile /Users/<username>/.ssh/id_ed25519
    IdentitiesOnly yes

I wanted to use a custom domain so I followed the [instructions on the help page](https://prose.sh/help#custom-domain).

This will be my first post, so we'll see how it goes, but so far thet setup has been pretty easy.

PS. It all worked! Publishing was as simple as `scp setting-up-prose.sh.md prose.sh:`

I will probably dump the source files into a new git repository at some point.

