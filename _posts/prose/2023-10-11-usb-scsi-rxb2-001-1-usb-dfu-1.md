---
layout: post
title: 'USB to SCSI: RXB2-001-1 / USB-DFU1'
permalink: "/usb-scsi-rxb2-001-1-usb-dfu-1"
date: '2023-10-11'
tags:
- SCSI
- USB
---

More digging around on [Yahoo Japan Auctions](https://auctions.yahoo.co.jp/) turned a board with the ID _RXB2-001-1_ that looked like it was a USB to SCSI adapter. As it was reasonably cheap I thought I would take a punt. When it arrived here it was fairly clear that is what it must be as one of the chips was stamped "adaptec".

I wanted to test it out with some original old SCSI drives from some old Macs but due to a number of issues I don't have them available yet, in anticipation of something in that direction however I have also purchased a [ZuluSCSI](https://zuluscsi.com) device, so I thought this thing may be a good thing to try.

Plugging it in initially to a computer using the USB B port on the board and nothing showed up, it also has a barrel socket, so I figured it must need that for power. On the board I purchased "5V" was written in texta on the back, and with both USB and SCSI it seemed very likely that this was the required voltage. There also didn't look to be anything on the board to change the voltage, and the built in molex connector only had the 5V wire connected. It was still an open question as to the polarity of the barrel connector, but some quick work with the trusty Uni-T multimeter buzzing out ground from the Molex to the outside of the barrel left me reassured it was centre positive like most I come across.

Once powered up using the 5V DC input a device called _USB-DFU1_ appeared on the USB bus, looking promising. The vendor ID is 0x04c8 which corresponds to Konica.

Now we disconnect everything and connect up the ZuluSCSI. Powering on again and we get some flashes from the LED connected to the board but not much else. I'd realise later that the LED on the ZuluSCSI should also be flashing when it is powered. At first I fiddled with the termination, and trying the debug DIP switch on the ZuluSCSI, but getting no debug file. Do some more reading, seems the board is not supplying termination power, so we need to power the ZuluSCSI separately, which we can do through it's USB port.

Connect all that up and power up again, flashes from the ZuluSCSI LED this time, and lo and behold the HFS volume I have set up on the ZuluSCSI is mounted on my Snow Leopard MacBook Pro, success.

Because the board has a couple of fly leads for connection to a power switch, and I don't have any blades avaialable for the spade connectors I connected by using the multimeter in current mode. Without load it draws about 150-160 mA. As mentioned it can also power the drive but I did not test that as I was using the ZuluSCSI.

Doing research I found a couple of references on the web to this board in Japanese from [nana1451](http://nana1451.web.fc2.com/omd.html) and [ひばり さん](http://weblabo.griffonworks.net/dorlog/2nddorcom/pcat/26077.html), it seems likely it was originally incorporated in a product for a USB connected MO (Magneto-Optical) drive, which were very popular in Japan. Most USB MO drives I have seen come with an external adapter in a cable, usually based on the Shuttle Technologies chip.

