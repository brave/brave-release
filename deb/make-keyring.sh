#!/bin/sh

set -eux

BASE=$(pwd)/brave-keyring
KEY_URL=${KEY_URL:-https://brave-browser-apt-release.s3.brave.com/brave-core.asc}

if [ ! -f ./brave-core.asc ]; then
  echo "No public key file (./brave-core.asc) detected in present working directory. Downloading)"
  wget "$KEY_URL" -O brave-core.asc
fi

# Uncomment when/if we decide to move the keyring file to /usr/share/keyrings/ as recommended in:
# https://wiki.debian.org/DebianRepository/UseThirdParty

if [ ! -d "${BASE}/etc/apt/trusted.gpg.d/" ]; then
  mkdir -p "${BASE}/etc/apt/trusted.gpg.d/"
fi

gpg --no-default-keyring --keyring ./tmp.gpg --import brave-core.asc
gpg --no-default-keyring --keyring ./tmp.gpg --export > "${BASE}/etc/apt/trusted.gpg.d/brave-browser-release.gpg"
rm -f tmp.gpg~ tmp.gpg brave-core.asc "${BASE}/etc/apt/trusted.gpg.d/brave-browser-release.gpg~"
