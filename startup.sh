#!/bin/bash

dpkg-reconfigure -plow gpsd
gpsd /dev/ttyAMA0 -F /var/run/gpsd.sock -G -n
ntpd -gN
cgps
