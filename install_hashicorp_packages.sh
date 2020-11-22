#!/bin/bash
set -eu

DIST=$(lsb_release -cs)
ARCH=$(dpkg --print-architecture)

echo "Adding the APT keys..."
wget -qO- https://apt.releases.hashicorp.com/gpg | apt-key add -

echo "Adding the APT repository..."
echo "deb [arch=${ARCH}] https://apt.releases.hashicorp.com ${DIST} main" | tee /etc/apt/sources.list.d/hashicorp.list

if [[ $# != 0 ]]; then
  echo "Updating the APT cache..."
  apt-get update -qq

  echo "Installing the hashicorp packages: $*..."
  apt-get install -yq "$@"
fi