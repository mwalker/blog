---
layout: post
title: Openstick
permalink: "/openstick"
date: '2022-09-01'
tags:
- openstick
- linux
- home-servers
---

I came across the OpenStick in [Issue 1664](http://archive.thesizzle.com.au/issue_1664.html) (public archive may not be live yet) of [The Sizzle](https://thesizzle.com.au), a great Aussie tech newsletter I subscribe to, and it piqued my interest. The idea of a $20 USB powered Linux computer with WiFi and 4G, appealed, especially with the Raspberry Pi being so hard to get at the moment.A

I had a read of the linked article at [Hackaday](https://hackaday.com/2022/08/03/hackable-20-modem-combines-lte-and-pi-zero-w2-power/) and was sold. After digging around on eBay [this](https://www.ebay.com.au/itm/374198016406) seemed to be the lowest price one in Australia with the MSM8916 chipset needed (there are lookalikes that use an older MDM9600 chipset which does not work). It arrived a week or so later, but it does not have the memory card slot that is apparently available on some.

I basically folled the [instructions from extrowerk](https://extrowerk.com/2022/07/31/OpenStick/) on an old ubuntu laptop I had lying around, but I did need to fiddle with the udev files in order to make the device accessible to adb. First I tried installing `android-sdk-platform-tools-common` but this wasn;t enough, I also had to put the following content into `/etc/udev/rules.d/51-openstick.rules`:

    # Skip this section below if this device is not connected by USB
    SUBSYSTEM!="usb", GOTO="openstick_usb_rules_end"
    
    # Devices listed here in openstick_usb_rules_{begin...end} are connected by USB
    LABEL="openstick_usb_rules_begin"
    
    #Qualcomm
    SUBSYSTEM=="usb", ATTR{idVendor}=="05c6", ATTR{idProduct}=="9024", ENV{adb_user}="yes"
    SUBSYSTEM=="usb", ATTR{idVendor}=="05c6", ATTR{idProduct}=="9091", ENV{adb_user}="yes"
    
    # Enable device as a user device if found
    ENV{adb_user}=="yes", MODE="0660", GROUP="plugdev", TAG+="uaccess"
    
    LABEL="openstick_usb_rules_end"

Once I had done that I also needed to reload the rules:

    sudo udevadm control --reload

Since I've had it up and running I've found it a bit unstable (ssh connections drop and can't be re-established for a while, then come good again). I haven't done any serious troubleshooting to see if I can work out why.

### Links [#](#links)

[OpenStick Releases](https://github.com/OpenStick/OpenStick/releases)[Interesting info from "jgray" who has pulled one apart](https://www.zianet.com/jgray/openstick/)

