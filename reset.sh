#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

rm -fr ~/.kube/
kubeadm init --pod-network-cidr=10.244.0.0/16
kubectl taint nodes --all node-role.kubernetes.io/master-
