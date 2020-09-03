#!/bin/sh
mkdir /root/portainer
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /root/portainer:/data portainer/portainer-ce

mkdir /mnt/dietpi_userdata/nextcloudpi

docker run -d -p 4443:4443 -p 443:443 -p 80:80 -v /mnt/dietpi_userdata/nextcloud:/data --name nextcloudpi ownyourbits/nextcloudpi $DOMAIN



exit 0
