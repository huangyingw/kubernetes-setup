#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add
apt install curl
snap install kube-controller-manager

apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt install -y kubeadm && \
    swapoff -a && \
    kubeadm init --pod-network-cidr=10.244.0.0/16

swapoff -a
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
#kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml

# ./setup_gluster.sh
# ../examples/volumes/glusterfs/deploy.sh
# ../examples/staging/persistent-volume-provisioning/README.md

# ./setup_heketi.sh
# configure_kubernetes_dynamic_volume_provisioning.sh
