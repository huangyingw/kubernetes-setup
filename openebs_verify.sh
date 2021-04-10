#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

cat /etc/iscsi/initiatorname.iscsi
systemctl status iscsid
