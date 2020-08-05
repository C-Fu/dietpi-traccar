#!/bin/bash
mkdir /root/traccar
cd /root/traccar
curl https://github.com/traccar/traccar/releases/download/v4.10/traccar-linux-arm-4.10.zip
unzip traccar-linux-arm-4.10.zip
./traccar.run
systemctl start traccar
