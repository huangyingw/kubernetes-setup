#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

# https://computingforgeeks.com/setup-glusterfs-storage-with-heketi-on-centos-server/

curl -s https://api.github.com/repos/heketi/heketi/releases/latest \
    | grep browser_download_url \
    | grep linux.amd64 \
    | cut -d '"' -f 4 \
    | wget -qi -nc -

for i in `ls | grep heketi | grep .tar.gz`; do tar xvf $i; done
cp heketi/{heketi,heketi-cli} /usr/local/bin
groupadd --system heketi
useradd -s /sbin/nologin --system -g heketi heketi
mkdir -p /var/lib/heketi /etc/heketi /var/log/heketi
cp heketi/heketi.json /etc/heketi
