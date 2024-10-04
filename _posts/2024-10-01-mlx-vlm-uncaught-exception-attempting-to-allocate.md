---
layout: post
title: mlx-vlm uncaught exception attempting to allocate
tags:
- ai
- llms
- vision llms
- Qwen
- handwritten text recognition
- digitisation
- mlx
- mlx-vlm
---

A [followup post from Simon Willison on Qwen2VL](https://simonwillison.net/2024/Sep/29/mlx-vlm/) and using it with [mlx-vlm](https://github.com/Blaizzy/mlx-vlm) to run locally on Apple Silicon got me intrigued, as though I've been experimenting fairly successfully on Hugging Face I always seem to run out of quota at an inopportune time.

Using uv as described got it running fairly easily, just a bit of a wait for the weights to download. But every time I ran it I would get an error like:

```
libc++abi: terminating due to uncaught exception of type std::runtime_error: Attempting to allocate 96905199616 bytes which is greater than the maximum allowed buffer size of 17179869184 bytes.
```

After a fruitless process of quitting all other apps, disconnecting the external monitor, upgrading macOS, homebrew, and replacing homebrew python with uv python I eventually twigged with the help of [this thread](https://github.com/ml-explore/mlx-swift-examples/issues/106) that the problem might be with the size of the image I was using for testing, this is probably obvious, and should be obvious to me in light of my previous experiments in generating images. The cutoff for me on a 32GB M1 Max MacBook Pro is somewhere a little north of 2000 pixels on the long side of the image.

Now I'm waiting for the weights of Qwen2-VL-7B-Instruct to download to see if that will run, and if so what the limits on image size are, and what the speed is like. Hopefully I will then have something I can run on demand.

Update: Qwen2-VL-7B-Instruct does run, but it's fairly glacial at around 1t/s for the prompt and 2.5t/s for generation. That's somewhere around an order of magnitude slower than using Hugging Face spaces for me. It seems to top out at using around 26GB of RAM with a 2000 pixel image, so a 24GB Mac mini is not going to be enough for regular use.

With a 1000 pixel image those numbers become 20.5GB, around 5t/s for the prompt and 4t/s for the generation.

Thinking about a dedicated machine to run this on I came across this [nifty calculator](https://llm-calc.rayfernando.ai) and some [interesting benchmarks](https://github.com/XiongjieDai/GPU-Benchmarks-on-LLM-Inference). It seems Apple Silicon is always on the slower end, and the price jumps significantly once you want to get past 24GB of RAM, so maybe it's a not yet.
