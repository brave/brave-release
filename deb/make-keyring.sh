#!/bin/sh

set -eux

BASE=$(pwd)/brave-keyring

wget https://brave-browser-apt-release.s3.brave.com/brave-core.asc -O brave-core.asc

# Uncomment when/if we decide to move the keyring file to /usr/share/keyrings/ as recommended in:
# https://wiki.debian.org/DebianRepository/UseThirdParty

gpg --no-default-keyring --keyring ./tmp.gpg --import brave-core.asc
gpg --no-default-keyring --keyring ./tmp.gpg --export > "${BASE}/etc/apt/trusted.gpg.d/brave-browser-release.gpg"
rm -f tmp.gpg~ tmp.gpg brave-core.asc "${BASE}/etc/apt/trusted.gpg.d/brave-browser-release.gpg~"
