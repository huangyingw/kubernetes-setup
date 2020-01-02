#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
apt install curl
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt install -y kubeadm && \
    swapoff -a && \
    hostnamectl set-hostname master-node && \
    kubeadm init --pod-network-cidr=10.244.0.0/16 && \
    mkdir -p $HOME/.kube && \
    cp -i /etc/kubernetes/admin.conf $HOME/.kube/config && \
    chown $(id -u):$(id -g) $HOME/.kube/config
