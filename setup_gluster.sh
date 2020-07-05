#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

https://docs.gluster.org/en/latest/Install-Guide/Install/
apt install software-properties-common
add-apt-repository ppa:gluster/glusterfs-7
apt update
apt install -y glusterfs-server glusterfs-client

mkdir -p /media/nvme/glusterfs/distributed
gluster volume create kube_vol transport tcp 10.1.10.95:/media/nvme/glusterfs/distributed force
gluster volume start kube_vol
gluster volume info kube_vol
