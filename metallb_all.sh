#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

./metallb_preparation.sh
./metallb_installation.sh
./metallb_configure.sh
