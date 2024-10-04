 ---
layout: post
title: Qwen2-VL-7B Local Hosting Bang for Buck
tags:
- ai
- llms
- vision llms
- Qwen
- handwritten text recognition
- digitisation
- mlx
- mlx-vlm
- Apple Silicon
---

Based on [these benchmarks for LLaMA 3](https://github.com/XiongjieDai/GPU-Benchmarks-on-LLM-Inference) local hosting and assuming that's roughly transferrable to performance using [Qwen2-VL-7B-Instruct](https://huggingface.co/Qwen/Qwen2-VL-7B-Instruct) I've done a quick run down of what things look like with price factored into the calculation, and focussed on Apple Silicon. I have left out all the esoteric NVIDIA hardware and stuck to things that should be easy to set up in a home lab. It's a bit rough, but it's to get my thoughts organised and convince not to do anything yet.

| GPU                        | 8B Q4_K_M | 8B F16 | Price    | Note    | $/t/s |
|----------------------------|-----------|--------|----------|---------|-------|
| 3070 8GB                   | 70.94     | OOM    | $500     | (s)     | 18    |
| 3080 10GB                  | 106.40    | OOM    | $700     | (s)     | 14    |
| 3080 Ti 12GB               | 106.71    | OOM    | $900     | (s)     | 16    |
| 4070 Ti 12GB               | 82.21     | OOM    | $1100    | (s)     | 23    |
| 4080 16GB                  | 106.22    | 40.29  | $1800    | (s)     | 24    |
| RTX 4000 Ada 20GB          | 58.59     | 20.85  | $2250    |         | 59    |
| 3090 24GB                  | 111.74    | 46.51  | $2000    | (s)     | 25    |
| 4090 24GB                  | 127.74    | 54.34  | $3000    |         | 30    |
| RTX 5000 Ada 32GB          | 89.87     | 32.67  | $7000    |         | 91    |
| 3090 24GB * 2              | 108.07    | 47.15  | $4000    | (s)     | 53    |
| 4090 24GB * 2              | 122.56    | 53.27  | $6000    |         | 59    |
| M1 7‑Core GPU 8GB          | 9.72      | OOM    | $600     | (s)     | 60    |
| M2 10‑Core GPU 8GB         | 13        | OOM    | $999     | (e)     | 123   |
| M2 10‑Core GPU 24GB        | 13        | 6.5    | $1599    | (e)     | 123   |
| M2 Pro 16‑Core GPU 32GB    | 19        | 10     | $2599    | (e)     | 136   |
| M2 Pro 19‑Core GPU 32GB    | 22        | 11     | $3049    | (e)     | 138   |
| M1 Max 32‑Core GPU 64GB    | 34.49     | 18.43  | $4000    | (s)     | 116   |
| M2 Max 38‑Core GPU 64GB    | 36        | 20     | $4200    | (e)     | 116   |
| M2 Ultra 76-Core GPU 192GB | 76.28     | 36.25  | $10500   |         | 138   |
| M2 Ultra 76-Core GPU 64GB  | 76.28     | 36.25  | $8100    |         | 106   |
| M2 Ultra 60-Core GPU 64GB  | 60        | 28     | $6600    | (e)     | 135   |
| M3 Max 40‑Core GPU 64GB    | 50.74     | 22.39  | $6650    |         | 131   |

Note:
(e) extrapolated from other results
(s) secondhand price

NVIDIA card prices do not include a supporting PC, I'm guessing one could be put together for $800-1600 but that's a pretty rubbery figure. All Apple Silicon prices are for the cheapest machine available with those specs, generally a Mac mini or Studio. 

