#!/bin/bash
apt install -y unzip rsync certbot python3-certbot-apache python-smbus i2c-tools
mkdir /root/recordings #local save
mkdir /mnt/recordings #sync folder
mkdir /root/gps #local save


#Setup clock first
modprobe rtc-ds1307

echo "hwclock time:"
echo hwclock -r
echo "Setting the correct time from network..."
hwclock -w
#Load clock on boot
echo "snd-bcm2835" >> /etc/modules
echo "i2c-bcm2835" >> /etc/modules
echo "i2c-dev" >> /etc/modules
echo "rtc-ds1307" >> /etc/modules

#add to rc.local
touch /etc/rc.local
echo "echo ds1307 0x68 > /sys/class/i2c-adapter/i2c-1/new_device" > /etc/rc.local
echo "hwclock -s" > /etc/rc.local
echo "date" > /etc/rc.local

#setup sq11
apt install -y fswebcam v4l-utils
modprobe uvcvideo -r
modprobe uvcvideo quirks=2
echo "options uvcvideo quirks=2" > /etc/modprobe.d/uvcvideo.conf
#add module(s)
echo "bcm2835-v4l2" >> /etc/modules




exit 0
