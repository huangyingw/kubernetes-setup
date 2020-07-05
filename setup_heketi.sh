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
for i in dm_snapshot dm_mirror dm_thin_pool; do
  modprobe $i
done
ssh-keygen -f /etc/heketi/heketi_key -t rsa -N ''
chown heketi:heketi /etc/heketi/heketi_key*

for i in 10.1.10.95; do
  ssh-copy-id -i /etc/heketi/heketi_key.pub root@$i
done
/usr/bin/ssh -i /etc/heketi/heketi_key root@10.1.10.95
cp -v heketi.service /etc/systemd/system/heketi.service
wget -O -nc /etc/heketi/heketi.env https://raw.githubusercontent.com/heketi/heketi/master/extras/systemd/heketi.env
chown -R heketi:heketi /var/lib/heketi /var/log/heketi /etc/heketi
ufw disable
systemctl daemon-reload
systemctl enable --now heketi
systemctl status heketi
