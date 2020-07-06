#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

heketi-cli cluster list
echo -n "PASSWORD" | base64

kubectl create -f gluster-secret.yaml
kubectl get secret

kubectl delete storageclasses.storage.k8s.io gluster-heketi 
kubectl create -f gluster-sc.yaml
kubectl get sc

kubectl delete persistentvolumeclaims gluster-pvc 
kubectl create --save-config -f glusterfs-pvc.yaml
kubectl get  pvc
