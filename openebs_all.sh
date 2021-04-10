#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"


./prerequisites.sh
./verify.sh
./set_cluster_admin_user_context.sh
kubectl apply -f ./k8s/openebs-operator.yaml
