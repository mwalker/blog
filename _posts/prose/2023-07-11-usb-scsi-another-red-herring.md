---
layout: post
title: 'USB to SCSI: another red herring'
permalink: "/usb-scsi-another-red-herring"
date: '2023-07-11'
tags:
- SCSI
- USB
- IDE
---

Digging around on [Yahoo Japan Auctions](https://auctions.yahoo.co.jp/) I came across the [Logitec](https://www.logitec.co.jp/) (yes, no "h" it's not the one you are thinking of) [LCW-T1210BSU](https://www.mac-paradise.com/htmls/4992072117051-1.html) an intriguing looking CD-RW unit that supports both SCSI and USB. [This particular auction](https://page.auctions.yahoo.co.jp/jp/auction/t1088610088) was for a pair of them and did not seem to be evincing much interest, but was priced a lot less than the straight out adapters. Thinking this could be a way to get some adapters cheap I set out to do a bit more research.

Thankfully Logitec still have a [drivers page for the LCW-T1210BSU](https://www.logitec.co.jp/down/soft/cdr/lcwt1210bsu.html) online, and poking around on that it seems the CD-RW drive is actually a [TEAC CD-W512EB], which is an IDE drive so it seems this Logitec case must have both a USB to IDE and a SCSI to IDE adapter within it. Considering that modern USB to IDE apapters are very cheap I think it would only be useful for someone who needs a SCSI to IDE adapter, and it seems like it might be fairly custom, so no luck for me but perhaps useful to someone.

