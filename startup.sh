#!/bin/bash

gpsmon /dev/ttyAMA0
gpsd /dev/ttyAMA0 -F /var/run/gpsd.sock
cgps -s
