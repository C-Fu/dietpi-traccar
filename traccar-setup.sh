#!/bin/bash
apt install -y unzip rsync certbot python-smbus i2c-tools
mkdir /root/traccar
cd /root/traccar
curl -L https://github.com/traccar/traccar/releases/download/v4.10/traccar-linux-arm-4.10.zip > traccar.zip
unzip traccar.zip
./traccar.run
systemctl start traccar
systemctl enable traccar
