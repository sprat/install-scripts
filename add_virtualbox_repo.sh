#!/bin/bash
set -eu

DIST=$(lsb_release -cs)
ARCH=$(dpkg --print-architecture)

echo "Adding the APT keys..."
wget -qO- https://www.virtualbox.org/download/oracle_vbox_2016.asc | apt-key add -
wget -qO- https://www.virtualbox.org/download/oracle_vbox.asc | apt-key add -

echo "Adding the APT repository..."
echo "deb [arch=${ARCH}] https://download.virtualbox.org/virtualbox/debian ${DIST} contrib" | tee /etc/apt/sources.list.d/virtualbox.list
