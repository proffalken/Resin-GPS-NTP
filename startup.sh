#!/bin/bash

ntpd -gN
gpsd /dev/ttyAMA0 -F /var/run/gpsd.sock -G -n -N
