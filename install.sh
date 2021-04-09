#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

apt install -y curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add
snap install kube-controller-manager

apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt install -y kubeadm
swapoff -a
