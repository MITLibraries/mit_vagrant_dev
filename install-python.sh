#!/usr/bin/env bash
# This script installs python and related tooling
#
# This script must be run as root:
# sudo sh install-python.sh

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Need to make python3 the default version

sudo apt-get update

sudo apt-get -y install python3-pip

pip3 install --user pipenv tox

python3 --version
pip3 --version
