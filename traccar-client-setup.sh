#!/bin/bash
apt install unzip rsync certbot python3-certbot-apache python-smbus i2c-tools
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
nano /etc/rc.local
echo ds1307 0x68 > /sys/class/i2c-adapter/i2c-1/new_device
hwclock -s
date

exit 0
