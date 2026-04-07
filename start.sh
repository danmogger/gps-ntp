#!/bin/sh

gpsd ${DEVICE} -n -b -r -F /var/run/gpsd.sock -P /run/gpsd/gpsd.pid -G

ntpd -n -d -g -p /var/run/ntpd.pid -g

