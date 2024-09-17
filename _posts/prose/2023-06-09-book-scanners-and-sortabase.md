---
layout: post
title: Book scanners and Sortabase
permalink: "/book-scanners-and-sortabase"
date: '2023-06-09'
tags:
- scanners
- scanning
- sortabase
---

I have a fair bit of printed material I would like to make digital, for a combination of storage, sharing and analysis reasons. I also like analysing the tools available and collecting gear.

A reasonable amount of this material are books and magazines, which are a challenge to scan on a normal flatbed scanner because of the binding. A number of companies have built products aiming at this space. There are three man approaches that have been taken:

### Book-edge flatbed scanners [#](#book-edge-flatbed-scanners)

A flatbed scanner with one edge where the scan is very close to the edge of the platen, and the edge of the platen is located on the edge of the device, allowing the bound material to only need to be opened to 90-120º and the scan to get a long way into the gutter.

### Overhead scanners [#](#overhead-scanners)

A line scan head is fitted in a stand and the book is laid flat below, the scan head and associated lighting rig is rotated across the scan area.

### Overhead cameras [#](#overhead-cameras)

Similar to the overhead scanner but a fixed digital camera is used instead of a rotating line scan head. The more sophisticated units may use two cameras, each mounted at the optimal angle for its corresponding page.

While looking at all the different options in this space I started recording the most important specs for me in a little CSV file with the intention of doing something nice with it and perhaps exposing it to the world (anything to not have to start scanning :).

    Brand,Name,DPI,Platen,Sensor,Edge,Price,Link
    Plustek,OpticBook 3800L,1200,A4,CCD,6mm,USD420,https://plustek.com/us/products/flatbed-scanners/opticbook-3800l/spec.php
    Plustek,OpticBook 4800,1200,A4,CCD,2mm,USD630,https://plustek.com/us/products/book-scanners/opticbook-4800/spec.php
    Plustek,OpticBook 4900,1200,A4,CCD,2mm,USD630,https://plustek.com/us/products/book-scanners/opticbook-4900/spec.php
    Avision,FB2280E,600,A4,CCD,2mm,AUD560,https://www.avision.com/en/shop/flatbed-scanner/fb2280e/
    Avision,FB6280E,600,A3,CCD,2mm,AUD1625,https://www.avision.com/en/shop/flatbed-scanner/fb6280e/
    Plustek,OpticBook A300 Plus,600,A3,CCD,2mm,USD1670,https://plustek.com/us/products/book-scanners/opticbook-a300-plus/spec.php
    Czur,ET24 Pro,320,A3,CMOS,0mm,USD700,https://www.czur.com/product/ETscanner
    Fujitsu,SV600,250,A3,CCD,0mm,USD675,https://www.fujitsu.com/au/products/computing/peripheral/scanners/soho/sv600/

At some point during my procrastination I came across [Sortabase](https://www.sortabase.com/) from the [Sortabase Show HN Post](https://news.ycombinator.com/item?id=35951126) on Hacker News. It seemed like a really good tool for what I was trying to achieve.

Twenty five days later I've managed to actually do it and create the [BookScanners database on Sortabase](https://www.sortabase.com/BookScanners), I was really impressed with how it worked, and I'll probably use it for future comparisons.

Looking at the [Sortabase blog](https://www.sortabase.com/Sortablog) it's really just another database, to keep up to date I went to subscribe to the feed, but because it's a database it doesn't have one. I think a feed on the database would be great. I also couldn't find a way to download my data, it would be nice not to have all my work locked up in their system. Maybe I can use some JavaScript on the bulk editing screen, but I think it should be easy for users to get the data they gathered out.

