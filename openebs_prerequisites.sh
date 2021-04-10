#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

apt-get update
apt-get install -y open-iscsi
systemctl enable --now iscsid
