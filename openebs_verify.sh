#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

kubectl get pods -n openebs
kubectl get sc
kubectl get blockdevice -n openebs
# kubectl describe blockdevice blockdevice-c3f4da0efa6b0330fde5a02647a5f8df -n openebs
kubectl get sp
