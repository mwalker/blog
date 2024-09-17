---
layout: post
title: Using catcli and SQLite to process old backup disks
permalink: "/using-catcli-and-sqlite-to-process-old-backup-disks"
date: '2022-08-18'
description: In the distant past (2005-2009) I took a lot of photos of old documents as part of a personal digitisation effort. Because of a lack of personal storage much of the time these were organised in a simple hierarchy based on that of the archive and then groups were burned to DVD. These DVDs were also shared with others to get their copy, and sometimes I also received DVDs of images others had made, our organisational strategy were not necessarily the same. Anyway, I ended up with a few hundred DVDs with lots and lots of images on them, some unique to one DVD and others duplicated on two or more, and possibly organised in different ways.
tags:
- tools
- catcli
- SQLite
---

## Background [#](#background)

In the distant past (2005-2009) I took a lot of photos of old documents as part of a personal digitisation effort. Because of a lack of personal storage much of the time these were organised in a simple hierarchy based on that of the archive and then groups were burned to DVD. These DVDs were also shared with others to get their copy, and sometimes I also received DVDs of images others had made, our organisational strategy were not necessarily the same. Anyway, I ended up with a few hundred DVDs with lots and lots of images on them, some unique to one DVD and others duplicated on two or more, and possibly organised in different ways.

About five or six years ago I got a bit more organised and went through all the DVDs and copied the images off on to an external hard drive. I would occassionally clone this drive to another to keep with a friend as a backup, and I also had all the DVDs. I would also use the images sometimes when researching a topic, and transform them, primarily by rotation. As they are all JPEGs and I was not using special tools this is not a lossless operation.

During the early stages of the pandemic I decided I needed to store these images properly, so it was more available to me, and more resilient in the face of various risks. I purchased a [Synology DS220j](https://www.synology.com/products/DS220j), loaded it up with a couple of 3TB WD Red hard drives running as a mirror, and copied the data off the external drive onto it. I then setup regular backups to [Synology C2](https://c2.synology.com/) and to a local external USB hard drive.

Todya I'd like to get rid of all these DVDs as they are bulky, even when on spindles, unwieldy to actually use, and likely have a limited lifetime, especially as they have not been treated very well. However I'm hesitant about two things:

1. Have I actually retrieved all the files off these DVDs?
2. Have I transformed images on the disk in ways that have reduced their quality?

## My Solution [#](#my-solution)

There are a number of tools out there for duplicate file detection, which was the closest analogy I could see to what I wanted to do, I had a look at:

- [catcli](https://github.com/deadc0de6/catcli)
- [fclones](https://github.com/pkolaczk/fclones)
- [dupeGuru](https://github.com/arsenetar/dupeguru)
- [VisiPics](http://www.visipics.info/index.php?title=Main_Page)

There are probably others out there, if you know of a great one please let me know.

They all look like great tools, and I may revisit some of them in the future. For various reasons related to the workflow I wanted I settled on catcli.

First I indexed all the files on my NAS using catcli, making sure to create an md5 hash for each file, and then used the `tree` command of catcli to output the full list of files as a csv file:

    catcli index --catalog=nas.catalog --hash "nas" "<path to nas>"
    catcli tree --catalog=nas.catalog --format=csv --header > nas.csv

The indexing took a fair while, about 30-40 hours from memory, for about 936,000 files and 1.2TB. I did it a couple of times, it was quicker with a wired connection to the NAS, but only about 20-30% or so. Surprisingly fclones which prides itself on being really quick was not significantly faster, I guess the network and NAS latency are accounting for a lot of the time. I don't have a computer with fast local storage of the required size to test this at present.

I then created a fresh SQLite database, and loaded the csv into a new table:

    .mode csv
    .import nas.csv nas

This lets us explore the set of files, as preserved on the NAS. We can look for files that are already duplicated with a query like:

    select md5, count(*) as c from catcli group by md5 having c > 1 order by c asc;

From this I found one file with 259 copies, it was a `.DS_Store` file of about 6k which can safely be ignored. The second is 108 empty files, which warrant further investigation, as many of them are listed as JPEGs and were probably undetected failures when copying or moving files off DVD in the past.

Now we have all the data on the files for the NAS I can implement a similar process for each DVD, and then with some simple database queries print a list of files found on the DVD that we don't have on the NAS. I whipped up a short shell script to do that which has evolved to:

    #!/bin/sh
    
    DVD=$1
    
    if [-z "${DVD}"] || { [-n "$2"] && ["$2" != "--skip"]; }; then
      echo "Usage: load.sh <source_path> (--skip)"
      exit 1
    fi
    
    if [! -d "${DVD}"]; then
      echo "\"${DVD}\" is not a directory"
      exit 1
    fi
    
    if [-z "$2"]; then
      rm -f dvd.catalog dvd.csv
    
      catcli index --catalog dvd.catalog --hash "dvd" "${DVD}"
    
      catcli tree --catalog dvd.catalog --format=csv --header > dvd.csv
    fi
    
    IMPORT=`cat<<'HERE'
    drop table if exists 'dvd';
    .mode csv
    .import dvd.csv dvd
    HERE
    `
    
    echo "${IMPORT}" | sqlite3 catcli.sqlite3
    
    NAME_NOT_IN="name not in ('Thumbs.db', '.DS_Store', 'Desktop DB', 'Desktop DF')"
    
    DVD_COUNT=`sqlite3 catcli.sqlite3 "select count(distinct md5) from dvd where type = 'file' and ${NAME_NOT_IN};"`
    COUNT=`sqlite3 catcli.sqlite3 "select count (distinct md5) from nas where md5 in (select md5 from dvd where type = 'file' and ${NAME_NOT_IN});"`
    
    if [$DVD_COUNT -gt $COUNT]; then
      DIFF=`expr ${DVD_COUNT} - ${COUNT}`
      echo "There are ${DIFF} files on the DVD that are not in the main repo:"
      sqlite3 catcli.sqlite3 "select dvd.md5, dvd.maccess, dvd.size, dvd.path from dvd where dvd.type = 'file' and ${NAME_NOT_IN} and dvd.md5 not in (select distinct md5 from nas where md5 in (select md5 from dvd where type = 'file'));"
    else
      echo "Looks like we already have all the files, yay!"
    fi

After I insert DVD I just run this script, with an argument being the path to the mounted DVD. I added a second potential argument that I check for `--skip` which will re-run the load and query part without indexing the disk again, as that is the slow part, taking 8-10 minutes for a full DVD that is not having read issues.

The results of the query can then be used to decide what to do. Often this is just manual copies, but if I want to automatically copy only files that we don;t have I have a couple of shell snippets that I use. Because of the manual decision making required it has not proved worthwhile to automate them yet.

    ./load.sh /Volumes/<DVD name>/ --skip | cut -f 4 -d "|" | cut -f 2- -d "/" | grep "<pattern>" > cap
    rsync -av --files-from=cap /Volumes/<DVD name>/ ~/Downloads/<DVD name>/

Obviously the cap file can be edited as needed to contain the set of files that we want.

## Next Steps [#](#next-steps)

I have considered using additional external DVD drives that I have, but I would have to evolve the script somewhat, and I think the 10 minute cycle of a normal DVD is a nice background task that can be done while doing other work. I did consider just loading everything and then doing the de-duping and sorting in one big batch, but this way lets me do things in smaller chunks and feel a sense of achievement as each DVD goes in the recycling.

For those in Australia DVDs (and lots of other technology products) can be recycled through your local [Officeworks](https://www.officeworks.com.au) store.

