#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

swapoff -a
kubeadm reset -f
rm -fr ~/.kube/
