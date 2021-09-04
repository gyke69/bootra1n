#!/bin/bash -e

# github.com/jawj/IKEv2-setup
# Copyright (c) 2015 – 2020 George MacKerron
# Released under the MIT licence: http://opensource.org/licenses/mit-license

echo
echo "=== https://github.com/jawj/IKEv2-setup ==="
echo


function exit_badly {
  echo "$1"
  exit 1
}

[[ $(lsb_release -rs) == "18.04" ]] || [[ $(lsb_release -rs) == "20.04" ]] || exit_badly "This script is for Ubuntu 20.04 or 18.04 only: aborting (if you know what you're doing, try deleting this check)"
[[ $(id -u) -eq 0 ]] || exit_badly "Please re-run as root (e.g. sudo ./path/to/this/script)"


echo "--- Adding repositories and installing utilities ---"
echo

export DEBIAN_FRONTEND=noninteractive

# see https://github.com/jawj/IKEv2-setup/issues/66 and https://bugs.launchpad.net/subiquity/+bug/1783129
# note: software-properties-common is required for add-apt-repository
apt-get -o Acquire::ForceIPv4=true update
apt-get -o Acquire::ForceIPv4=true install -y software-properties-common
add-apt-repository universe
add-apt-repository restricted
add-apt-repository multiverse

apt-get -o Acquire::ForceIPv4=true install -y moreutils dnsutils
