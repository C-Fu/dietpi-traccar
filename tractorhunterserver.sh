#!/bin/sh

echo "#//////////////////////////////////////#"
echo "#/     Setting up Portainer           /#"
echo "#/     http://$HOSTNAME.local:9000    /#"
echo "#//////////////////////////////////////#"
mkdir /root/portainer
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /root/portainer:/data portainer/portainer-ce

echo "#//////////////////////////////////////#"
echo "#/     Setting up NextCloudPi         /#"
echo "#/     http://$HOSTNAME.local:4443    /#"
echo "#/     http://$HOSTNAME.local         /#"
echo "#/     https://$HOSTNAME.local        /#"
echo "#//////////////////////////////////////#"
mkdir /mnt/dietpi_userdata/nextcloudpi
docker run -d -p 4443:4443 -p 443:443 -p 80:80 -v /mnt/dietpi_userdata/nextcloud:/data --name nextcloudpi ownyourbits/nextcloudpi $DOMAIN

# Refresh
apt update

echo "#//////////////////////////////////////#"
echo "#/     Setting up Traccar             /#"
echo "#/     http://$HOSTNAME.local:8082    /#"
echo "#//////////////////////////////////////#"
mkdir /root/traccar_setup
cd /root/traccar_setup
wget https://github.com/traccar/traccar/releases/download/v4.10/traccar-linux-arm-4.10.zip
unzip traccar-linux-arm-4.10.zip
./traccar.run

exit 0
