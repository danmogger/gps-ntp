#!/bin/sh

if [ ! -z "$DEVICE" ]; then
gpsd ${DEVICE} -n -F /var/run/gpsd.sock -P /run/gpsd/gpsd.pid -G
else
#gpsd -n -F /var/run/gpsd.sock -P /run/gpsd/gpsd.pid -G
gpsd start
fi
#service gpsd start

ntpd -n -p /var/run/ntpd.pid -g

exit 0
