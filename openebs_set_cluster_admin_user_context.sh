#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

# ./.kube/config
kubectl config set-context admin-ctx --cluster=kubernetes --user=kubernetes-admin
kubectl config use-context admin-ctx
