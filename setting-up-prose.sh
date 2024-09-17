<!doctype html>
<html lang="en-AU">
  <head>
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Further Notes… on Setting up prose.sh</title>
<meta name="description" content="" />
<!-- link rel="stylesheet" href="https://cdn.simplecss.org/simple.css" -->
<link rel="stylesheet" href="/assets/css/style.css">

<link rel="icon" href="/assets/images/favicon.png" />
<link rel="apple-touch-icon" href="/assets/images/favicon.png">

<link rel="canonical" href="/setting-up-prose.sh">
<link rel="alternate" type="application/rss+xml" title="Further Notes…" href="/feed.xml">
  </head>
  <body>

    <header>
      <nav>
  <a href="/">Further Notes…</a>
  
  <a href="/tags" >tags</a>
  
  <a href="https://pinboard.in/u:gunzel" >links</a>
  
  <a href="https://www.librarything.com/profile/gunzel" >library</a>
  
  <a href="https://github.com/mwalker" >code</a>
  
  <a href="/feed.xml" >rss</a>
  
</nav>

      <h1>Setting up prose.sh</h1>
    </header>

    <main>

      <p class="meta">Posted on 16 Aug 2022</p>

<p>I needed a low effort blogging platform as a way to keep and share notes and I came across <a href="https://prose.sh/">prose.sh</a>. These are some notes on the set up that I did.</p>

<p>Create a new ssh keypair (prose doesn’t yet support SHA-2 keys):</p>

<div class="language-plaintext highlighter-rouge"><div class="highlight"><pre class="highlight"><code>ssh-keygen -t ed25519 -C "your_email@example.com"
</code></pre></div></div>

<p>Set up the <code class="language-plaintext highlighter-rouge">~/.ssh/config</code> file to use this keypair for prose.sh:</p>

<div class="language-plaintext highlighter-rouge"><div class="highlight"><pre class="highlight"><code># prose.sh
Host prose.sh
IdentityFile /Users/&lt;username&gt;/.ssh/id_ed25519
IdentitiesOnly yes
</code></pre></div></div>

<p>Connect to prose.sh as the user new and set up your account:</p>

<div class="language-plaintext highlighter-rouge"><div class="highlight"><pre class="highlight"><code>ssh new@prose.sh
</code></pre></div></div>

<p>Add the username you created into the <code class="language-plaintext highlighter-rouge">~/.ssh/config</code> file:</p>

<div class="language-plaintext highlighter-rouge"><div class="highlight"><pre class="highlight"><code># prose.sh
Host prose.sh
User &lt;username&gt;
IdentityFile /Users/&lt;username&gt;/.ssh/id_ed25519
IdentitiesOnly yes
</code></pre></div></div>

<p>I wanted to use a custom domain so I followed the <a href="https://prose.sh/help#custom-domain">instructions on the help page</a>.</p>

<p>This will be my first post, so we’ll see how it goes, but so far thet setup has been pretty easy.</p>

<p>PS. It all worked! Publishing was as simple as <code class="language-plaintext highlighter-rouge">scp setting-up-prose.sh.md prose.sh:</code></p>

<p>I will probably dump the source files into a new git repository at some point.</p>



<hr />

<p class="meta"><a href="/tag/blog-software/">#blog&nbsp;software</a> <a href="/tag/ssh/">#ssh</a> <a href="/tag/tools/">#tools</a> </p>


    </main>

    <footer>
      <p>Copyright © 1990-2024 Matthew Walker.</p>
    </footer>

  </body>
</html>
