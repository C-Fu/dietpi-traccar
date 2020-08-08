#!/bin/bash
apt install unzip rsync certbot python3-certbot-apache python-smbus i2c-tools
mkdir /root/traccar
cd /root/traccar
curl -L https://github.com/traccar/traccar/releases/download/v4.10/traccar-linux-arm-4.10.zip > traccar.zip
unzip traccar.zip
./traccar.run
systemctl start traccar