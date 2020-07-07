#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

'
https://docs.gluster.org/en/latest/Install-Guide/Install/
https://wiki.myhypervisor.ca/books/linux/page/glusterfs-heketi-ubuntu-1804
'

apt install software-properties-common
add-apt-repository ppa:gluster/glusterfs-7
apt update
apt install -y glusterfs-server glusterfs-client

systemctl start glusterd
systemctl enable glusterd
systemctl status glusterd
glusterfsd --version

gluster peer probe gluster01
gluster peer probe gluster02

gluster peer status
gluster pool list

mkdir -p /media/nvme/glusterfs/distributed
gluster volume stop kube_vol
gluster volume delete kube_vol
gluster volume create kube_vol transport tcp 10.1.10.177:/media/nvme/glusterfs/distributed force
gluster volume start kube_vol
gluster volume info kube_vol

mkdir -p /mnt/glusterfs
mount -t glusterfs 10.1.10.177:/kube_vol /mnt/glusterfs
df -h /mnt/glusterfs
