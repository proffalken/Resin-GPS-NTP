#!/bin/bash

cat /etc/default/gpsd
gpsd /dev/ttyAMA0 -F /var/run/gpsd.sock
cgps -s
