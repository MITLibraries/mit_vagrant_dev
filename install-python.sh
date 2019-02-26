#!/usr/bin/env bash
# This script installs python and related tooling
#
# This script must be run as root:
# sudo sh install-python.sh

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python$1-dev -y
sudo apt-get install libxmlsec1-dev -y
sudo apt-get install pkg-config -y

wget https://bootstrap.pypa.io/get-pip.py
python$1 get-pip.py
python$1 -m pip install pipenv tox
