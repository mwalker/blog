---
layout: post
title: 'Minolta DiMAGE Scan 5400 Notes: Part 1'
permalink: "/minolta-dimage-5400-notes-part-1"
date: '2023-09-03'
tags:
- film
- FireWire
- minolta
- scanner
- USB
- vuescan
---

Started playing with the three Minolta DiMAGE Scan 5400's I've managed to accumulate. These were all bought with only confirmation they powered up, but so far I am 3/3 working, woohoo!

If you manage to get the door stuck open, you need to use the reset tool to get it to close again before you can use the scanner again. This is outlined on page 22 of the [manual](https://www.konicaminoltasupport.com/index.php?id=4071&L=2%25%27%2F%2A%2A%2FaND%2F%2A%2A%2F%278%25%27%3D%273) (if you have any old Konica or Minolta digital gear that site is really useful, and kinda unexpected it is still running over fifteen years since selling their camera business to Sony, well done Konica Minolta!).

If you don't have or can't find your reset tool (it may be living under the front foot of the scanner, only one of my three still had it), then it is a metal pin like a paperclip and 25-30mm in length. You may have to poke around a little after inserting it to find the latch to release the door.

If you leave the door open you will get odd crashes and spinning beach balls from [VueScan](https://www.hamrick.com) when it tries to initialise the scanner, or it won't be able to complete the calibration step.

If you need a power supply it is 24V DC, minimum 1.5A, with a centre positive 4.8mm x 1.7mm barrel connector. I'm not sure where I got it, but an APD DA-48M24 has worked well for me, just a bit annoying as it needs a cloverleaf mains cable.

Using USB a full 5400dpi scan is taking just under 90s, with another 15s or so to complete saving (a TIFF and a JPEG). I need to test the FireWire port to see if it is any speedier.

