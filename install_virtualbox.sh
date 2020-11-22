#!/bin/bash
set -eu

VIRTUALBOX_VERSION="${VIRTUALBOX_VERSION:-6.1}"
KERNEL=$(uname -r)
DIST=$(lsb_release -cs)
ARCH=$(dpkg --print-architecture)

echo "Adding the APT keys..."
wget -qO- https://www.virtualbox.org/download/oracle_vbox_2016.asc | apt-key add -
wget -qO- https://www.virtualbox.org/download/oracle_vbox.asc | apt-key add -

echo "Adding the APT repository..."
echo "deb [arch=${ARCH}] https://download.virtualbox.org/virtualbox/debian ${DIST} contrib" | tee /etc/apt/sources.list.d/virtualbox.list

echo "Updating the APT cache..."
apt-get update -qq

echo "Installing the kernel headers..."
apt-get install -yq "linux-headers-${KERNEL}"

echo "Installing virtualbox..."
apt-get install -yq "virtualbox-${VIRTUALBOX_VERSION}"

echo "Installing the extension pack..."
EXTPACK_VERSION=$(vboxmanage --version | cut -d'r' -f1)
EXTPACK_FILENAME="Oracle_VM_VirtualBox_Extension_Pack-${EXTPACK_VERSION}.vbox-extpack"
wget -q "https://download.virtualbox.org/virtualbox/${EXTPACK_VERSION}/${EXTPACK_FILENAME}"
EXTPACK_LICENSE_SHA256=$(tar -xOf "${EXTPACK_FILENAME}" ./ExtPack-license.txt | sha256sum | cut -d' ' -f1)
VBoxManage extpack install --accept-license="${EXTPACK_LICENSE_SHA256}" "${EXTPACK_FILENAME}"

