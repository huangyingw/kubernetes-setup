#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

./remove_kubernetes_config.sh
./configure_kubernetes.sh

./openebs_all.sh
./metallb_all.sh
