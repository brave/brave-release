#!/bin/sh

set -eux

export BASE=$(pwd)/brave-keyring

wget https://brave-browser-apt-release.s3.brave.com/brave-core.asc
gpg --no-default-keyring --keyring "${BASE}/usr/share/keyrings/brave-keyring.gpg" --import brave-core.asc
rm -f brave-core.asc "${BASE}/usr/share/keyrings/brave-keyring.gpg~"
