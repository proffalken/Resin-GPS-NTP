# Resin GPS NTP Server

An NTP Time Server running on a Raspberry Pi Zero (original model!) using a [U-BLOX
GPS device](https://www.ebay.co.uk/i/272262507972) to set the NTPD for the local network.

## Why?

A very good question.  I wanted to play with Resin.io, GPIO on the PiZero, and
GPS for a project I'm currently working on, this was the end result.

## How?

First of all, create a new project in the
[Resin.io Dashboard](https://dashboard.resin.io/) and configure it to use a
RaspberryPi/PiZero.

Download the application image from Resin and use [Etcher](https://etcher.io/)
to burn it to an SD card.

Clone this git repo to your computer and run the `git remote add resin ...`
command in the top-right corner of the dashboard.

Push the code to Resin using `git push resin master`

Now connect the UBLOX GPS device to the pi as follows, based on [this
diagram](https://pinout.xyz/):

| GPIO Pin | UBLOX Pin |
|----------|-----------|
| GPIO 2 (+5v) | +5v |
| GPIO 6 (GND) | GND |
| GPIO 8 (TXD) | RXD |
| GPIO 10 (RXD) | TXD |

Power up the Pi, and wait for it to download and install the application.

Get the IP of the device from the dashboard and run the following command to
confirm that NTP is listening:

```bash
ntpq -p <IP ADDRESS GOES HERE>
```

You should see something similar to the following:

```bash
[mmw@gaiman ~]$ ntpq -p 192.168.1.3
     remote           refid      st t when poll reach   delay   offset  jitter
==============================================================================
+x.ns.gin.ntt.ne 249.224.99.213   2 u  132   64  356   39.942   -1.176  40.670
*ntp0.cis.strath 193.62.22.90     2 u   61   64  373   37.797  -12.129  21.619
+y.ns.gin.ntt.ne 249.224.99.213   2 u   61   64  357   26.930  -11.853  22.629
+sundown.speedwe 87.242.168.84    2 u   62   64  377   25.219  -14.676  21.191
xSHM(0)          .GPS.            0 l   78   64  377    0.000  -143.98  27.987
 SHM(1)          .PPS.            0 l    -   64    0    0.000    0.000   0.000
```

Leave the device running for several hours (overnight if possible!) and the
offset should calm down and provide you with an NTP server on your local
network that uses the UBLOX GPS reciever as one of the sources!
