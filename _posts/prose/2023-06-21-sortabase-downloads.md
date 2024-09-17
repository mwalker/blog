---
layout: post
title: Sortabase Downloads
permalink: "/sortabase-downloads"
date: '2023-06-21'
tags:
- sortabase
---

In my [previous post about Book Scanners and Sortabase](/book-scanners-and-sortabase) I mentioned it would be nice if I could download my data, I sent my feedback to [Sortabase](https://www.sortabase.com/) and they have just replied that this feature is now live (I suspect it must have been in the works) and is available for everyone on all databases.

From their instructions:

> 1. Go to any database
> 2. Click the "..." button on the right side of the header at the top of the page
> 3. Click "Convert to CSV file"
> 4. Click the download button that should pop up

I'm not sure I'm so keen on the two step process to get the download, it wasn't entirely obvious to me, but it's great to see that this data is unlocked for all. And the download file is even named sensibly which often seems to be overlooked for these sorts of implementations.

You can try it out on my [BookScanners database on Sortabase](https://www.sortabase.com/BookScanners). As of now the data looks like:

    "Title","Description","Price","Brand","Optical Resolution","Platen","Type","Sensor Type","Edge distance","Notes"
    "Zeutschel zeta","","14000","Zeutschel","300","A3","Overhead","CCD","0","600dpi optional"
    "Czur Shine Ultra Pro","","250","Czur","320","A3","Camera","CMOS","0","440dpi possible for A4"
    "Czur ET16 Plus","","420","Czur","250","A3","Camera","CMOS","0",""
    "Czur ET18 Pro","","475","Czur","275","A3","Camera","CMOS","0",""
    "IRIScan Desk 6 Pro","","440","IRIS","250","A3","Camera","CMOS","0","Claims 300dpi but that is extrapolated."
    "Plustek OpticBook 3800L","","420","Plustek","1200","A4","Flatbed","CCD","6",""
    "Plustek OpticBook A300 Plus","","1670","Plustek","600","A3","Flatbed","CCD","2",""
    "Avision FB6280e","","1100","Avision","600","A3","Flatbed","CCD","2",""
    "Czur ET24 Pro","","700","Czur","320","A3","Camera","CMOS","0",""
    "Fujitsu SV600","","675","Fujitsu","250","A3","Overhead","CCD","0","Resolution is approximate, the spec sheet lists it as 218-285 dpi horizontal and 152-283 dpi vertical (due to the differing angles of scanning over the page)."
    "Plustek OpticBook 4900","","630","Plustek","1200","A4","Flatbed","CCD","2","The OpticBook 4800 still seems to be available in some markets and is apparently the same scanner but with cold cathode fluorescent lights instead of LED."
    "Avision FB2280e","","380","Avision","600","A4","Flatbed","CCD","2",""

